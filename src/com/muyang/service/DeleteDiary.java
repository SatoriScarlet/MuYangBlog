package com.muyang.service;

import com.muyang.entity.Diary;
import com.muyang.util.DiaryTool;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteDiary extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        doPost(req,resp);

    }

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        System.out.println(req.getParameter("deleteDiaryId"));
        int id = Integer.parseInt(req.getParameter("deleteDiaryId"));

        Diary diary = new Diary();
        diary.setDiaryId(id);

        DiaryTool.deleteDiary(diary);

        System.out.println("已删除日志");
        resp.getWriter().print(1);

    }
}
