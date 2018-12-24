package com.service;

import com.service.MessageService;
import junit.framework.TestCase;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class MessageServiceImplTest  extends TestCase {

    private MessageService messageService;


    @Test
    public void testDelete() {
        /*Assert.assertEquals(messageService.delete(6),1);*/

        ApplicationContext ctx = new FileSystemXmlApplicationContext("classpath:spring-service.xml",
                "classpath:spring-mvc.xml");
        messageService = ctx.getBean(MessageService.class);
        messageService.delete(9);

    }

    @Test
    public void testUpdate() {
        int id = 10;
        String title = "陈羽凡吸毒被抓";
         String context = "北京警方抓捕陈羽凡，社区劳教三年";
        String date = "11月31日";
        messageService.update(id,title,context,date);
        /*Assert.assertEquals(messageService.update(id,title,context,date),2);*/
    }
}