package com.sexry.interceptor;

import com.sexry.controller.LoginController;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by sexry on 1/18/15.
 */
public class SessionListener implements HttpSessionListener {

    private static Map<String,HttpSession> sessionMap = new HashMap<String,HttpSession>();

    public static int sessionNumber = 0;

    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {

    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        //减少总人数
        if(sessionNumber > 0)
                sessionNumber --;
        System.out.println("当前在线用户:"+sessionNumber);
        //移除session
        sessionMap.remove(httpSessionEvent.getSession().getAttribute(LoginController.SESSION_KEY_LOGIN_USER));

    }

    public static boolean addSession(HttpSession session,String username,int id){
        if(sessionMap.containsKey(username)){
            sessionMap.get(username).invalidate();
            sessionMap.remove(username);
            return false;
        }
        //总人数增加
        sessionNumber ++;
        System.out.println("当前用户:" + sessionNumber);
        session.setAttribute(LoginController.SESSION_KEY_LOGIN_USER, username);
        session.setAttribute(LoginController.SESSION_KEY_USERID,id); //2015 03 31 新增用户id
        sessionMap.put(username,session);
        return true;
    }

    /**
     * 移除session
     * @param username
     */
    public static void removeSession(String username){
            sessionMap.get(username).invalidate();
            sessionMap.remove(username);
            //减少总人数
            if(sessionNumber > 0)
                sessionNumber --;
        }


}
