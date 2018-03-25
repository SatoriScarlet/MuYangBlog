package com.muyang.service;

import com.muyang.entity.Diary;
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

public class PutDiary extends HttpServlet {


    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Diary diary = new Diary();

        String external_message = req.getParameter("diary_external_message");
        String inside_message = req.getParameter("diary_inside_message");
        String text = req.getParameter("diary_text");
        Date create_date = new Date();
        Date alter_date = new Date();

        System.out.println(external_message);
        System.out.println(inside_message);
        System.out.println(text);


        /*
        执行代码表
        0 : 增加
        1 : 修改
         */

        String resource = "com/muyang/mybatis-config.xml";
        InputStream inputStream = null;
        try {
            inputStream = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            e.printStackTrace();
        }
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session=sqlSessionFactory.openSession();

        System.out.println("正在准备日志");

        String execute_code = req.getParameter("execute_code");
        System.out.println(execute_code);
        if(execute_code.equals("0"))
        {
            System.out.println("正在写入新的日志");
            diary.setExternal_message(external_message);
            diary.setInside_message(inside_message);
            diary.setText(text);
            diary.setCreate_date(create_date);
            diary.setAlter_date(alter_date);

            session.insert("putDiary",diary);
            session.commit();
            System.out.println("已写入新的日志");
            resp.getWriter().print(1);
        }
        else if(execute_code.equals("1"))
        {
            String diaryid = req.getParameter("alterDiaryId");
            System.out.println("正在修改日志");
            diary.setDiaryId(Integer.parseInt(diaryid));
            diary.setExternal_message(external_message);
            diary.setInside_message(inside_message);
            diary.setText(text);
            diary.setAlter_date(alter_date);

            session.update("alterDiary",diary);
            session.commit();
            System.out.println("已更新日志");
            resp.getWriter().print(1);
        }
        else
        {
            resp.getWriter().print(0);
        }


        session.close();

    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        doPost(req,resp);

    }


}
