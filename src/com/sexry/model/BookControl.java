package com.sexry.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * Created by Administrator on 2015/1/17.
 * ===========================================================
 * booktype | 类型
 * min      | 最小下注值
 * max      | 最大下注值
 * total    | 总共的下单额度
 * description | 描述，方便记忆
 */
public class BookControl extends Model<BookControl> {
    public static final BookControl bookControlDao = new BookControl();
}
