package com.sexry.app;

import java.io.IOException;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.*;

/**
 * 专门用于控制awardTimeInfo的计时器
 * Created by Administrator on 2014/12/30.
 */
public class AwardTimeControl {
    public static Timer timer;
    public static Timer getINfo;
    //定时的减少每个时间的值
    public static void  decreaseTime(){
        try {
            System.out.println("第一次获取开奖号码");
            AwardInfoGenerator.getNumberInfo(AwardInfoGenerator.timeInfo.getPreviousPeriod());
        } catch (IOException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }

         timer = new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                System.out.println("执行5秒更新一次数据...");
                AwardInfoGenerator.getTimeInfo();
                    //已经开奖的情况
                if (AwardInfoGenerator.timeInfo.getAwardSecondsLeft() == 0){
                    //立马开启线程执行拉取号码
                      //  GetAwardNumberThread thread = new GetAwardNumberThread();
                        // thread.run();
                    System.out.println(AwardInfoGenerator.numberInfo.getWinningNumber());

                }else{//正在开奖的情况下
                    //延迟一段时间后执行代码
                    if(getINfo == null) {
                        System.out.println("创建延时拉取timer");
                        getINfo = new Timer();
                        getINfo.schedule(new TimerTask() {
                            @Override
                            public void run() {
                                System.out.println("延时拉取timer开始运行....！");
                                GetAwardNumberThread thread = new GetAwardNumberThread();
                                thread.run();
                            }
                        }, AwardInfoGenerator.timeInfo.getAwardSecondsLeft());
                    }
                }
            }
        },0,5000);
     }






}
