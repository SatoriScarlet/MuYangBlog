<%@ page import="java.util.List" %>
<%@ page import="com.muyang.entity.Project" %><%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/3/6
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>项目列表</title>

    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="js/individualprojectlist.js" type="text/javascript"></script>


    <link rel="stylesheet" href="amazeui/assets/css/amazeui.flat.css"/>
    <link rel="stylesheet" href="css/individualprojectlist.css">
</head>
<body>
<%!
    List<Project> projectList = null;

%>


<%@include file="Header.jsp"%>
<%@include file="Sidebar.jsp"%>
<%@include file="PopupMessage.jsp"%>
<%@include file="AI.jsp"%>

<%
    if(request.getAttribute("projectList") != null)
    {
        projectList = (List<Project>)request.getAttribute("projectList");
    }
    else
    {
        response.sendRedirect("BlogProjectList");
    }

%>
<br>
<div class="projectList_statistics_div">
<div class="projectList_statistics">当前一共有 <span style="font-weight: bold"><%= projectList.size() %></span> 个可公开项目</div>
</div>
<%
    if(projectList != null)
    {
        for(Project project:projectList)
        {
            %>
<div class="projectList_project_div">
    <div class="projectList_project_image">
        <img src="img/project_icon/<%=project.getProjectId()%>.png" onerror="this.src='img/no_image.png'" onclick="window.location.href = 'BlogProject?projectid=<%=project.getProjectId()%>'" width="100%" height="100%">
    </div>
    <div class="projectList_project_info_div">
        <div class="projectList_project_info">
            项目名称：<%= project.getProjectName()%>
        </div>
        <div class="projectList_project_info">
            项目类型： <%= project.getProjectLittleName()%>
        </div>
        <div class="projectList_project_info" style="color: #ae000a;">
            完成度： <%= project.getProjectPlanValue() + "%"%>
        </div>
        <div class="projectList_project_info" id="projectList_project_info_completeness" style="width:<%= project.getProjectPlanValue() + "%"%> ">

        </div>
    </div>

</div>
            <%
        }
    }
%>

<%--<div class="projectList_project_div">--%>
    <%--<div class="projectList_project_image">--%>
        <%--<img src="img/backgroup/1.jpg" alt="图片提示信息">--%>
    <%--</div>--%>
    <%--<div class="projectList_project_info_div">--%>
        <%--<div class="projectList_project_info">--%>
            <%--项目名称：--%>
        <%--</div>--%>
        <%--<div class="projectList_project_info">--%>
            <%--项目类型：--%>
        <%--</div>--%>
        <%--<div class="projectList_project_info" style="color: #ae000a;">--%>
            <%--完成度：--%>
        <%--</div>--%>
        <%--<div class="projectList_project_info" id="projectList_project_info_completeness">--%>

        <%--</div>--%>
    <%--</div>--%>

<%--</div>--%>

<%--<div class="new_backgroup"></div>--%>

<script src="js/jquery-shadow.js" type="text/javascript"></script>
</body>
</html>
