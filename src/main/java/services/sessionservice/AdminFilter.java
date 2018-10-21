package services.sessionservice;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

 /*ServletContext logs are used to log filter initialization and user actions.
 These logs can be viewed from %TOMCAT_HOME/logs/localhost.$(date).log file.*/

public class AdminFilter implements Filter {

    private ServletContext context;

    public void init(FilterConfig fConfig) throws ServletException {

        this.context = fConfig.getServletContext();
        this.context.log("AdminFilter initialized");

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        Cookie[] cookies = req.getCookies();
        boolean isAdmin=false;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("jwt_auth_token") && Session.isAdmin(cookie)) {

                    isAdmin = true;

                }
            }
        }

            //If the user isn't providing a valid token i'll send him back to login page
            if(!isAdmin){

                String redirectURL = "/Dashboard.jsp";
                this.context.log("Non admin user tried to access forbidden content");
                res.sendRedirect(redirectURL);

            }else{

                chain.doFilter(request, response);

            }




    }

    public void destroy() {
        //close any resources here
    }
}
