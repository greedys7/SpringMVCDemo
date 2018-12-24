package com.service;

import com.entity.User;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface UserService {
    //保存用户信息
    void save(String phone,String password);

    //判断用户是否被注册
    Integer isExit(String phone);

    //判断验证码是否正确
    Integer isRight(String phone,String password,String code,String providecide, HttpSession session);

    //判断登录账号密码是否正确
    Integer toLogin(String phone,String password);




}
