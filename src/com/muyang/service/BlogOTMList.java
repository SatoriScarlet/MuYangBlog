package com.muyang.service;

import com.muyang.entity.OTM;
import com.muyang.util.OTMTool;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BlogOTMList")
public class BlogOTMList extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        List<OTM> OTMList = OTMTool.getOTMList();

        if(OTMList != null)
        {
            request.setAttribute("OTMList",OTMList);
            request.getRequestDispatcher("IndividualProjectList.jsp").forward(request,response);
        }

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
