package com.service.impl;

import com.dao.UserDAO;
import com.entity.User;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDAO userDAO;

    //保存用户信息
    public void save(String phone,String password){
        User user = new User();
        user.setPhone(phone);
        user.setPassword(password);
        userDAO.save(user);
    }

    //判断用户是否被注册
    public Integer isExit(String phone){
        //0:默认；1：已注册
        int flag = 0;
        User u = userDAO.findByPhone(phone);
        if(u!=null&&phone.equals(u.getPhone())){
            flag = 1;
        }
        return flag;
    }

    //判断验证码是否正确
    public Integer isRight(String phone,String password,String code, String providecode, HttpSession session){
        //3:默认信息完整;4:信息填写不完整;5：验证码错误或失效；
        int flag = 3;
        //给验证码设置时间
        session.setAttribute("providecode",providecode);
        session.setMaxInactiveInterval(60);

        if(("").equals(phone)||("").equals(password)||("").equals(code)){
            flag = 4;
            System.out.println("信息不完整");
        }else if(!code.equals(providecode)
            /*||session.getAttribute("providecode")==null*/
        ){
            flag = 5;
            System.out.println("验证码错误或失效");
        }else if(this.isExit(phone)==1){
            flag = 1;
            System.out.println("用户已注册");
        }
        return flag;
    }

    //判断登录账号密码是否正确
    public Integer toLogin(String phone,String password){
        //0：默认；1：登录成功;2:手机号输入错误 3:密码错误
        int flag = 0;
        User u = userDAO.findByPhone(phone);
        if(u!=null&&phone.equals(u.getPhone())){
            if(password.equals(u.getPassword())){
                flag = 1;
            }else{
                flag = 3;
            }
        }else{
            flag = 2;
        }
        return flag;
    }





}
