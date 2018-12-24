package com.controller;

import com.entity.Message;
import com.service.MessageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import javax.annotation.Resource;

@Controller
@RequestMapping("message")
public class MessageController {
    @Resource
    private MessageService messageService;

    //显示所有消息
    @RequestMapping("tolist")
    public String list(Model model){
        List<Message> list = messageService.findAll();
        model.addAttribute("list",list);
        return "messagelist";
    }

    //根据id查到指定的消息内容并跳到消息正文页面
    @RequestMapping("toContext")
    public String context(Model model,int id){
        List<Message> context = messageService.query(id);
        model.addAttribute("context",context);
        return "context";
    }

    //删除一条消息
    @RequestMapping("toDelete")
    public String delete(int id){
        this.messageService.delete(id);
        return "redirect:tolist";
    }

    //编辑一条消息并保存信息
    @ResponseBody
    @RequestMapping("toSave")
    public String save(int id,String title,String context,String date){
        System.out.println("修改信息");
        try {
            this.messageService.update(id, title, context, date);
            System.out.println("---------------------------------1:");
        }catch(final Exception e){
            System.out.println("---------------------------------:"+e);
        }
        return "success";
    }

}
