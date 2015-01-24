package com.sexry.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * Created by Administrator on 2014/12/13 0013.
 * username 用户名
 * password 密码
 * curentcredit 当前信用额度
 * maxcredit 最大信用额度
 * isbind 是否被封 0表示未被封，1表示被封
 * pid 所属用户
 * hasprivileges 是否有下发帐号的权限
 *
 *
 */
public class User extends Model<User>{
    public static final User dao = new User();

}
