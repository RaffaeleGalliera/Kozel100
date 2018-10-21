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

public class AuthFilter implements Filter {

    private ServletContext context;

    public void init(FilterConfig fConfig) throws ServletException {

        this.context = fConfig.getServletContext();
        this.context.log("AuthenticationFilter initialized");

    }

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        Cookie[] cookies = req.getCookies();
        boolean authorized=false;
        boolean isAdmin=false;

        String path = ((HttpServletRequest) request).getRequestURI();
        if (path.startsWith("/index.jsp")) {
            chain.doFilter(request, response); // Just continue chain.
        } else {

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("jwt_auth_token") && Session.isAuthorized(cookie)) {

                        authorized = true; //Metodo che verifica la validita' del token
                        isAdmin = Session.isAdmin(cookie);

                    }
                }
            }

            //If the user isn't providing a valid token i'll send him back to login page
            if(!authorized){

                String redirectURL = "/index.jsp";
                this.context.log("Unauthorized access request");
                res.sendRedirect(redirectURL);

            }else{

                chain.doFilter(request, response);

            }
        }



    }

    public void destroy() {
        //close any resources here
    }
}