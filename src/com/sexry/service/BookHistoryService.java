package com.sexry.service;


import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.sexry.config.BookType;
import com.sexry.config.EBookType;
import com.sexry.model.BookDetail;
import com.sexry.model.BookHistory;
import com.sexry.model.User;


import java.awt.print.Book;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by Administrator on 2014/12/17 0017.
 */
public class BookHistoryService {

    public static final long DAY_MILLS = 24*60*60*1000;



    /***
     * 保存订单历史
     *  {3|大-122,小-122,}&{4|小-33,}&{6|总和单-32,}&
     *  数据格式说明：
     *    3| 1-5表示1-5号球 大于5的表示其他总和大小单双豹子对子之类的
     *    大-122 -前面用大小单双表示，如果下注的号码就用0-9表示 -后面是下注金额
     *@param period    订单的期号
     *@param username  订单的下单人
     * @param bookstr  订单详情
     */
        public Map<String,Object> saveBookHistory(String period,String username,String bookstr){
            try {
                String[] books = bookstr.split("&");  //[{3|大-122,小-122,},{4|小-33,},{6|总和单-32,} ];
                //用来存储单个订单
                Map<Integer, Object> bookmap = new HashMap<Integer, Object>();

                //订单编号
                String bookcode = generateBookCode();
                //下单时间
                long booktime = System.currentTimeMillis();


                for (String str : books) {
                    //去除两边的大括号和最后一个逗号 3|大-122,小-122
                    str = str.substring(1, str.length() - 2);
                    //用|分开
                    String[] temp = str.split("\\|");
                    //存储方式 key-> 1 value->大-122,小-122
                    if(bookmap.containsKey(Integer.parseInt(temp[0]))) {
                        String iscontain = (String) bookmap.get(temp[0])+temp[1];
                        bookmap.put(Integer.parseInt(temp[0]),iscontain);
                    }else{
                        bookmap.put(Integer.parseInt(temp[0]), temp[1]);
                    }
                }
                //遍历map进行处理
                Set<Map.Entry<Integer, Object>> entrySet = bookmap.entrySet();
                Iterator<Map.Entry<Integer, Object>> iterator = entrySet.iterator();

                User user = User.dao.find("select id from sexry_user where username=?",username).get(0);

                //存入数据库
                new BookHistory().set("bookcode",bookcode)//订单号码
                                 .set("bookuser_name", username) //下订单的用户名
                                 .set("user_id",user.getInt("id"))//下订单的用户id
                                 .set("awardperiods", period)//下订单的期数
                                 .set("booktime",booktime)//下订单的时间
                                 .set("isAwarded",0)
                                 .save(); //存储



                while (iterator.hasNext()) {
                    Map.Entry<Integer, Object> entry = iterator.next();
                    int booknumber = entry.getKey();
                    Map<String,Object> in = null;
                    //判断每个订单金额是否大于最小值，小于最大值，以及是否是数字，任意条件不满足都返回错误信息，否则返回null
                    in = isBetweenMinandMax(bookcode,(String)entry.getValue());
                    if(!(in == null)){
                        return in;
                    }
                    //生成订单map
                    List<Map<String, Object>> book = this.generateNumberBook(bookcode, booknumber, (String) entry.getValue());
                    for (int i = 0; i < book.size(); i++) {
                        new BookDetail().setAttrs(book.get(i)).save();
                    }
                }
                //判断是否超过最大下注金额
                if(!isInRule(username,period,bookcode)){
                    Map<String,Object> errmap = new HashMap<String, Object>();
                    errmap.put("error","largeThanTotal");
                    return errmap;
                    }



                //返回打印数据
                Map<String,Object> printmessage = new HashMap<String, Object>();
                SimpleDateFormat sdf = new SimpleDateFormat("YYYY/MM/DD HH:mm:ss");
                printmessage.put("bookcode",bookcode);
                printmessage.put("booktime",sdf.format(booktime));
                printmessage.put("bookperiod",period);
                printmessage.put("bookuser",username);
                return printmessage;
            }catch (Exception e){
                e.printStackTrace();
                return null;
            }
        }

