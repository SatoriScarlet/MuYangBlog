package com.muyang.util;

import com.muyang.entity.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.sql.Date;
import java.util.List;

public class UserContrl {

    public static User UserLogin(User user,String username,String passwd)
    {

        String resource = "com/muyang/mybatis-config.xml";
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            e.printStackTrace();
        }

        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session=sqlSessionFactory.openSession();

        user.setUsername(username);
        user.setPasswd(passwd);

        user = session.selectOne("userLogin",user);
        if(user != null && user.getUserid() != -1)
        {
            user.setLogin(true);
        }

        System.out.println("取得用户信息");
        session.close();
        return user;
    }





}
