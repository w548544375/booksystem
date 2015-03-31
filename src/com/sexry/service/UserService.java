package com.sexry.service;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.sexry.config.EBookType;
import com.sexry.model.User;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by sexry on 1/18/15.
 */
public class UserService {
    /**
     * 封号/解封
     * @param username  解封禁用的用户
     * @param bind true 禁用，false 解封
     *
     * @return
     */
    public  String bindUser(String username,boolean bind){
        try {

            if(validateUserName(username))
                    return "非法的用户名";

            User user = User.dao.find("select * from sexry_user where username=?", username).get(0);
            user.set("isbind",bind ? 1 : 0).update();
        }catch(Exception e){
            e.printStackTrace();
            return "操作失败!请确认用户信息正确！";
        }
        return "成功"+(bind ? "禁用" : "启用")+"用户:"+username;
    }

    /**
     * 修改密码
     * @param username 修改密码的用户名
     * @param oldpassword  原密码
     * @param newpassword  新密码
     * @param force   是否强制修改密码
     * @return
     */
    public String updatePassword(String username,String oldpassword,String newpassword,boolean force){
        try{
            if(validateUserName(username))
                return "非法的用户名";

            User user = User.dao.find("select * from sexry_user where username=?", username).get(0);
            //是否强制修改
            if (!force){
                if(!oldpassword.equals(user.getStr("password"))){
                    return "原密码错误";
                }
            }
            //修改密码
            user.set("password",newpassword).update();
        }catch(Exception e){
            return "操作失败,请确认用户信息正确!";
            }
        return "suc";
        }

    /**
     * 下发帐号
     * @param giver  下发帐号的用户
     * @param newusername  新帐号
     * @param newpassowrd  帐号密码
     * @param curedit      信用额度
     * @param hasprivileges  是否具有权限下发帐号
     * @param bind      是否禁用
     * @return
     */
    public String newUser(String giver,String newusername,String newpassowrd,float curedit,boolean hasprivileges,boolean bind) {
        try{

            if(validateUserName(giver))
                return "非法的用户名！";
            if(validateUserName(newusername))
                return "非法的新用户名！";
            User user = User.dao.find("select * from sexry_user where username=?", giver).get(0);
            if(user.getInt("hasprivileges") ==  0){
                return "你没有权限下发帐号！";
            }
            if(user.getInt("isbind") == 1){
                return "你的帐号已经被封，你无权进行此操作！";
            }

            int exist =User.dao.find("select * from sexry_user where username=?",newusername).size();
            if(exist > 0)
                return "此用户已经存在";

            new User().set("username",newusername)  //用户名
                      .set("password",newpassowrd)  //密码
                      .set("curentcredit",curedit)  //当前信用额度
                      .set("maxcredit",curedit)     //最大信用额度
                      .set("isbind",bind ? 1 : 0)   //是否禁用
                      .set("pid",user.getInt("id"))  //下发帐号的用户id
                      .set("hasprivileges", hasprivileges ? 1 : 0)  //是否有权限下发帐号
                      .save();

        }catch(Exception e){
            e.printStackTrace();
            return "操作失败，请输入正确的用户信息！";
        }
        return "suc";
        }

    /**
     *  获取用户树
     * @param username
     */
        public Map<String,Object> getUserTree(String username){
            try{
                //验证用户名是否合法
                if(validateUserName(username))
                    return null;
                //查找用户
                User user = User.dao.find("select * from sexry_user where username=?", username).get(0);
                Map<String,Object> result = new HashMap<String, Object>();
                findChildUsers(user.getInt("id"), user.getStr("username"), result);
                return result;
            }catch(Exception e){
                    e.printStackTrace();
                    return null;
            }
        }

