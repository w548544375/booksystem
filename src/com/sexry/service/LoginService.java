package com.sexry.service;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Record;
import com.sexry.model.User;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.*;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


/**
 * Created by Administrator on 2014/12/14 0014.
 */
public class LoginService {


    //生成的验证码字符串
    public static String code;
    //种子
    private  static final String seedStr="0123456789ABCDEFGHIJKLIMNOPQRSTUVWXY";
    /**
     *  生成随机颜色
     * @param random
     * @param fc
     * @param bc
     * @return
     */
    public Color getRandColor(Random random,int fc,int bc){
        if(fc > 255)
            fc = 255;
        if(bc > 255)
            bc = 255;
        int r = fc + random.nextInt(bc-fc-16);
        int g = fc + random.nextInt(bc-fc-14);
        int b = fc + random.nextInt(bc-fc-18);
        return new Color(r,g,b);
    }

    public BufferedImage generateImg(int width,int height,Random random){

        BufferedImage image = new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);
        Graphics g2d = image.getGraphics();
        g2d.fillRect(0, 0, width, height);
        g2d.setFont(new Font("微软雅黑",Font.ROMAN_BASELINE,28));
        //设置随机颜色
        g2d.setColor(getRandColor(random, 110, 133));
        //绘制干扰线
        for (int i=0;i<3;i++){
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int x1 = random.nextInt(15);
            int y1 = random.nextInt(13);
            g2d.drawLine(x,y,x1,y1);
        }
        //随机字符串4个字
        code ="";
        for (int j=0;j<4;j++){
            //设置字体随机颜色
            g2d.setColor(new Color(random.nextInt(125),random.nextInt(155),random.nextInt(200)));
            //获取随机的单个字符
            String single = String.valueOf(seedStr.charAt(random.nextInt(seedStr.length())));
            // System.out.println(single);
            code+=single;
            //随机旋转
            //g2d.translate(random.nextInt(1),random.nextInt(1));

            g2d.drawString(single,width/4*j+10,22);
        }
        g2d.dispose();
        //写入session

        // System.out.println(getSessionAttr(SESSION_KEY_IMG));
        //写入到view

       return image;
    }

    /**
     * 验证登录
     * @param userName  用户名
     * @param password  密码
     *
     * @return
     */
    public boolean validateLogin(String userName,String password) throws Exception{
        String regEx="[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。，、？]";
        Pattern   p   =   Pattern.compile(regEx);
        Matcher m   =   p.matcher(userName);
        String user = m.replaceAll("").trim();
        List<Record> users = Db.find("select * from sexry_user where username=?", user);
        if (users == null || users.size() ==0){
            throw new Exception("用户名不存在");
            //return  false;
        }
        Record userd = users.get(0);
        if(userd.getStr("password").equals(password)){
            if(userd.getInt("isbind") == 1)
                throw new Exception("用户被封，无法登录");
            else
                return true;
        }else{
            throw new Exception("密码错误");
           // return false;
        }

    }

    /**
     * 验证图形验证码
     * @param temp  图形验证码
     * @return  true false
     */
    public boolean validateCode(String temp){
        //去除空格
        String sb = temp.trim().toUpperCase();
        System.out.println(sb);
        System.out.println(code);
        System.out.println(sb.equals(code));
        return sb.equals(code) ? true : false;
    }


 //信用额度信息
    public Map<String,Object> getCredit(String username){
        try {
            List<Record> users = Db.find("select * from sexry_user where username = ?", username);
            if (users == null || users.size() == 0)
                return null;
            Record user = users.get(0);
            Map<String, Object> re_map = new HashMap<String, Object>();
            re_map.put("curent", user.getFloat("curentcredit"));
            re_map.put("max", user.getFloat("maxcredit"));
            return re_map;
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }
    }





}
