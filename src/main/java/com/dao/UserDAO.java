package com.dao;

import com.entity.User;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDAO {
    //注册 保存用户信息
    void save(User user);

    //通过手机号查询密码
    User findByPhone(String phone);


}
