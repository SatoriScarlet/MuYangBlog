package com.muyang.service;

import com.muyang.entity.User;
import com.muyang.util.DBTool;
import com.muyang.util.UserContrl;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;
import javax.servlet.http.*;
import javax.servlet.*;


public class UserLogin extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String username = req.getParameter("login_user");
        String passwd = req.getParameter("login_passwd");

        User user = new User();
        user = UserContrl.UserLogin(user,username,passwd);
        System.out.println();
        if(user != null && user.isLogin())
        {
            System.out.println("登录");

            req.getSession().setAttribute("User",user);
            resp.getWriter().print(1);
//            resp.sendRedirect("index.jsp");
        }
        else
        {
            System.out.println("未登录");

            resp.getWriter().print(0);
        }


    }

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
