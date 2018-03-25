<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: hasee
  Date: 2018/3/8
  Time: 8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>关于我</title>
    <script src="js/jquery-3.2.1.js" type="text/javascript"></script>
    <script src="js/introducemyself.js" type="text/javascript"></script>


    <link rel="stylesheet" href="amazeui/assets/css/amazeui.flat.css"/>
    <link rel="stylesheet" href="css/introducemyself.css">
</head>
<body>

<%@include file="Header.jsp" %>
<%@include file="Sidebar.jsp" %>
<%@include file="PopupMessage.jsp"%>
<%@include file="AnnotationMessage.jsp"%>
<%@include file="AI.jsp"%>

<div class="IntroduceMyself_main_div">
    <div class="IntroduceMyself_text_div">
        <br>
        <div class="IntroduceMyself_title_div">
            个人简介
        </div>
        <div class="IntroduceMyself_hr_div"></div>
        <div class="IntroduceMyself_info_div">
            <br>
            <div class="IntroduceMyself_info_title_div">
                <div class="IntroduceMyself_info_title_text_div">————基本信息————</div>
                <div class="AnnotationMessage_icon_div" style="right: 0;top: 0;">
                    <div class="AnnotationMessage_text_div">
                        <span style="font-weight: bold">Q:</span>信息来源？<br>
                        <span style="font-weight: bold">A:</span>身份证<br>
                    </div>
                </div>
            </div>
            <br>
            <div class="IntroduceMyself_info_text_div">
                <div class="IntroduceMyself_info_line_div">姓名：张穆杨</div>
                <div class="IntroduceMyself_info_hidden_line_div">没隐藏信息！</div>
                <br>
                <div class="IntroduceMyself_info_line_div">年龄：<%= (new Date().getTime() - new SimpleDateFormat("yyyy-MM-dd").parse("1998-10-22").getTime()) / 1000 / 60 / 60 / 24 / 12 / 30 %></div>
                <br>
                <div class="IntroduceMyself_info_line_div">出生日期：1998 - 10 - 22</div>
                <br>
                <div class="IntroduceMyself_info_line_div">种族：苗<%--&nbsp;<span class="IntroduceMyself_hidden_text_div">准确说还有一半土家族</span>--%></div>
                <br>
                <div class="IntroduceMyself_info_line_div">户籍：湖南省湘西自治州吉首市</div>
                <br>
                <div class="IntroduceMyself_info_line_div">现居地：北京</div>
                <br><br>
            </div>
            <div class="IntroduceMyself_info_head_image_div">
                <img src="img/project_icon/main.png" onerror="this.src='img/no_image.png'" style="height: 100%; width: 100%" />
            </div>
        </div>
        <div class="IntroduceMyself_info_div">
            <br>
            <div class="IntroduceMyself_info_title_div">
                <div class="IntroduceMyself_info_title_text_div">————社交信息————</div>
                <div class="AnnotationMessage_icon_div" style="right: 0;top: 0;">
                    <div class="AnnotationMessage_text_div">
                        <span style="font-weight: bold">Q:</span>添加好友了但没接受？<br>
                        <span style="font-weight: bold">A:</span>如果是微信的话，我不经常用微信，所以请见谅~需要联系的话请使用QQ添加好友并注明来意，谢谢。<br>
                        <br>
                        <span style="font-weight: bold">Q:</span>我能给这个手机号打骚扰电话嘛？<br>
                        <span style="font-weight: bold">A:</span>我觉得最好不要这么干<br>
                    </div>
                </div>
            </div>
            <br>
            <div class="IntroduceMyself_info_text_div">
                <table class="IntroduceMyself_info_line_div_array">
                    <tr>
                        <td>
                            <div class="IntroduceMyself_info_line_div">QQ：149089985</div>
                        </td>
                        <td>
                            <div class="IntroduceMyself_info_line_div">手机号：18501144725</div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td><td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <div class="IntroduceMyself_info_line_div">Steam：<span style="cursor: pointer;" onclick="window.location = 'http://steamcommunity.com/id/musezhilang/'">佐渡岩</span>
                            </div>
                            <div class="AnnotationMessage_icon_div" style="right: 10%;top: 0;">
                                <div class="AnnotationMessage_text_div">
                                    点击名字打开Steam个人链接
                                </div>
                            </div>
                        </td>
                        <td>
                            <div class="IntroduceMyself_info_line_div">微信号：musezhilang</div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td><td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <div class="IntroduceMyself_info_line_div">婚姻状态：未婚</div>
                        </td>
                        <td>
                            <div class="IntroduceMyself_info_line_div">政治面貌：团员</div>
                        </td>
                    </tr>
                    <%--<div class="IntroduceMyself_info_line_div">&nbsp;&nbsp;QQ：</div>--%>
                    <%--<br>--%>
                    <%--<div class="IntroduceMyself_info_line_div">&nbsp;&nbsp;手机号：</div>--%>
                    <%--<br>--%>
                    <%--<div class="IntroduceMyself_info_line_div">&nbsp;&nbsp;Steam：</div>--%>
                    <%--<br>--%>
                    <%--<div class="IntroduceMyself_info_line_div">&nbsp;&nbsp;微信号（几乎从来不用）：</div>--%>
                </table>
                <br><br>
            </div>
        </div>
        <div class="IntroduceMyself_info_div">
            <br>
            <div class="IntroduceMyself_info_title_div">
                <div class="IntroduceMyself_info_title_text_div">————个人技能————</div>
                <div class="AnnotationMessage_icon_div" style="right: 0;top: 0;">
                    <div class="AnnotationMessage_text_div">
                        <span style="font-weight: bold">Q:</span>这是技能的百分数代表啥意思？<br>
                        <span style="font-weight: bold">A:</span>代表我对这个技能的理解与熟练度<br>
                        <br>
                        <span style="font-weight: bold">Q:</span>为什么没有一项技能是100%的？<br>
                        <span style="font-weight: bold">A:</span>我不敢保证我完全掌握了某种技能，人总会有失误的时候<br>
                    </div>
                </div>
            </div>
            <br>
            <div class="IntroduceMyself_info_text_div">
                <table class="IntroduceMyself_info_line_div_array">
                    <tr>
                        <td>
                            <div class="IntroduceMyself_info_line_div IntroduceMyself_info_plan_line_div">
                                <div class="IntroduceMyself_info_cover_line_div" ></div>
                                <div class="IntroduceMyself_info_cover_text_line_div">Java（目前主攻）：<span>80%</span></div>
                            </div>
                        </td>
                        <td>
                            <div class="IntroduceMyself_info_line_div IntroduceMyself_info_plan_line_div">
                                <div class="IntroduceMyself_info_cover_line_div" ></div>
                                <div class="IntroduceMyself_info_cover_text_line_div">C#：<span>40%</span></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td><td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <div class="IntroduceMyself_info_line_div IntroduceMyself_info_plan_line_div">
                                <div class="IntroduceMyself_info_cover_line_div" ></div>
                                <div class="IntroduceMyself_info_cover_text_line_div">3DMax：<span>70%</span></div>
                            </div>
                        </td>
                        <td>
                            <div class="IntroduceMyself_info_line_div IntroduceMyself_info_plan_line_div">
                                <div class="IntroduceMyself_info_cover_line_div" ></div>
                                <div class="IntroduceMyself_info_cover_text_line_div">Python：<span>20%</span></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td><td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <div class="IntroduceMyself_info_line_div IntroduceMyself_info_plan_line_div">
                                <div class="IntroduceMyself_info_cover_line_div" ></div>
                                <div class="IntroduceMyself_info_cover_text_line_div">UE4：<span>10%</span></div>
                            </div>
                        </td>
                        <td>
                            <div class="IntroduceMyself_info_line_div IntroduceMyself_info_plan_line_div">
                                <div class="IntroduceMyself_info_cover_line_div" ></div>
                                <div class="IntroduceMyself_info_cover_text_line_div">U3D：<span>50%</span></div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td><td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <div class="IntroduceMyself_info_line_div IntroduceMyself_info_plan_line_div">
                                <div class="IntroduceMyself_info_cover_line_div" ></div>
                                <div class="IntroduceMyself_info_cover_text_line_div">Mysql：<span>80%</span></div>
                            </div>
                        </td>
                        <td>
                            <div class="IntroduceMyself_info_line_div IntroduceMyself_info_plan_line_div">
                                <div class="IntroduceMyself_info_cover_line_div" ></div>
                                <div class="IntroduceMyself_info_cover_text_line_div">Oracle：<span>20%</span></div>
                            </div>
                        </td>
                    </tr>
                </table>
                <br><br>
            </div>
        </div>
        <div class="IntroduceMyself_info_div">
            <br>
            <div class="IntroduceMyself_info_title_div">
                <div class="IntroduceMyself_info_title_text_div">————自我评价————</div>
                <div class="AnnotationMessage_icon_div" style="right: 0;top: 0;">
                    <div class="AnnotationMessage_text_div">
                        <span style="font-weight: bold">Q:</span>是否客观？<br>
                        <span style="font-weight: bold">A:</span>唔......自我评价该怎么客观呢？<br>
                    </div>
                </div>
            </div>
            <br>
            <div class="IntroduceMyself_info_text_field_div">
                对陌生人礼貌，但对比较熟悉的朋友就很放得开<br>
                性格开朗（？），抗压能力强，有过社会工作经验（1年左右）<br>
                对于自己份内的事非常的认真负责<br>
                非常强烈的学习欲，喜欢接触各种新事物<br>
                性格好，能和任何人都相处的很好<br>
                能吃苦耐劳，加班什么的完全不虚<br>
                学习效率一半，但实践效率很高<br>
                不太喜欢用别人写好的东西，但经常打脸（MyBatis天下第一！<br>
                <span style="color: #eb524c;font-weight: bold">独身主义者</span><br>
            </div>
        </div>
        <div class="IntroduceMyself_info_div">
            <br>
            <div class="IntroduceMyself_info_title_div"><div class="IntroduceMyself_info_title_text_div" style="background-color: #d72f31">Warning！Warning！Warning！</div></div>
            <br>
            <div class="IntroduceMyself_info_line_div" onclick="open_AI()">
                测试按钮
            </div>
        </div>
        <br><br>
    </div>
</div>


</body>
</html>
