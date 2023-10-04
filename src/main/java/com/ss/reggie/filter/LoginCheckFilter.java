package com.ss.reggie.filter;

import com.alibaba.fastjson.JSON;
import com.ss.reggie.common.BaseContext;
import com.ss.reggie.common.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.AntPathMatcher;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

// "/*" 表示所有请求都拦截
@WebFilter(filterName = "loginCheckFilter",urlPatterns = "/*")
@Slf4j
public class LoginCheckFilter implements Filter {
    public static final AntPathMatcher PATH_MATCHER=new AntPathMatcher();

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request=(HttpServletRequest) servletRequest;
        HttpServletResponse response=(HttpServletResponse) servletResponse;

        // 获取本次请求的URI
        String uri = request.getRequestURI();

        log.info("拦截到请求：{}",uri);

        String[] urls=new String[]{
                "/employee/login",
                "/employee/logout",
                "/backend/**",
                "/front/**",
                "/common/**",
                "/user/sendMsg",
                "/user/login"
        };

        boolean check=check(urls,uri);
        // 不需要处理，放行
        if(check){
            log.info("本次请求不需要处理：{}",uri);
            filterChain.doFilter(request,response);
            return;
        }

        // 判断服务端是否登录,已登录，则放行
        if(request.getSession().getAttribute("employee")!=null){
            log.info("用户已登录, 用户id为：{}",request.getSession().getAttribute("employee"));

            Long empId=(Long) request.getSession().getAttribute("employee");
            BaseContext.setCurrentId(empId);

            filterChain.doFilter(request,response);
            return;
        }

        // 判断移动端是否登录,已登录，则放行
        if(request.getSession().getAttribute("user")!=null){
            log.info("用户已登录, 用户id为：{}",request.getSession().getAttribute("user"));

            Long userId=(Long) request.getSession().getAttribute("user");
            BaseContext.setCurrentId(userId);

            filterChain.doFilter(request,response);
            return;
        }

        // 没有登录，则通过输出流方式向客户端页面响应数据
        log.info("用户未登录");
        response.getWriter().write(JSON.toJSONString(R.error("NOTLOGIN")));
        return;
    }

    public boolean check(String[] urls,String uri){
        for(String url:urls){
            boolean match=PATH_MATCHER.match(url,uri);
            if(match){
                return true;
            }
        }
        return false;
    }
}
