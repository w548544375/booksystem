package com.sexry.config;

import java.awt.print.Book;

/**
 * Created by Administrator on 2014/12/17 0017.
 */
public enum EBookType {


    SINGLE_BALL_BIG(BookType.SINGLE_BALL_BIG,"大"),
    SINGLE_BALL_LITTER(BookType.SINGLE_BALL_LITTER,"小"),
    SINGLE_BALL_SINGLE(BookType.SINGLE_BALL_SINGLE,"单"),
    SINGLE_BALL_DOUBLE(BookType.SINGLE_BALL_DOUBLE,"双"),
    TOTAL_BIG(BookType.TOTAL_BIG,"总和大"), //总和大
    TOTAL_LITTER(BookType.TOTAL_LITTER,"总和小"),//总和小
    TOTAL_SINGLE(BookType.TOTAL_SINGLE,"总和单"),//总和单
    TOTAL_DOUBLE(BookType.TOTAL_DOUBLE,"总和双"),
    DRAGON(BookType.DRAGON,"龙"),
    TIGER(BookType.TIGER,"虎"),
    PEACE(BookType.PEACE,"和"),
    BAOZI(BookType.BAOZI,"豹子"),
    SHUNZI(BookType.SHUNZI,"顺子"),
    DUIZI(BookType.DUIZ,"对子"),
    BANSHUN(BookType.BANSHUN,"半顺"),
    HAOSHU(BookType.BALL_NUMBER,"号数"),
    ZALIU(BookType.ZALIU,"杂六");




    private int bookType;
    private String cnName;

    private EBookType(int bookType,String cnName){
        this.bookType = bookType;
        this.cnName = cnName;
    }
    //根据index获取名字
    public static String getName(int index){
        for(EBookType type : EBookType.values()){
                if (type.getBookType() == index)
                    return type.getCnName();
        }
        return null;
    }

    //根据名字获取index
    public static int getType(String name){
        for(EBookType type : EBookType.values()){
            if (name.equals(type.getCnName()))
                return type.getBookType();
        }
        return BookType.BALL_NUMBER;
    }


    public int getBookType() {
        return bookType;
    }

    public void setBookType(int bookType) {
        this.bookType = bookType;
    }

    public String getCnName() {
        return cnName;
    }

    public void setCnName(String cnName) {
        this.cnName = cnName;
    }
}
