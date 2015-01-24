package com.sexry.controller;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.sexry.service.UserService;



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

        renderText(userService.updatePassword((String) getSessionAttr(LoginController.SESSION_KEY_LOGIN_USER),old,newp,false));

    }

}
