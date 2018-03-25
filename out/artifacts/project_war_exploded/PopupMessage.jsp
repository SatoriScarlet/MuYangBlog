<%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2017/12/3
  Time: 16:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>弹出窗口</title>

    <link rel="stylesheet" href="css/PopupMessage.css">
    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="js/PopupMessage.js" type="text/javascript"></script>
</head>
<body>
    <div id="PopupMessage_MainDiv">

        <div id="PopupMessage_MessageDiv">

        </div>
        <div id="PopupMessage_OptionDiv">
            <div id="PopupMessage_CloseButton">关闭</div>
        </div>
    </div>


    <script>
        $(function () {
    <%
        /*
        错误码列表
        未登录：1969
        无权限：1970
        未开放：514
         */

        if(request.getSession().getAttribute("ErrorCode") != null && request.getSession().getAttribute("hasShowError") != null)
        {
            int errorCode = Integer.parseInt(request.getSession().getAttribute("ErrorCode").toString());
            boolean hasShowError = Boolean.parseBoolean(request.getSession().getAttribute("hasShowError").toString());

            if(hasShowError)
            {
                if(errorCode == 1969)
                {
                    %>
                        showPopupMessage("你尚未登录，无法查看该区域！");
                    <%
                }
                else if(errorCode == 1970)
                {
                    %>
                        showPopupMessage("这块区域你貌似无权访问~<br>你可以联系QQ 149089985 来获取访问许可<br>假设这使你充满<span style='color: #e30002'>决心</span> ");
                    <%
                }
                else if(errorCode == 514)
                {
                    %>
                        showPopupMessage("——该区域正在施工中——<br>施工结束前都无法进入！");
                    <%
                }



                request.getSession().setAttribute("hasShowError",false);
            }
        }
    %>

        });
    </script>


</body>
</html>
