package com.sexry.controller;

import com.jfinal.aop.ClearInterceptor;
import com.jfinal.aop.ClearLayer;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.sexry.interceptor.SessionListener;
import com.sexry.service.LoginService;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Random;


/**
 * Created by Administrator on 2014/12/13 0013.
 */

@ClearInterceptor(ClearLayer.ALL)
public class LoginController extends Controller{

    public static final String SESSION_KEY_LOGIN_USER ="user";
    public static final String SESSION_KEY_IMG ="sessionImg";

    //图片宽高
    private int width = 173;
    private int height = 34;
    //随机产生器
    private    Random random = new Random();
    //处理事务的service
    LoginService loginService = new LoginService();

    public void index(){
        renderJsp("/login.jsp");
    }

    @ActionKey("/getAwardInfo")
    public void getAwardInfo(){

    }


    @ActionKey("/generateValitorImg")
    public void generateValitorImg(){
             HttpServletResponse response = getResponse();
        try {
            //输出图片
            ImageIO.write(loginService.generateImg(width,height,random),"JPEG",response.getOutputStream());
            removeSessionAttr(SESSION_KEY_IMG);
            setSessionAttr(SESSION_KEY_IMG, LoginService.code);
            response.getOutputStream().close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 验证图形验证码
     */
    @ActionKey("/login/validateCode")
    public void validatorCode(){
        String imgCode = getPara("code");
        boolean bpass = loginService.validateCode(imgCode);
        renderJson(bpass);
    }

    /**
     * 验证登录
     */
  @ActionKey("/login/validateLogin")
    public void validateLogin(){
      String userName = getPara("username");
      String password = getPara("password");
      boolean bLogin = false;
      try {
          bLogin = loginService.validateLogin(userName,password);
      } catch (Exception e) {
          renderText(e.getMessage());
          return;
      }
      if (bLogin){
            //setSessionAttr(SESSION_KEY_LOGIN_USER,userName);
            if (SessionListener.addSession(getSession(),userName)){
                renderText("suc");
                }else{
                //removeSessionAttr(LoginController.SESSION_KEY_LOGIN_USER);
                //getSession().invalidate();
                renderText("帐号可能在异地登录，请注意账户安全。\r\n如果是上次登录没有正常退出,请忽略此消息！");
            }

      }else{
            renderText("登录失败,请输入正确的用户名和密码。");
      }

  }

    /**
     * 退出登录
     */
    @ActionKey("/main/logOut")
    public void logOut(){
          //setSessionAttr(SESSION_KEY_LOGIN_USER,null);
           // removeSessionAttr(SESSION_KEY_LOGIN_USER);
            SessionListener.removeSession((String)getSessionAttr(SESSION_KEY_LOGIN_USER));
          redirect("/login");
    }

    @ActionKey("/main/creditInfo")
    public void creditInfo(){
        renderJson(loginService.getCredit((String) getSessionAttr(SESSION_KEY_LOGIN_USER)));
    }



}
