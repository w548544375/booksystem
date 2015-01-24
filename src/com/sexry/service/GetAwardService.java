package com.sexry.service;


import com.sexry.config.BookType;
import com.sexry.config.EBookType;

import java.io.*;
import java.lang.reflect.Field;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2014/12/17 0017.
 */
public class GetAwardService {



    /**
     * 分析数字
     * @param number
     */
        public  Map<String,Object> anaylisNum(String number){

        Map<String,Object> re_map = new HashMap<String,Object>();
        int[] numbers = new int[5];
        for(int i=0;i<number.length();i++){
            numbers[i] = Integer.parseInt(String.valueOf(number.charAt(i)));
         }
        int sum =0;
        for (int j=0;j<numbers.length;j++){
            int big = numbers[j] >=5 ? BookType.SINGLE_BALL_BIG : BookType.SINGLE_BALL_LITTER;
            int dan = numbers[j]%2 == 0 ? BookType.SINGLE_BALL_SINGLE : BookType.SINGLE_BALL_DOUBLE;
            re_map.put("b"+(j+1),big);
            re_map.put("d"+(j+1),dan);
            re_map.put("n"+(j+1),numbers[j]);
            sum += numbers[j];
            //System.out.println(big+"===="+dan);
        }
        int total = sum > 22 ? BookType.TOTAL_BIG : BookType.TOTAL_LITTER;
        int totaldan = sum%2==0 ? BookType.TOTAL_DOUBLE : BookType.TOTAL_SINGLE;

        re_map.put("plusnumber",sum); //总和数
        re_map.put("plussize",total); //总和大小
        re_map.put("plusodevity",totaldan);//总和单双
        int lhh;
        if(numbers[0] > numbers[4]){
            lhh = BookType.DRAGON;
        }else if (numbers[0] == numbers[4]){
            lhh = BookType.PEACE;
        }else{
            lhh = BookType.TIGER;
        }
       re_map.put("dt",lhh); //龙虎和

       int frontThree = anayleThree(numbers[0],numbers[1],numbers[2]);
       int middleThree = anayleThree(numbers[1],numbers[2],numbers[3]);
       int backThree = anayleThree(numbers[2],numbers[3],numbers[4]);

        re_map.put("fthree",frontThree);//前三
        re_map.put("mthree",middleThree);//中三
        re_map.put("bthree",backThree);//后三

            return re_map;
    }

    /**
     * 三个一组的数字进行分析
     * @param num1
     * @param num2
     * @param num3
     * @return
     */
    public  int anayleThree(int num1,int num2,int num3){
        int[] nums = new int[3];
        nums[0] = num1;nums[1]=num2;nums[2]=num3;
        Arrays.sort(nums);
        //不含0的情况
        if((nums[1]-nums[0] == 1 && nums[2]-nums[1] == 1) ||(nums[2]-nums[0]== 9 && (nums[1]== 8 || nums[1] ==1))){
            //顺子
            return BookType.SHUNZI;
        }else if(nums[2]- nums[0] == 0){
            //豹子
            return BookType.BAOZI;
        }else if(nums[0]==nums[1] || nums[1] == nums[2]){
            //对子
            return BookType.DUIZ;
        }else if(nums[1]-nums[0] == 1 || nums[2]-nums[1] == 1 || (nums[0]==0 && (nums[1]== 1 || nums[2] == 9) ) ){
            //半顺
            return  BookType.BANSHUN;
        }else{
            //杂六
            return BookType.ZALIU;
        }
    }


    /**
     * 从网络中获取数据
     * @param urlstr
     * @return
     * @throws IOException
     */
    public String getData(String urlstr) throws IOException{

        URL url = new URL(urlstr);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setConnectTimeout(5000);
        connection.setDoOutput(true);
        connection.setRequestMethod("GET");
        connection.connect();
        BufferedReader reader = new BufferedReader(new InputStreamReader(connection.getInputStream(),"utf-8"));
        String line="" ;
        StringBuilder sbBuilder =new StringBuilder();
        while((line =reader.readLine()) != null){
            sbBuilder.append(line);
        }
        reader.close();
        connection.disconnect();
        return sbBuilder.toString();
    }

    /**
     * 把字符串转化为类
     * @param result
     * @return
     * @throws InstantiationException
     * @throws IllegalAccessException
     * @throws NoSuchFieldException
     * @throws SecurityException
     */
    public Object stringToAwardTimeInfo(String result,Class<?> classType) throws InstantiationException, IllegalAccessException, NoSuchFieldException, SecurityException{

        String[] results = result.split(",");

        Object awardTimeInfo = classType.newInstance();

        for(int i=0;i<results.length;i++){
            String[] strings = results[i].replace("\"","").split(":");
            Field field = classType.getDeclaredField(strings[0]);
            String obj ="";
            //值不空的情况
            if(strings.length != 1 ){
                obj = strings[1];
            }
            field.setAccessible(true);
            String fieldType =field.getType().getName();

            if (fieldType.equals(Long.class.getName())) {

                field.set(awardTimeInfo,Long.valueOf(obj)); //long
            }else if (fieldType.equals(Integer.class.getName())) {

                field.set(awardTimeInfo, Integer.valueOf(obj)); //int
            }else {
                field.set(awardTimeInfo, obj);
            }
        }
        return awardTimeInfo;
    }

    }
