package com.sexry.model;

import com.jfinal.plugin.activerecord.Model;

/**
 * 赔率
 * Created by Administrator on 2014/12/17 0017.
 */
public class Multiple extends Model<Multiple>{
    public static final Multiple multipleDao = new Multiple();

    private int id;

    private int type;

    private float multiple;

    private String description;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public float getMultiple() {
        return multiple;
    }

    public void setMultiple(float multiple) {
        this.multiple = multiple;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
