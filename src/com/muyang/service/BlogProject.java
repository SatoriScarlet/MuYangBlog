package com.muyang.service;

import com.muyang.entity.Project;
import com.muyang.util.ProjectTool;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

public class BlogProject extends HttpServlet {


    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }


    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");

        int projectId = 1;

        if(req.getParameter("projectid") != null)
        {
            projectId = Integer.parseInt(req.getParameter("projectid"));
        }

        Project project = new Project();
        project.setProjectId(projectId);

        project = ProjectTool.getProject(project);
        if(project != null)
        {
            req.setAttribute("project",project);
            req.getRequestDispatcher("IndividualProject.jsp").forward(req,resp);
        }





    }
}
