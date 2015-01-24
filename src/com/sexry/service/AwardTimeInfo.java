package com.sexry.service;

/**
 * Created by Administrator on 2014/12/20 0020.
 */

public class AwardTimeInfo {
    //上一期
    private String previousPeriod;
    //开奖剩余时间
    private Long awardSecondsLeft;
    //剩余下注时间
    private Long secondsLeft;
    //当前期数
    private String currentPeriod;
    //状态
    private String status;
    //游戏id
    private String gameId;
    //最大期数
    private Integer maxPeriodNum;
    //拉奖剩余时间
    private Integer awardSecondsTwo;
    //已开奖期数
    private Integer hasPeriodNum;
    //
    private Long nextSecondsLeft;
    private Long groupBuySecondsLeft;
    //剩余期数
    private Integer remainPeriodNum;
    //下一期
    private String nextPeriod;
    //游戏标号 ssc 重庆时时彩
    private String gameEn;
    //时间1
    private Long awardSecondsOne;
    private Long nextGroupBuySecondsLeft;
    public String getPreviousPeriod() {
        return previousPeriod;
    }
    public void setPreviousPeriod(String previousPeriod) {
        this.previousPeriod = previousPeriod;
    }
    public Long getAwardSecondsLeft() {
        return awardSecondsLeft;
    }
    public void setAwardSecondsLeft(Long awardSecondsLeft) {
        this.awardSecondsLeft = awardSecondsLeft;
    }
    public Long getSecondsLeft() {
        return secondsLeft;
    }
    public void setSecondsLeft(Long secondsLeft) {
        this.secondsLeft = secondsLeft;
    }
    public String getCurrentPeriod() {
        return currentPeriod;
    }
    public void setCurrentPeriod(String currentPeriod) {
        this.currentPeriod = currentPeriod;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public String getGameId() {
        return gameId;
    }
    public void setGameId(String gameId) {
        this.gameId = gameId;
    }
    public Integer getMaxPeriodNum() {
        return maxPeriodNum;
    }
    public void setMaxPeriodNum(Integer maxPeriodNum) {
        this.maxPeriodNum = maxPeriodNum;
    }
    public Integer getAwardSecondsTwo() {
        return awardSecondsTwo;
    }
    public void setAwardSecondsTwo(Integer awardSecondsTwo) {
        this.awardSecondsTwo = awardSecondsTwo;
    }
    public Integer getHasPeriodNum() {
        return hasPeriodNum;
    }
    public void setHasPeriodNum(Integer hasPeriodNum) {
        this.hasPeriodNum = hasPeriodNum;
    }
    public Long getNextSecondsLeft() {
        return nextSecondsLeft;
    }
    public void setNextSecondsLeft(Long nextSecondsLeft) {
        this.nextSecondsLeft = nextSecondsLeft;
    }
    public Long getGroupBuySecondsLeft() {
        return groupBuySecondsLeft;
    }
    public void setGroupBuySecondsLeft(Long groupBuySecondsLeft) {
        this.groupBuySecondsLeft = groupBuySecondsLeft;
    }
    public Integer getRemainPeriodNum() {
        return remainPeriodNum;
    }
    public void setRemainPeriodNum(Integer remainPeriodNum) {
        this.remainPeriodNum = remainPeriodNum;
    }
    public String getNextPeriod() {
        return nextPeriod;
    }
    public void setNextPeriod(String nextPeriod) {
        this.nextPeriod = nextPeriod;
    }
    public String getGameEn() {
        return gameEn;
    }
    public void setGameEn(String gameEn) {
        this.gameEn = gameEn;
    }
    public Long getAwardSecondsOne() {
        return awardSecondsOne;
    }
    public void setAwardSecondsOne(Long awardSecondsOne) {
        this.awardSecondsOne = awardSecondsOne;
    }
    public Long getNextGroupBuySecondsLeft() {
        return nextGroupBuySecondsLeft;
    }
    public void setNextGroupBuySecondsLeft(Long nextGroupBuySecondsLeft) {
        this.nextGroupBuySecondsLeft = nextGroupBuySecondsLeft;
    }

}
