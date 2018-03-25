package com.muyang.filter;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class VisitorStatistics implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest)servletRequest;
        HttpServletResponse response = (HttpServletResponse)servletResponse;


        boolean isLogin = false;
        Cookie[] cookieList = request.getCookies();

        for(Cookie cookie : cookieList)
        {
            if(cookie.getName().equals("BeforeLogin"))
            {
                isLogin = true;
            }
        }

        if(!isLogin)
        {
            System.out.println("这个用户今天第一次访问这个网站");
            Cookie cookie_temp = new Cookie("BeforeLogin","1");
            cookie_temp.setMaxAge(60*60*22);
            response.addCookie(cookie_temp);
        }

        filterChain.doFilter(request,response);

    }

    @Override
    public void destroy() {

    }
}
