package com.dao;

import com.entity.Message;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MessageDAO {
    //查询所有消息
    List<Message> findAll();

    //删除指定消息所有内容
    void delete(int id);

    //查询指定的消息
    List<Message> query(int id);

    //保存并更新编辑后的消息内容
    void update(@Param("id") int id, @Param("title") String title, @Param("context") String context,@Param("date") String date);


}

