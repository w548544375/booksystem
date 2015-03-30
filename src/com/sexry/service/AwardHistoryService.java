package com.sexry.service;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.sexry.app.AwardInfoGenerator;
import com.sexry.config.BookType;
import com.sexry.config.EBookType;
import com.sexry.model.*;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2014/12/17 0017.
 */
public class AwardHistoryService {
    /**
     * 存储开奖历史记录
     */
    public void saveAwardNumber(AwardTimeInfo timeInfo,AwardNumberInfo numberInfo){
        //SimpleDateFormat sdf = new SimpleDateFormat("yy-MM E HH:mm:ss");
        Map<String,Object> analyResult = new GetAwardService().anaylisNum(numberInfo.getWinningNumber().replace(" ",""));
        System.out.println("开始写入开奖历史");
        try {
                    new AwardHistory()
                    .set("period", timeInfo.getPreviousPeriod())  //开奖期数
                    .set("awardtime", System.currentTimeMillis())  //开奖时间
                    .set("awardcode", numberInfo.getWinningNumber().replace(" ", ""))//开奖号码
                    .set("plusnumber", analyResult.get("plusnumber")) //号码总和
                    .set("dt", EBookType.getName((Integer) analyResult.get("dt"))) //龙虎和
                    .set("fthree", EBookType.getName((Integer) analyResult.get("fthree"))) //前三
                    .set("mthree", EBookType.getName((Integer) analyResult.get("mthree"))) //中三
                    .set("bthree", EBookType.getName((Integer) analyResult.get("bthree"))) //后三
                    .set("odevity", EBookType.getName((Integer) analyResult.get("plusodevity"))) //单双
                    .set("size", EBookType.getName((Integer) analyResult.get("plussize")))
                    .save();
            System.out.println("开奖历史数据存入成功");
                    /**分析订单中奖情况*/
            anayliseAwardBook(timeInfo.getPreviousPeriod(),analyResult);
        }catch (Exception e){
            e.printStackTrace();
            System.out.println("开奖历史数据保存失败");
        }

    }

