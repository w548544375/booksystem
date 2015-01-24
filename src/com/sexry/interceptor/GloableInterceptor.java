package com.sexry.interceptor;


import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.sexry.controller.LoginController;


/**
 * Created by Administrator on 2014/12/15 0015.
 */
public class GloableInterceptor implements Interceptor {
    @Override
    public void intercept(ActionInvocation actionInvocation) {
       /* String keyImage =
        actionInvocation.getController().getSessionAttr(LoginController.SESSION_KEY_IMG);
       // System.out.println(keyImage);*/
        if (actionInvocation.getController().getSessionAttr(LoginController.SESSION_KEY_LOGIN_USER) == null) {
            actionInvocation.getController().redirect("/login");
            //actionInvocation.getController().renderJsp("/login.jsp");
        }else
            actionInvocation.invoke();


    }
}
