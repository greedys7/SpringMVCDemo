package com.service;

import com.entity.Message;
import org.springframework.stereotype.Component;
import java.util.List;

public interface MessageService {
    //查询所有消息
    List<Message> findAll();

    //删除指定消息所有内容
    void delete(int id);

    //查询指定的消息
    List<Message> query(int id);

    //保存并更新编辑后的消息内容
    void update(int id, String title, String context, String date);
}
