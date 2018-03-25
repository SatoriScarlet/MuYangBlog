package com.muyang.tags;


import com.muyang.entity.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.Tag;
import java.io.IOException;

public class UserPermission implements Tag {

    PageContext pageContext = null;



    public User user = null;
    public HttpServletRequest req = null;
    public HttpServletResponse resp = null;

    private int errorCode = 0;
    /*
    1:跳过
    2:返回上层（先定为返回主页面）
     */
    private int[] permissionList = new int[]{};

    public int getErrorCode() {
        return errorCode;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public int[] getPermissionList() {
        return permissionList;
    }

    public void setPermissionList(int[] permissionList) {
        this.permissionList = permissionList;
    }

    public boolean isError = false;
    public boolean isNullUser = false;

    @Override
    public void setPageContext(PageContext pageContext) {
        this.pageContext = pageContext;
    }

    @Override
    public void setParent(Tag tag) {

    }

    @Override
    public Tag getParent() {
        return null;
    }

    @Override
    public int doStartTag() throws JspException {

        req = (HttpServletRequest)pageContext.getRequest();
        resp = (HttpServletResponse)pageContext.getResponse();

        if(pageContext.getSession().getAttribute("User") == null)
        {
            isError = true;
            isNullUser = true;
        }
        else
        {
            user = (User)pageContext.getSession().getAttribute("User");
        }
        if(!isError)
        {
            for(int i : permissionList)
            {
                if(user.getUserPermission() == i || i == 10000)
                {
                    isError = false;
                    isNullUser = false;
                    return EVAL_BODY_INCLUDE;
                }
            }
            isError = true;
        }

        if(isError)
        {
            if(errorCode == 1)
            {
                isError = false;
                isNullUser = false;
                return SKIP_BODY;
            }
        }
        return EVAL_BODY_INCLUDE;
    }

    @Override
    public int doEndTag() throws JspException {

        if(isError)
        {
            if (errorCode == 2)
            {
                try {
                    resp.sendRedirect("Index.jsp");
                } catch (IOException e) {
                    e.printStackTrace();
                }
                if(isNullUser)
                {
                    req.getSession().setAttribute("ErrorCode",1969);
                }
                else
                {
                    req.getSession().setAttribute("ErrorCode",1970);
                }
                req.getSession().setAttribute("hasShowError",true);
                isError = false;
                isNullUser = false;
                return SKIP_PAGE;
            }
        }
        isError = false;
        isNullUser = false;
        return EVAL_PAGE;

    }

    @Override
    public void release() {
        pageContext = null;
        req = null;
        resp = null;
        user = null;
    }
}
