package com.muyang.service;

import com.muyang.entity.Diary;
import com.muyang.util.DBTool;
import com.muyang.util.DiaryTool;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BlogDiary extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        doPost(req,resp);



    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        System.out.println("正在获取日志清单");



        int pageNumber = 1;

        if(req.getParameter("pageNumber") != null)
        {
            pageNumber = Integer.parseInt(req.getParameter("pageNumber"));
        }
        System.out.println("跳转到页面 ： " + pageNumber);

        List<Diary> diaryList = DiaryTool.getDiary((pageNumber - 1) * 8,8);
        int listNumber = DiaryTool.getDiaryListNumber(8);
        System.out.println("取得日志清单");


        req.setAttribute("DiaryList",diaryList);
        req.setAttribute("pageLength",listNumber);
        req.setAttribute("pageNumber",pageNumber);

        System.out.println("转发");

        req.getRequestDispatcher("Diary.jsp?pageLength=" + listNumber + "&pageNumber=" + pageNumber).forward(req,resp);
//        resp.sendRedirect("Diary.jsp");



    }
}
