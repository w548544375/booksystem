package com.sexry.config;

import com.jfinal.config.*;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;
import com.sexry.app.AwardInfoGenerator;
import com.sexry.app.AwardTimeControl;
import com.sexry.controller.LoginController;
import com.sexry.controller.MainController;
import com.sexry.controller.UserController;
import com.sexry.interceptor.GloableInterceptor;
import com.sexry.model.*;

import java.io.IOException;


/**
 * Created by Administrator on 2014/12/13 0013.
 */
public class Config extends JFinalConfig{
    @Override
    public void configConstant(Constants constants) {
        constants.setDevMode(true);
        constants.setViewType(ViewType.JSP);

    }

    @Override
    public void configRoute(Routes routes) {
            routes.add("/login", LoginController.class);
            routes.add("/main", MainController.class);
            //routes.add("/getAwardInfo",LoginController.class);
            routes.add("/user", UserController.class);
    }

    @Override
    public void configPlugin(Plugins plugins) {
            /**添加数据库连接池*/
        loadPropertyFile("mysql_config.txt");
        C3p0Plugin c3p0Plugin = new C3p0Plugin(getProperty("jdbcUrl"),getProperty("user"),getProperty("password"));
        plugins.add(c3p0Plugin);

        ActiveRecordPlugin activeRecordPlugin = new ActiveRecordPlugin(c3p0Plugin);
        plugins.add(activeRecordPlugin);
        /**添加映射*/
        //用户
       activeRecordPlugin.addMapping("sexry_user",User.class);
        //开奖历史
        activeRecordPlugin.addMapping("sexry_awardhistory", AwardHistory.class);
        //下注类型的赔率
       activeRecordPlugin.addMapping("sexry_bookdefine", BookDefine.class);
        //订单历史
       activeRecordPlugin.addMapping("sexry_bookhistory", BookHistory.class);
        //赔率表
       activeRecordPlugin.addMapping("sexry_multiple",Multiple.class);
        //订单详细
        activeRecordPlugin.addMapping("sexry_bookdetail",BookDetail.class);
        //下注结果
        activeRecordPlugin.addMapping("sexry_result",AwardResult.class);
        //下注封顶
        activeRecordPlugin.addMapping("sexry_bookcontrol",BookControl.class);
    }

    @Override
    public void configInterceptor(Interceptors interceptors) {
             //添加全局过滤器
              interceptors.add( new GloableInterceptor());
    }

    @Override
    public void configHandler(Handlers handlers) {

    }


    @Override
    public void afterJFinalStart() {
    //    AwardInfoGenerator.generatorInfo();
        AwardInfoGenerator.getTimeInfo();

        AwardTimeControl.decreaseTime();
    }

    @Override
    public void beforeJFinalStop(){
            AwardTimeControl.timer.cancel();
    }
}
