package com.muyang.service;

import com.muyang.entity.User;
import com.muyang.util.UserContrl;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;

public class UserRegister extends HttpServlet {


    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");


        String username = req.getParameter("register_user");
        String passwd = req.getParameter("register_passwd");
        String display = req.getParameter("register_displayer");
        int userPermission = 1;
        int headPortrait = Integer.valueOf(req.getParameter("head_portrait"));

        String resource = "com/muyang/mybatis-config.xml";
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            e.printStackTrace();
        }
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session=sqlSessionFactory.openSession();

        User user1 = new User();
        User user2 = new User();

        user1.setUsername(username);
        user2.setDisplay(display);
        System.out.println(user1);
        user1 = session.selectOne("userUserNameExist",user1);
        user2 = session.selectOne("userDisplayExist",user2);
        if(user1 == null && user2 == null)
        {
            System.out.println("用户未存在，正在注册新用户！");
            User user = new User();

            user.setUserid(0);
            user.setUsername(username);
            user.setPasswd(passwd);
            user.setDisplay(display);
            user.setLastLoginDate(new Date());
            user.setRegisterDate(new Date());
            user.setHeadPortrait(headPortrait);
            user.setUserPermission(userPermission);
            session.insert("userRegister",user);
            session.commit();
            session.close();

            user = UserContrl.UserLogin(user,username,passwd);
            req.getSession().setAttribute("User",user);

            resp.getWriter().print(1);
        }
        else
        {
            System.out.println("用户已经存在！");

            resp.getWriter().print(0);
        }



        

    }

    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
