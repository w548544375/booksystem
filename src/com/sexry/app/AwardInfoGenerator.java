package com.sexry.app;


import com.sexry.service.AwardNumberInfo;
import com.sexry.service.AwardTimeInfo;
import com.sexry.service.GetAwardService;

import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;


/**
 * Created by Administrator on 2014/12/14 0014.
 */
public class AwardInfoGenerator {
    public static AwardNumberInfo numberInfo = new AwardNumberInfo();
    public static AwardTimeInfo  timeInfo = new AwardTimeInfo();
    private static GetAwardService getAwardService = new GetAwardService();

    public static void generatorInfo(){

        Timer timeinfotimer = new Timer();
         final Timer numbertimer = new Timer();
        timeinfotimer.schedule(new TimerTask() {
            @Override
            public void run() {
                try {
                    String timeinfostr = getAwardService.getData("http://caipiao.163.com/order/preBet_periodInfoTime.html?gameEn=ssc");
                    timeinfostr = timeinfostr.substring(1, timeinfostr.length()-1);
                    timeInfo = (AwardTimeInfo)getAwardService.stringToAwardTimeInfo(timeinfostr,AwardTimeInfo.class);
                   // innerTimer(numbertimer);
                } catch (IOException e) {
                    e.printStackTrace();
                    //出现异常就重新来一遍
                    run();
                } catch (NoSuchFieldException e) {
                    e.printStackTrace();
                } catch (InstantiationException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                }
            }
        },1,10*1000);

    }

    public static long decreaseTime(long time){
        return time > 0 ? time-1000 : 0;
    }


    //获取开奖剩余时间信息，写入全局变量timeInfo
    public static void getTimeInfo(){

        try {
            String timeinfostr = getAwardService.getData("http://caipiao.163.com/order/preBet_periodInfoTime.html?gameEn=ssc");
            timeinfostr = timeinfostr.substring(1, timeinfostr.length()-1);
            timeInfo = (AwardTimeInfo)getAwardService.stringToAwardTimeInfo(timeinfostr,AwardTimeInfo.class);
        } catch (IOException e) {
            e.printStackTrace();
            //出现异常就重新来一遍
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }

    }

    //获取中奖号码
    public static void  getNumberInfo(String period) throws IOException, IllegalAccessException, NoSuchFieldException, InstantiationException {

        if(period == null)
            return;

        String url ="http://caipiao.163.com/award/getAwardNumberInfo.html?gameEn=ssc&period="+period;
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
         numberInfo = (AwardNumberInfo) getAwardService.stringToAwardTimeInfo(result2, AwardNumberInfo.class);
    }



}
