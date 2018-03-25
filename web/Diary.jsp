<%@ page import="com.muyang.entity.Diary" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="com.muyang.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2017/12/8
  Time: 10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="tag" uri="WEB-INF/tag.tld" %>
<html>
<head>
    <title>摸鱼日志</title>
</head>

<link rel="stylesheet" href="amazeui/assets/css/amazeui.flat.css"/>

<script src="js/jquery-3.2.1.js" type="text/javascript"></script>
<script src="js/diary.js" type="text/javascript"></script>
<link href="css/diary.css" rel="stylesheet">

<body style="background-color:black ">
<%@include file="Header.jsp"%>
<%@include file="Sidebar.jsp"%>
<%@include file="PopupMessage.jsp"%>
<%@include file="AI.jsp"%>


    <%!
        List<Diary> diaryList = null;
        int pageLength = 1;
        int pageNumber = 1;
        boolean hasDiaryList = false;
    %>
    <%
        if(request.getAttribute("DiaryList") != null)
        {
            diaryList = (List<Diary>)request.getAttribute("DiaryList");
            hasDiaryList = true;
        }
        if(request.getParameter("pageLength") != null)
        {
            pageLength = Integer.parseInt(request.getParameter("pageLength"));
        }
        if(request.getParameter("pageNumber") != null)
        {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        }
        else
        {
            response.sendRedirect("BlogDiary?pageNumber=" + pageNumber);
        }

    %>


<tag:UserPermission permissionList="<%= new int[]{500,495,16} %>" errorCode="1">
<div id="diary_put_maindiv">
    <div id="diary_put_message">
    </div>
</div>
<div id="diary_write_maindiv">
    <div id="diary_write_showdiv">
        <br>外标题<br>
        <input class="diary_write_input" id="diary_write_external" />
        <br><br>内标题<br>
        <input class="diary_write_input" id="diary_write_inside" />
        <br><br>日志内容<br>
        <textarea class="diary_write_input" id="diary_write_text" required="required"></textarea>
        <br><br>
        <input class="diary_write_input" id="diary_submit" value="发布" type="button" />
        <input class="diary_write_input" id="diary_alter" value="修改" type="button" />
        <input class="diary_write_input" id="diary_close" value="关闭" type="button" />

    </div>
</div>
</tag:UserPermission>


    <%
        if(hasDiaryList)
        {
            for(Diary diary : diaryList)
            {
                %>
<br>
<div class="diary_singleMainDiv">
    <div class="diary_external_message">
        <%=
        diary.getExternal_message()
        %>
    </div>
    <div class="diary_inside_message">
        <%=
        diary.getInside_message()
        %>
    </div>
    <div class="diary_text">
        <%=
        diary.getText()
        %>
        <br>
        <%=
            "最后修改于" + DateFormat.getDateTimeInstance(DateFormat.FULL,DateFormat.FULL).format(diary.getAlter_date())
        %>
        <br>
        <%=
            "发布于" + DateFormat.getDateTimeInstance(DateFormat.FULL,DateFormat.FULL).format(diary.getCreate_date())
        %>

<tag:UserPermission permissionList="<%= new int[]{500,495,16} %>" errorCode="1">
        <div class="diary_alter_put">
        </div>
        <div class="diary_delete_put">
        </div>
</tag:UserPermission>
    </div>
    <div class="diary_id AllHide">
        <%=
        diary.getDiaryId()
        %>
    </div>
    <div class="diary_external_message_source AllHide">
        <%=
        diary.getExternal_message()
        %>
    </div>
    <div class="diary_inside_message_source AllHide">
        <%=
        diary.getInside_message()
        %>
    </div>
    <div class="diary_text_source AllHide">
        <%=
        diary.getText()
        %>
    </div>
</div>
<br>
                <%
            }


        }



    %>

<br>
<div id="diary_page_list">
    <%
        for(int i = 1;i <= pageLength;i ++)
        {
            if(pageNumber == i)
            {
                %>
                    <div class="diary_page_number diary_page_select">
                <%=
                    i
                %>
                    </div>
                <%
            }
            else
            {
                %>
                    <div class="diary_page_number">
                <%=
                    i
                %>
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

<%--暂时废弃的方案--%>
<%--<div class="trapezoid">--%>
    <%--<div class="diary_top_message">--%>

        <%--这是一段测试文本--%>
    <%--</div>--%>
<%--</div>--%>




    <%--<br>--%>
    <%--<div class="diary_singleMainDiv">--%>
        <%--<div class="diary_external_message">--%>
            <%--2017年12月9日--%>
        <%--</div>--%>
        <%--<div class="diary_inside_message">--%>
            <%--第一期丢人记录--%>
        <%--</div>--%>
        <%--<div class="diary_text">--%>
            <%--“只有风暴才能击倒大树！”--%>
            <%--<br>--%>
            <%--“fnndp！”--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<br>--%>

    <%--<br>--%>
<%--<div class="diary_singleMainDiv">--%>
    <%--<div class="diary_external_message">--%>
        <%--2017年12月9日--%>
    <%--</div>--%>
    <%--<div class="diary_inside_message">--%>
        <%--第一期丢人记录--%>
    <%--</div>--%>
    <%--<div class="diary_text">--%>
        <%--“只有风暴才能击倒大树！”--%>
        <%--<br>--%>
        <%--“fnndp！”--%>
    <%--</div>--%>
<%--</div>--%>

    <%--<br>--%>
<%--<div class="diary_singleMainDiv">--%>
    <%--<div class="diary_external_message">--%>
        <%--2017年12月9日--%>
    <%--</div>--%>
    <%--<div class="diary_inside_message">--%>
        <%--第一期丢人记录--%>
    <%--</div>--%>
    <%--<div class="diary_text">--%>
        <%--“只有风暴才能击倒大树！”--%>
        <%--<br>--%>
        <%--“fnndp！”--%>
    <%--</div>--%>
<%--</div>--%>


</body>
</html>
