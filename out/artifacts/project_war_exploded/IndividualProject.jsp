<%@ page import="com.muyang.entity.Project" %>
<%@ page import="com.muyang.entity.ProjectPlan" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2017/12/18
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<html>
<head>
    <title>个人项目</title>

    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="js/individualproject.js" type="text/javascript"></script>



    <link rel="stylesheet" href="amazeui/assets/css/amazeui.flat.css"/>
    <link rel="stylesheet" href="css/individualproject.css">
</head>

<body>
<%!
    Project project = null;
    boolean hasProject = false;
%>


<%@include file="Header.jsp"%>
<%@include file="Sidebar.jsp"%>
<%@include file="PopupMessage.jsp"%>
<%@include file="AI.jsp"%>
<%
    if(request.getAttribute("project") != null)
    {
        project = (Project) request.getAttribute("project");
        hasProject = true;
    }
    else
    {
        response.sendRedirect("BlogProject?projectid=1");
    }
%>


<br>
<div id="individual_project">
<div id="project_title">
    <%
        if(hasProject)
        {
            out.print(project.getProjectName());
        }
    %>
</div>
    <br>
<div id="project_little_title">
    <%
        if(hasProject)
        {
            out.print(project.getProjectLittleName());
        }
    %>
</div>
    <br>
    <div id="project_id" class="project_button">
        <div class="project_button_external_message">

            项目编号
        </div>
        <div class="project_button_inside_message">
            <%
                if(hasProject)
                {
                    out.print(project.getProjectCode());
                }
            %>
        </div>
    </div>
    <br>
    <div id="project_intro" class="project_button project_can_open">
        <div class="project_button_external_message">
            项目简介
        </div>
        <div class="project_button_inside_message">
            点击打开
        </div>
        <div class="project_intro_text">
            <%
                if(hasProject)
                {
                    out.print(project.getProjectIntro());
                }
            %>
        </div>
    </div>
    <br>
    <div id="project_plan" class="project_button">
        <div class="project_button_external_message">
            项目进度
        </div>
        <div class="project_button_inside_message">
            <%
                if(hasProject)
                {
                    %>
            <span style="color: white;z-index: 7000;position: relative">
                <%=
                project.getProjectPlanValue() + "%"
                %>
            </span>
            <div id="project_plan_value_canva" style="width: <%=project.getProjectPlanValue() + "%"%>">

            </div>
                    <%
                }
            %>
        </div>
    </div>


    <%
        if(hasProject)
        {
            for(ProjectPlan plan : project.getProjectPlanList())
            {
                %>
    <br>
    <div class="project_plan_label">
        <div class="project_plan_button">
            <%=
            new SimpleDateFormat("yyyy·MM·dd").format(plan.getPlanTime())
            %>
        </div>
        <div class="project_plan_text">
            <%=
            plan.getPlanText()
            %>
        </div>
    </div>
                <%
            }
        }
    %>



</div>

<br>
<br>
<br>
<br>
<script src="js/jquery.rotate.min.js" type="text/javascript"></script>

</body>
</html>
