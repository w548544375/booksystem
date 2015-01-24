package com.sexry.service;


import com.sexry.config.EBookType;

import com.sexry.model.BookControl;
import com.sexry.model.BookDefine;
import com.sexry.model.Multiple;
import com.sexry.service.VO.MultipleVO;

import java.util.ArrayList;

import java.util.List;


/**
 * Created by Administrator on 2014/12/17 0017.
 */
public class MultipleService {
    /**
     *  根据id获取赔率
     * @param multipleType  MultipleType
     * @return  赔率的数字
     */
    public float getMultiple(int multipleType){
       return  Multiple.multipleDao.findById(multipleType).getFloat("multiple");
    }

    //获得所有的赔率
    public List<MultipleVO> getAllMultiple()
    {
        List<MultipleVO> result = new ArrayList<MultipleVO>();
        List<BookDefine> lists = BookDefine.bookDefineDao.find("select * from sexry_bookdefine");
        for (BookDefine multiple : lists){
          MultipleVO vo = new MultipleVO();
            vo.setType(EBookType.getName(multiple.getInt("booktype")));
            vo.setMultiple(multiple.getFloat("multiple_number"));
            result.add(vo);
        }
     return result;
    }


    //获得所有阈值
    public List<BookControl> getAllControl(){
        List<BookControl> lists = BookControl.bookControlDao.find("select * from sexry_bookcontrol");
        return lists;
    }



}
