package com.service.impl;

import com.dao.MessageDAO;
import com.entity.Message;
import com.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private MessageDAO messageDAO;

    //查询所有消息到消息列表
    public List<Message> findAll(){
        return this.messageDAO.findAll();
    }


    public void delete(int id){
        messageDAO.delete(id);
    }

    //查询指定的消息
    public List<Message> query(int id){
        return messageDAO.query(id);
    }

    //保存并更新编辑后的消息内容
    public void update(int id, String title, String context, String date){
        this.messageDAO.update(id, title, context, date);
    }
}