    /**
     *  生成号数的订单
     *  @param bookcode 订单编号
     * @param ballnumber  球的号数
     * @param bookdetail  订单详情
     *                    大-122,小-122
     */
        public List<Map<String,Object>> generateNumberBook(String bookcode,int ballnumber,String bookdetail){
                //存储订单的map
              String[] books = bookdetail.split(",");
            List<Map<String,Object>> result = new ArrayList<Map<String, Object>>();
              for(String str:books) {
                  String[] temp = str.split("-"); //[大,122];
                  Map<String, Object> bookRecord = new HashMap<String, Object>();

                  bookRecord.put("ballnumber", ballnumber);//第几球
                  int type = EBookType.getType(temp[0]);
                  bookRecord.put("booktype",type); //类型 球号还是大小单双
                  if(type == BookType.BALL_NUMBER){ //买球的号数的号数的时候
                    bookRecord.put("number",Integer.parseInt(temp[0]));
                  }
                  bookRecord.put("money",Float.parseFloat(temp[1])); //下单金额
                  bookRecord.put("bookcode",bookcode);//订单编号
                  result.add(bookRecord);
              }
                return  result;
        }

    /**
     *   判断订单是否超过最大订单金额  <total
     * @param username
     * @param periods
     * @param bookcode
     * @return
     */
        public boolean isInRule(String username,String periods,String bookcode){
            //查询当前用户在当前期数所下的订单
           List<BookHistory> histories =
                   BookHistory.bookHistoryDao.find("select bookcode from sexry_bookhistory where bookuser_name=? and awardperiods=?",username,periods);
            //

            if(histories.size() > 0){
                String bookcodes = "";
              for(BookHistory bookHistory : histories){
                 bookcodes += bookHistory.getStr("bookcode")+",";
              }
                bookcodes = bookcodes.substring(0,bookcodes.length()-1);
                //查询用户当前订单的金额
                List<Record> details = Db.find("select booktype,sum(money) as totalmoney from sexry_bookdetail where bookcode in ("+bookcodes+") group by booktype,ballnumber,number");
                //判断是否超过总和的最大值
                for(Record record : details){
                  Record control =  Db.find("select total from sexry_bookcontrol where booktype=?",record.getInt("booktype")).get(0);
                    //如果总金额数超过最大金额，删除bookdetail和bookhistory中订单号喂bookcode的记录
                    if(control.getFloat("total") < record.getDouble("totalmoney")){
                        //删除订单历史纪录
                        BookHistory history = BookHistory.bookHistoryDao.find("select * from sexry_bookhistory where bookcode=?",bookcode).get(0);
                        history.delete();
                        //删除订单详细
                        List<BookDetail> bookDetails = BookDetail.bookDetailDao.find("select * from sexry_bookdetail where bookcode=?",bookcode);
                        for (BookDetail detail : bookDetails){
                            detail.delete();
                        }
                        return false;
                    }
                }
            }

                return true;

        }

    /**
     * 判断下单金额是否在金额限制之内 min < ? < max
     * @param bookcode
     * @param bookdetail
     * @return
     */
    public Map<String,Object> isBetweenMinandMax(String bookcode,String bookdetail){
        //存储订单的map
        Map<String,Object> remap = new HashMap<String, Object>();
        String[] books = bookdetail.split(",");
        for(String str : books){
            String[] temp = str.split("-"); //[大,122];
            //判断是否是正确的数字
            if(!isNumber(temp[1])){
                remap.put("error","notNumber");
                BookHistory history = BookHistory.bookHistoryDao.find("select * from sexry_bookhistory where bookcode=?",bookcode).get(0);
                history.delete();
                return remap;
            }

            int type = EBookType.getType(temp[0]);
            Record record = Db.find("select min,max from sexry_bookcontrol where booktype=?",type).get(0);
            Float curentMoney = Float.parseFloat(temp[1]);
            if( curentMoney < record.getFloat("min")){
                remap.put("error","underMin");
                BookHistory history = BookHistory.bookHistoryDao.find("select * from sexry_bookhistory where bookcode=?",bookcode).get(0);
                history.delete();
                return remap;
            }else if(curentMoney > record.getFloat("max")){
                remap.put("error","uponMax");
                BookHistory history = BookHistory.bookHistoryDao.find("select * from sexry_bookhistory where bookcode=?",bookcode).get(0);
                history.delete();
                return remap;
            }
        }
        return null;
    }

    /**
     *  判断是否是数字
     * @param str
     * @return
     */
    public boolean isNumber(String str)
    {
        java.util.regex.Pattern pattern=java.util.regex.Pattern.compile("[0-9]*");
        java.util.regex.Matcher match=pattern.matcher(str);
        if(match.matches()==false)
        {
            return false;
        }
        else
        {
            return true;
        }
    }


