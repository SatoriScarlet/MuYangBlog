package com.muyang.service;

import com.muyang.entity.Project;
import com.muyang.util.ProjectTool;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class BlogProjectList extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }


    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        List<Project> projectList = ProjectTool.getProjectList();

        if(projectList != null)
        {
            req.setAttribute("projectList",projectList);
            req.getRequestDispatcher("IndividualProjectList.jsp").forward(req,resp);
        }

    }
}
