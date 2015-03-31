package com.sexry.controller;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.sexry.service.UserService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 管理用户
 * Created by sexry on 1/18/15.
 */
public class UserController extends Controller{

    private UserService userService =  new UserService();

  public void index(){
          renderJsp("/userTree.jsp");
  }


    /**
     * 取得用户树
     */
    @ActionKey("/user/tree")
  public void getUserTree()
  {
      renderJson(userService.getUserTree((String) getSessionAttr(LoginController.SESSION_KEY_LOGIN_USER)));
  }

    /***
     * 下发帐号
     */
    @ActionKey("/user/addUser")
     public void addUser(){
            String username = getPara("username");
            String password = getPara("password");
            String confirm = getPara("confirm");
            //空值验证
            if(username.equals(""))
            {
                renderText("缺少帐号信息!");
                return;
            }
            if(password.equals("")){
                renderText("请输入密码!");
                return;
            }

           String  hasprivileges = getPara("userprivileges");
            String code = getPara("code").trim().toUpperCase();
            if(!password.equals(confirm)){
                renderText("2次输入的密码不一致");
                return;
            }
            if(!code.equals(getSessionAttr(LoginController.SESSION_KEY_IMG))){
                renderText("验证码不正确！");
                return;
            }
              boolean privilegets = hasprivileges == null ? false : true;
                renderText(userService.newUser((String) getSessionAttr(LoginController.SESSION_KEY_LOGIN_USER),username,password,50000,privilegets,false));
    }

    /**
     * 改变密码
     */
    @ActionKey("/user/changePassword")
    public void changePassword(){
        String old = getPara("oldpassword");
        String newp = getPara("newpassword");
        String confirm = getPara("newconfirm");
        //空值验证
        if(old.equals("")){
            renderText("密码不能为空");
            return;
        }

        if(newp.equals("")){
            renderText("密码不能设置为空");
            return;
        }

        if(!newp.equals(confirm)){
            renderText("两次输入的密码不一致");
            return;
        }

        renderText(userService.updatePassword((String) getSessionAttr(LoginController.SESSION_KEY_LOGIN_USER), old, newp, false));

    }
    //判断用户的页面权限，是否显示操作中心
    @ActionKey("/user/hasPrivileges")
    public void userHasPrivileges(){
        renderJson(userService.userPrivileges((String) getSessionAttr(LoginController.SESSION_KEY_LOGIN_USER)));
    }

    /**
     *  获取输赢
     * @throws ParseException
     */
    @ActionKey("/user/groupResult")
    public void queryGroupResult() throws ParseException {

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
             String startTime = getPara("startTime");
             String endTime = getPara("endTime");
             long startTimel= 0;
             long endTimel = 0;
            if(startTime != null && !"".equals(startTime) ) {
                startTimel = sdf.parse(startTime).getTime();
                }
            if(endTime != null && !"".equals(endTime) ) {
                endTimel = sdf.parse(endTime).getTime();
                }
            String period = getPara("peroid");
            int i = getSessionAttr(LoginController.SESSION_KEY_USERID);
            String type = getPara("type");
            String ids = getParaToInt("ids") == 0 ? i + "" : getPara("ids");;
           if("2B".equals(type)){
                    StringBuilder stringBuilder = new StringBuilder();
                    userService.findChildUsersId(Integer.parseInt(ids),stringBuilder); //查询子账号
                    ids = stringBuilder.deleteCharAt(stringBuilder.length()-1).toString();
                }
            int start = getParaToInt("iDisplayStart");
            int size =  getParaToInt("iDisplayLength");
            Page<Record> records = userService.historyQuery(startTimel,endTimel,ids,period,start,size);
            Map<String,Object> result = new HashMap<String,Object>();
            result.put("sEcho",getPara("sEcho"));
            result.put("data",records.getList());
            result.put("iTotalRecords",records.getTotalRow());
            result.put("iTotalDisplayRecords",records.getTotalRow());
            renderJson(result);
    }


    @ActionKey("/user/groupBook")
    public void queryGroupBook(){
        try {
            int i = getSessionAttr(LoginController.SESSION_KEY_USERID);
            String ids = getParaToInt("ids") == 0 ? i + "" : getPara("ids");
            String type = getPara("type");
            if ("2A".equals(type)) {
                StringBuilder stringBuilder = new StringBuilder();
                userService.findChildUsersId(Integer.parseInt(ids), stringBuilder); //查询子账号
                ids = stringBuilder.deleteCharAt(stringBuilder.length() - 1).toString();
            }
            int istart = getParaToInt("iDisplayStart");
            int length = getParaToInt("iDisplayLength");
            Map<String, Object> books = userService.allUnhandledBook(istart, length, ids);
            books.put("data", books.get("data"));
            books.put("sEcho", getPara("sEcho"));
            books.put("iTotalRecords", books.get("totalRow"));
            books.put("iTotalDisplayRecords", books.get("totalRow"));
            renderJson(books);
        }catch (Exception e){
            e.printStackTrace();
            renderText("非法参数！");
        }
    }
}