    /**
     * 生成订单号，从文件读取订单号
     * @return  订单号
     */
        private synchronized String generateBookCode(){
            File file = new File("bookcode.dat");
            System.out.println(file.getAbsoluteFile());
            if (file.exists()){
                try {
                    //读取文件
                    FileInputStream fis = new FileInputStream(file);
                    byte[] buf = new byte[32];
                    StringBuffer sb=new StringBuffer();
                    while (fis.read(buf)!=-1){
                        sb.append(new String(buf));
                    }
                       Long curentNumber =  Long.parseLong(sb.toString().trim());
                       fis.close();
                    FileOutputStream fos = new FileOutputStream(file);
                    //加1写入文件
                    fos.write(Long.toString(curentNumber+1).getBytes());
                    fos.close();
                    return  curentNumber+"";
                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }else{
                try {
                    //没有文件的时候创建一个再写入
                    file.createNewFile();
                    FileOutputStream fos = new FileOutputStream(file);
                    fos.write(Long.toString(1000000L).getBytes());
                    fos.close();
                    return "1000000";
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            return null;
        }

    /**
     *   获取所有未处理的订单
     * @param username  用户的名字
     * @param page      页数
     * @param pagesize  每页大小
     * @return
     */
    public Map<String,Object> getUnhandleBookHistory(String username,int page,int pagesize){
            try {
                Map<String,Object> re_map = new HashMap<String, Object>();
                List<Map<String,Object>> historys =  new ArrayList<Map<String, Object>>();
               Page<Record> pagerecord =  Db.paginate(page, pagesize, "select *", "from sexry_bookhistory  where isAwarded = ? and bookuser_name=? order by booktime desc", 0, username);
                List<Record> records = pagerecord.getList();
                SimpleDateFormat sdf = new SimpleDateFormat("YY-MM E HH:mm:ss");

                //user所有未处理的订单
                for(Record record : records){
                    Map<String,Object> map = new HashMap<String, Object>();
                    String bookcode = record.getStr("bookcode");
                    //查询出所有的订单详细
                   String hql = "select sexry_bookdetail.*,sexry_bookdefine.multiple_number as multiple from sexry_bookdetail inner join sexry_bookdefine on sexry_bookdetail.booktype = sexry_bookdefine.booktype  where sexry_bookdetail.bookcode=?";
                   List<Record> details =  Db.find(hql, bookcode);
                    //遍历订单详细
                    String detailstring ="";
                    //下单总金额
                    float money=0;
                    //每个订单的可赢金额
                    float awardmoney = 0;
                    for(Record detail: details){
                        //赔率
                        float multiple = detail.getFloat("multiple");
                        //下注类型
                        String typestring = EBookType.getName(detail.getInt("booktype"));
                        int ballnumber = detail.getInt("ballnumber");
                        int number = detail.getInt("number");
                        if (ballnumber <= 5){
                            if(number != -1){
                               typestring = "第"+ballnumber+"球-"+number;
                            }else{
                                typestring="第"+ballnumber+"球-"+typestring;
                            }
                        }
                       switch (ballnumber){
                           case 6:
                               break;
                           case 7:
                               typestring = "前"+typestring.substring(0,1);
                               break;
                           case 8:
                               typestring = "中"+typestring.substring(0,1);
                               break;
                           case 9:
                               typestring = "后"+typestring.substring(0,1);
                               break;
                       }
                        //
                        detailstring = typestring+"@"+multiple+"倍x"+detail.getFloat("money")+"元<br/>";
                        //下注金额
                        float singlemoney = detail.getFloat("money");
                        money = singlemoney;
                        awardmoney = singlemoney * (multiple-1);

                        map.put("bookmoney",money);
                        map.put("bookcode",record.getStr("bookcode"));//订单号
                        map.put("booktime", sdf.format(record.getLong("booktime")));//下单时间
                        map.put("bookstring",detailstring);//订单详细
                        map.put("bookperiod",record.getStr("awardperiods"));//下注期数
                        map.put("awardmoney",awardmoney);//可赢金额

                        historys.add(map);
                    }
                }
                re_map.put("Rows",historys);
                re_map.put("page",pagerecord.getPageNumber());
                re_map.put("totalpage",pagerecord.getTotalPage());
                re_map.put("totalrow",pagerecord.getTotalRow());
                re_map.put("pagesize",pagerecord.getPageSize());
                return re_map;
            }catch (Exception e){
                e.printStackTrace();
                return null;
            }

        }

    /**
     *   获取已经处理的订单
     * @param page
     * @param pagesize
     * @return
     */
        public Map<String,Object> getHandledBook(int page,int pagesize,String username){
            try {
                Calendar calendar = Calendar.getInstance();
                calendar.set(Calendar.HOUR_OF_DAY, 0);
                calendar.set(Calendar.MINUTE,0);
                Page pagedata = Db.paginate(page, pagesize, "select * ", "from sexry_result where booktime >? and username=? order by booktime desc", calendar.getTimeInMillis(),username);
                Map<String, Object> re_map = new HashMap<String, Object>();
                List<Map<String, Object>> historys = new ArrayList<Map<String, Object>>();
                List<Record> records = pagedata.getList();
                SimpleDateFormat sdf = new SimpleDateFormat("YY-MM E HH:mm:ss");
                for (Record record : records) {
                    Map<String, Object> map = new HashMap<String, Object>();
                    map.put("booktime", sdf.format(record.getLong("booktime")));
                    map.put("bookcode", record.getStr("bookcode"));
                    map.put("booktype", record.getStr("type"));
                    map.put("bookmoney", record.getFloat("money"));
                    map.put("result", record.getFloat("result"));
                    map.put("bookperiod", record.getStr("period"));
                    historys.add(map);
                }
                re_map.put("Rows", historys);
                re_map.put("page", pagedata.getPageNumber());
                re_map.put("totalpage", pagedata.getTotalPage());
                re_map.put("totalrow", pagedata.getTotalRow());
                re_map.put("pagesize", pagedata.getPageSize());
                return re_map;
            }catch (Exception e){
                e.printStackTrace();
                return null;
            }
        }

        //从现在开始的前几周订单总和

    /**
     *
     * @param weeks 0表示当前周  1表示从现在的过去第一周 2表示从现在的过去第二周
     */
      public Map<String,Object> weekRecord(int weeks,String username){
            try {
                Calendar now = Calendar.getInstance();
                now.set(Calendar.HOUR_OF_DAY, 24);
                now.set(Calendar.MINUTE, 0);
                now.set(Calendar.SECOND, 0);
                int day = now.get(Calendar.DAY_OF_WEEK);
                long day1 = now.getTimeInMillis() - (7 * (weeks + 1) + day) * DAY_MILLS;
                long day7 = now.getTimeInMillis() + (7 - day - 7 * weeks) * DAY_MILLS;
                //System.out.println(day1+":::::"+day7);


                SimpleDateFormat sdf = new SimpleDateFormat("MM-DD E");
                List<Record> records = Db.find("select * from sexry_result where booktime>? and booktime < ? and username=?", day1, day7, username);
                Map<String,Object> result = new HashMap<String, Object>();
                for (Record record:records){
                    String bookdate = sdf.format(record.getLong("booktime"));
                    if (!result.containsKey(bookdate)){
                        Map<String,Object> dayrecord = new HashMap<String, Object>();
                        dayrecord.put("daymoney",0.0f);//当天下单总金额
                        dayrecord.put("daybookcount",0);//当天下单总数
                        dayrecord.put("dayresult",0.0f);//当天的输赢结果
                        dayrecord.put("dayback",0.0f);//当天的退水
                        dayrecord.put("daybackresult",0.0f);//当天的退水结果
                        result.put(bookdate,dayrecord);
                    }
                        Map<String,Object> dayrecord = (Map<String, Object>) result.get(bookdate);
                        dayrecord.put("daymoney",(Float)dayrecord.get("daymoney")+record.getFloat("money"));//更新当天下单总金额
                        dayrecord.put("daybookcount",(Integer)dayrecord.get("daybookcount")+1);//更新当天下单总数
                        dayrecord.put("dayresult",(Float)dayrecord.get("dayresult")+record.getFloat("result"));//更新当天输赢结果
                        dayrecord.put("dayback",(Float)dayrecord.get("dayback")+record.getFloat("back"));//更新当天退水
                        dayrecord.put("daybackresult",(Float)dayrecord.get("daybackresult")+record.getFloat("backresult"));//更新当天退水结果

                }



                return result;
            }catch (Exception e){
                e.printStackTrace();
            }
          return null;
      }

    /**
     *  判断用户能否下单
     * @param username
     * @return
     */
       public  boolean  canBook(String username){
           try {
               Record user = Db.find("select curentcredit from sexry_user where username = ?", username).get(0);
               return user.getFloat("curentcredit") > 0 ? true : false;
           }catch (Exception e){
               e.printStackTrace();
               return false;
           }
       }
}