    /**
     * 分析是否中奖
     * @param awardPeriod 中间的期数
     * @param awardresult  分析的结果
     */
    public void anayliseAwardBook(String awardPeriod ,Map<String,Object> awardresult){
            //查找所有订单期数为period的订单
            String sql = "select * from sexry_bookdetail inner join sexry_bookhistory on sexry_bookhistory.bookcode = sexry_bookdetail.bookcode" +
                    " inner join sexry_user on sexry_user.id=sexry_bookhistory.user_id where"+
                    " sexry_bookhistory.awardperiods=?";

            List<Record> details = Db.find(sql,awardPeriod);

             Map<Integer,Float> multiples = findMultiple();
             if(details == null || details.size() == 0)
                    return;
            boolean bwin = true;
            for(Record record : details){
                String number = "";
                switch (record.getInt("booktype")){
                    case BookType.SINGLE_BALL_BIG://单球大
                     bwin =  (Integer)awardresult.get("b"+record.getInt("ballnumber"))==BookType.SINGLE_BALL_BIG ? true : false;
                        break;
                    case BookType.SINGLE_BALL_LITTER://单球小
                     bwin =  (Integer)awardresult.get("b"+record.getInt("ballnumber"))==BookType.SINGLE_BALL_LITTER ? true : false;
                        break;
                    case BookType.SINGLE_BALL_DOUBLE://双
                        bwin =  (Integer)awardresult.get("d"+record.getInt("ballnumber"))== BookType.SINGLE_BALL_DOUBLE ? true : false;
                        break;
                    case BookType.SINGLE_BALL_SINGLE://单
                        bwin =  (Integer)awardresult.get("d"+record.getInt("ballnumber"))==BookType.SINGLE_BALL_SINGLE ? true : false;
                        break;
                    case BookType.BALL_NUMBER://单球号数
                        bwin =  (Integer)awardresult.get("n"+record.getInt("ballnumber"))==record.getInt("number") ? true : false;
                        number = ""+record.getInt("number");
                        break;
                    case BookType.TOTAL_BIG://综合大
                        bwin =  (Integer)awardresult.get("plussize") == BookType.TOTAL_BIG ? true : false;
                        break;
                    case BookType.TOTAL_LITTER://zonghe xiao
                        bwin =  (Integer)awardresult.get("plussize") ==BookType.TOTAL_LITTER ? true : false;
                        break;
                    case BookType.TOTAL_DOUBLE://总和双
                        bwin = (Integer)awardresult.get("plusodevity") == BookType.TOTAL_DOUBLE ? true : false;
                        break;
                    case BookType.TOTAL_SINGLE://总和单
                        bwin = (Integer)awardresult.get("plusodevity") == BookType.TOTAL_SINGLE ? true : false;
                        break;
                    case BookType.DRAGON://long
                        bwin =  (Integer)awardresult.get("dt") ==  BookType.DRAGON ? true : false;
                        break;
                    case BookType.TIGER://hu
                        bwin =  (Integer)awardresult.get("dt") ==  BookType.TIGER ? true : false;
                        break;
                    case BookType.PEACE://HE
                        bwin =  (Integer)awardresult.get("dt") ==  BookType.PEACE ? true : false;
                        break;
                    case BookType.BAOZI://BAOZI
                        if ((Integer)record.get("ballnumber") == 7) { //前三
                            bwin = (Integer)awardresult.get("fthree") == BookType.BAOZI ? true : false;
                            break;
                        }else if((Integer)record.get("ballnumber") == 8){//中三
                            bwin = (Integer)awardresult.get("mthree") == BookType.BAOZI ? true : false;
                            break;
                        }else{ //后三
                            bwin = (Integer)awardresult.get("bthree") == BookType.BAOZI ? true : false;
                            break;
                        }
                    case BookType.DUIZ://duizi
                        if ((Integer)record.get("ballnumber") == 7) {
                            bwin = (Integer)awardresult.get("fthree") == BookType.DUIZ ? true : false;
                            break;
                        }else if((Integer)record.get("ballnumber") == 8){
                            bwin = (Integer)awardresult.get("mthree") == BookType.DUIZ ? true : false;
                            break;
                        }else{
                            bwin = (Integer)awardresult.get("bthree") == BookType.DUIZ ? true : false;
                            break;
                        }

                    case BookType.SHUNZI://顺子
                        if ((Integer)record.get("ballnumber") == 7) {
                            bwin = (Integer)awardresult.get("fthree") == BookType.SHUNZI ? true : false;
                            break;
                        }else if((Integer)record.get("ballnumber") == 8){
                            bwin = (Integer)awardresult.get("mthree") == BookType.SHUNZI? true : false;
                            break;
                        }else{
                            bwin = (Integer)awardresult.get("bthree") ==BookType.SHUNZI ? true : false;
                            break;
                        }

                    case BookType.BANSHUN://半顺
                        if ((Integer)record.get("ballnumber") == 7) {
                            bwin = (Integer)awardresult.get("fthree") ==BookType.BANSHUN ? true : false;
                            break;
                        }else if((Integer)record.get("ballnumber") == 8){
                            bwin = (Integer)awardresult.get("mthree") == BookType.BANSHUN? true : false;
                            break;
                        }else{
                            bwin = (Integer)awardresult.get("bthree") ==BookType.BANSHUN ? true : false;
                            break;
                        }
                    case BookType.ZALIU://杂六
                        if ((Integer)record.get("ballnumber") == 7) {
                            bwin = (Integer)awardresult.get("fthree") ==  BookType.ZALIU ? true : false;
                            break;
                        }else if((Integer)record.get("ballnumber") == 8){
                            bwin = (Integer)awardresult.get("mthree") == BookType.ZALIU ? true : false;
                            break;
                        }else{
                            bwin = (Integer)awardresult.get("bthree") ==  BookType.ZALIU ? true : false;
                            break;
                        }
                    }//switch
                    float awardmoney = 0;
                    if (!bwin){
                        awardmoney = -record.getFloat("money");
                    }else{
                        awardmoney = record.getFloat("money") * (multiples.get(record.getInt("booktype"))-1);
                    }
                    //球号数
                String typestring = EBookType.getName(record.getInt("booktype"));
                int ballnumber = record.getInt("ballnumber");
                int number1 = record.getInt("number");
                if (ballnumber <= 5){
                    if(number1 != -1){
                        typestring = "第"+ballnumber+"球-"+number1;
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
                    //存入数据库
                    new AwardResult().set("bookcode",record.getStr("bookcode"))
                                     .set("username",record.getStr("bookuser_name"))
                                     .set("user_id",record.getInt("user_id"))
                                     .set("period",awardPeriod)
                                     .set("type",typestring)
                                     .set("money",record.getFloat("money"))
                                     .set("result",awardmoney)
                                     .set("booktime",record.getLong("booktime"))
                                     .set("backresult",awardmoney)
                                    // .set("booktype",record.getInt("booktype")) //写入类型
                            .save();
                //更新user的信用额度
                    Float curent = record.getFloat("curentcredit");

                    if(bwin){
                        curent += record.getFloat("money") * (multiples.get(record.getInt("booktype"))-1);
                    }else{
                         curent -= record.getFloat("money");
                    }
                    User.dao.findFirst("select * from sexry_user where username=?",record.getStr("username")).set("curentcredit",curent).update();

                }//for
            //要把这期的状态置为以处理
            List<BookHistory> historys = BookHistory.bookHistoryDao.find("select * from sexry_bookhistory where awardperiods=?", awardPeriod);
            if(historys!=null && historys.size()>0) {
                for (BookHistory history : historys) {
                    history.set("isAwarded", 1).update();
                }
            }
    }


    private Map<Integer,Float> findMultiple(){
        Map<Integer,Float> re_map = new HashMap<Integer, Float>();
        String sql = "select * from sexry_bookdefine";
        List<Record>  records = Db.find(sql);
        for (Record record: records){
            re_map.put(record.getInt("booktype"),record.getFloat("multiple_number"));
        }
        return re_map;
    }

    /**
     *    获取今日的历史记录
     * @param page
     * @param pagesize
     * @param date
     * @return
     */
    public Map<String,Object> getAwardHistory(int page,int pagesize,long date){
        try {
            Page pagedata = Db.paginate(page, pagesize, "select *", "from sexry_awardhistory where awardtime > ? order by awardtime desc", date);
            List<Record> awardhistorys = pagedata.getList();
            Map<String, Object> re_map = new HashMap<String, Object>();
            List<Object> rows = new ArrayList<Object>();
            SimpleDateFormat sdf = new SimpleDateFormat("YY-MM-DD E HH:mm:ss");
            for (Record history : awardhistorys) {
                Map<String, Object> listMap = new HashMap<String, Object>();
                listMap.put("period", history.getStr("period"));
                listMap.put("awardtime", sdf.format(Long.parseLong(history.getStr("awardtime"))));
                listMap.put("awardcode", history.getStr("awardcode"));
                listMap.put("plusnumber", history.getLong("plusnumber"));
                listMap.put("dt", history.getStr("dt"));
                listMap.put("fthree", history.getStr("fthree"));
                listMap.put("mthree", history.getStr("mthree"));
                listMap.put("bthree", history.getStr("bthree"));
                listMap.put("odevity", history.getStr("odevity"));
                listMap.put("size", history.getStr("size"));
                rows.add(listMap);
            }
            re_map.put("Rows", rows);
            re_map.put("totalpage", pagedata.getTotalPage());
            re_map.put("totalrows", pagedata.getTotalRow());
            re_map.put("pagesize", pagedata.getPageSize());
            re_map.put("pagenumber", pagedata.getPageNumber());
            return re_map;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }




}
