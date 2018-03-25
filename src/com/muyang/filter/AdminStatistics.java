package com.muyang.filter;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AdminStatistics implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;


        boolean isOk = false;

        Cookie[] cookielist = request.getCookies();
        for(Cookie cookie:cookielist)
        {
            if(cookie.getName().equals("PlayAdminAnimate"))
            {
                isOk = true;
            }

        }

        if(!isOk)
        {
            Cookie cookie_temp = new Cookie("PlayAdminAnimate","1");
            System.out.println("今日后台检查已经完成");
            response.addCookie(cookie_temp);
        }

        filterChain.doFilter(request,response);

    }

    @Override
    public void destroy() {

    }
}
