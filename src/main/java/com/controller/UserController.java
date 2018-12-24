package com.controller;

import com.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("user")
public class UserController {
    @Resource
    private UserService userService;

    //登录
    @RequestMapping("tologin")
    public String toLogin(){
        return "login";
    }

    //注册
    @RequestMapping("toregister")
    public String toRegister(){
        return "register";
    }

    //消息列表
    @RequestMapping("toMessageList")
    public String toMessageList(){
        return "messagelist";
    }

    //保存用户信息
    @RequestMapping("saveUser")
    public void save(String phone,String password){
        this.userService.save(phone, password);
    }

    //注册页面的一系列判断
    @ResponseBody
    @RequestMapping("addUser")
    public Integer addUser(String phone, String password, String code, String providecode, HttpSession session){
        System.out.println("test1");
        Integer right = userService.isRight(phone, password, code, providecode, session);
        return right;
    }

    //登录页面的判断
    @ResponseBody
    @RequestMapping("login")
    public Integer login(String phone,String password){
        Integer flag = userService.toLogin(phone,password);
        return flag;
    }





}
