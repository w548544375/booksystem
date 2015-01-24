package com.sexry.app;

import com.sexry.model.AwardHistory;
import com.sexry.service.AwardHistoryService;

import java.io.IOException;

/**
 * Created by Administrator on 2014/12/30.
 * 专门用于获取开奖号码的线程
 */
public class GetAwardNumberThread implements Runnable {


   /* public GetAwardNumberThread(){
        run();
    }*/

    @Override
    public void run() {
            System.out.println("延时拉取号码的线程开始工作....");
                try {
                    AwardInfoGenerator.getNumberInfo(AwardInfoGenerator.timeInfo.getPreviousPeriod());
                    if(null == AwardInfoGenerator.numberInfo.getStatus() || AwardInfoGenerator.numberInfo.getStatus().equals("-2")) {
                        System.out.println("线程进入睡眠....");
                        Thread.sleep(2000);
                        run();
                        return;
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                } catch (NoSuchFieldException e) {
                    e.printStackTrace();
                } catch (InstantiationException e) {
                    e.printStackTrace();
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
                AwardTimeControl.getINfo = null;
                //向数据库写入获奖信息，对比数据库中的开奖信息，找出获奖订单号
                new AwardHistoryService().saveAwardNumber(AwardInfoGenerator.timeInfo,AwardInfoGenerator.numberInfo);
    }


}
