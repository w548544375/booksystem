package com.sexry.controller;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.sexry.app.AwardInfoGenerator;
import com.sexry.config.MultipleType;
import com.sexry.model.BookHistory;
import com.sexry.service.*;
import com.sun.org.apache.xpath.internal.operations.Bool;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;


/**
 * Created by Administrator on 2014/12/15 0015.
 */

public class MainController extends Controller {

    //赔率
    MultipleService multipleService = new MultipleService();

    GetAwardService getAwardService = new GetAwardService();

    AwardHistoryService awardHistoryService = new AwardHistoryService();

    BookHistoryService bookHistoryService = new BookHistoryService();
    public void index(){
        renderJsp("/main.jsp");
        setAttr("user",getSessionAttr(LoginController.SESSION_KEY_LOGIN_USER));
    }

    /**
     * 初始化赔率
     */
   @ActionKey("/main/initPrice")
    public void initPrice(){
       try{
           renderJson(multipleService.getAllMultiple());
       }catch (Exception e){
           e.printStackTrace();
       }

    }


    //保存下单
    @ActionKey("/main/saveBook")
    public void saveBook(){
        //下单期号
        String period = getRequest().getParameter("period");
        //订单详细
        String bookdetail = getRequest().getParameter("bookdetail");

        if (!bookHistoryService.canBook((String) getSessionAttr(LoginController.SESSION_KEY_LOGIN_USER))){
            renderText("false");
        }else {
            renderJson(bookHistoryService.saveBookHistory(period, (String) getSessionAttr(LoginController.SESSION_KEY_LOGIN_USER), bookdetail));
        }
    }

    //取得下单历史
    @ActionKey("/main/pageBookHistory")
    public void pageBookHistory(){
        int page = getParaToInt("page");
        int pagesize = getParaToInt("pagesize");
       renderJson(bookHistoryService.getUnhandleBookHistory((String) getSessionAttr("user"),page,pagesize));
    }
    /**
     * 获取开奖时间，以及剩余时间
     */
    @ActionKey("/main/getPeriodInfoTime")
    public void getPeriodInfoTime(){
        renderJson(AwardInfoGenerator.timeInfo);
    }

    /**
     * 获取开奖号码
     * @param period  开奖的期数
     */
    @ActionKey("/main/getAwardNumberInfo")
    public void getAwardNumberInfo(String period){

        renderJson(AwardInfoGenerator.numberInfo);
    }

    @ActionKey("firstRequest")
    public void firstRequest() {
        String url = "http://caipiao.163.com/order/preBet_periodInfoTime.html?gameEn=ssc";
        String result = null;
        try {
            result = getAwardService.getData(url);
            result = result.substring(1, result.length() - 1);
            AwardTimeInfo awardTimeInfo = (AwardTimeInfo) getAwardService.stringToAwardTimeInfo(result, AwardTimeInfo.class);
            renderJson(awardTimeInfo);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    @ActionKey("secondRequest")
    public void secondRequest(){
        try {
            HttpServletRequest request = getRequest();
            String url= "http://caipiao.163.com/award/getAwardNumberInfo.html?gameEn=ssc&period="+request.getParameter("period");
            //System.out.println(url);
            String result2 = getAwardService.getData(url);
            int is = result2.indexOf("[");
            if(is !=-1){
                result2 = result2.substring(is+2);
                result2 = result2.replace("[","");
                result2 = result2.replaceAll("]","");
                result2 = result2.replaceAll("}", "");
            }else {
                result2 = result2.substring(1,result2.length()-1);
            }
            AwardNumberInfo awardNumberInfo = (AwardNumberInfo) getAwardService.stringToAwardTimeInfo(result2, AwardNumberInfo.class);
            renderJson(awardNumberInfo);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
    }


    /**
     * 获取开奖历史记录
     */
    @ActionKey("/main/awardHistory")
    public void getAwardHistory(){
        int page = getParaToInt("page");
        int pagesize = getParaToInt("pagesize");
        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.HOUR_OF_DAY,0);
        calendar.set(Calendar.MINUTE,0);
        renderJson(awardHistoryService.getAwardHistory(page, pagesize, calendar.getTimeInMillis()));
    }


    /**
     * 获取已经处理的订单
     */
    @ActionKey("/main/handledBook")
    public void getHandledBook(){
        int page = getParaToInt("page");
        int pagesize = getParaToInt("pagesize");
        renderJson(bookHistoryService.getHandledBook(page,pagesize, (String) getSessionAttr(LoginController.SESSION_KEY_LOGIN_USER)));
    }


    @ActionKey("/main/weekRecord")
    public void weekRecord(){
          int week = getParaToInt("week");
          renderJson( bookHistoryService.weekRecord(week, (String) getSessionAttr(LoginController.SESSION_KEY_LOGIN_USER)));
    }

}