    /**
     *  找到parentId的所有子帐号
     * @param parentId
     * @param users
     */
        public void findChildUsers(int parentId,String parentname,Map<String,Object> users){
            List<User> finduser = User.dao.find("select id,username as name from sexry_user where pid=?",parentId);
            if(finduser.size() != 0){
                List<Object> objs = new ArrayList<Object>();
                for(User user : finduser){
                   Map<String,Object> u = new HashMap<String, Object>();
                    u.put("id", user.getInt("id"));
                    u.put("name", user.getStr("name"));
                    objs.add(u);
                }
                users.put("id",parentId);
                users.put("name",parentname);
                users.put("children",objs);
                for(User user : finduser){
                    for(Map<String,Object> obj : (List<Map<String,Object>>)users.get("children")){
                            if(obj.get("name").equals(user.getStr("name")))
                                findChildUsers(user.getInt("id"),user.getStr("name"),obj);
                    }

                }
            }else{
                users.put("id",parentId);
                users.put("name",parentname);
            }
        }

    /**
     *  只查询子账户，不包括自己
     * @param parentId
     * @param sb
     */
      public void findChildUsersId(int parentId,StringBuilder sb){
          List<Record> finduser = Db.find("select id from sexry_user where pid=?",parentId);
          if (finduser.size() > 0){
              for(Record record : finduser){
                  sb.append(record.getInt("id")+",");
                    findChildUsersId(record.getInt("id"),sb);
              }
            }

        }



    /***
     * 查询用户的输赢历史
     * @param starttime  起始时间
     * @param endtime     结束时间
     * @param userids       一个或者多个用户名用<stong>,</stong>隔开
     * @param periods     期号
     * @param startplace 起始列
     * @param persize  大小
     * @return
     */
        public Page<Record> historyQuery(long starttime,long endtime,String userids,String periods,int startplace,int persize){
            try{
            StringBuilder hql = new StringBuilder();
            hql.append("from sexry_result where 1=1");
            if(starttime != 0){
                hql.append(" and starttime >= "+starttime);
            }
            if(endtime != 0){
                hql.append(" and endttime <="+endtime);
            }
            if(userids != null && !userids.equals("")){
                hql.append(" and user_id in ("+userids+")");
            }
            if(periods!= null && !periods.equals("")) {
                hql.append(" and period in (" + periods + ")");
            }
            int page = startplace/persize+1;
            //按条件查询出记录
            Page<Record> results = Db.paginate(page,persize,"select * ",hql.toString());
                return results;
            }catch (Exception e){
                e.printStackTrace();
                return null;
            }
        }


    public List<Object> caculateWin(long starttime,long endtime,String userids,String periods){
        StringBuilder sql = new StringBuilder();
        sql.append("select * from sexry_result where 1=1 ");
        if(starttime != -1){
            sql.append(" and starttime >= "+starttime);
        }
        if(endtime >= -1){
            sql.append(" and endttime <="+endtime);
        }
        if(userids != null && !userids.equals("")){
            sql.append(" and user_id in ("+userids+")");
        }
        if(periods!= null && !periods.equals("")){
            sql.append(" and period in ("+periods+")");
        }
        List<Record> records = Db.find(sql.toString());

        List<Object> result = new ArrayList<Object>();

        float totalMoney = 0; //总下注金额
        float totalWin = 0;  //总输赢
        for (Record record : records ){
            float perMoney = record.getFloat("money");


            }
        return result;
    }




    /**
     *  获取所有用户的订单
     * @param ids  要查询的用户订单的id集合用<strong>,</strong>分开
     * @return
     */
       public List<Map<String,Object>> allUnhandledBook(String ids){
           try {

               List<Map<String,Object>> historys =  new ArrayList<Map<String, Object>>();
               List<Record> records =  Db.find("select * from sexry_bookhistory  where isAwarded = ? and user_id in ("+ids+") order by booktime desc", 0);

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
                       map.put("user",record.getStr("bookuser_name"));//下注人的名字
                       historys.add(map);
                   }
               }

            return historys;
           }catch (Exception e){
               e.printStackTrace();
               return null;
         }
       }

    /**
     * 验证用户是否有权限
     * @param username
     * @return
     */
    public boolean userPrivileges(String username){
        User user = User.dao.find("select * from sexry_user where username=?", username).get(0);
        return user.getInt("hasprivileges") == 1? true : false;
    }









    /**
     * 验证用户名是否合法
     * @param username
     * @return  true 表示用户名不合法  false 表示很用户名合法
     */
    public boolean validateUserName(String username){
        String regEx="[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
        Pattern p   =   Pattern.compile(regEx);
        Matcher match=p.matcher(username);
        return match.matches();
    }



}
