package services.sessionservice;

import java.io.IOException;
import java.util.Enumeration;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletRequest;

import blogics.AuditLog;
import blogics.CompanyDAO;
import blogics.UserDAO;
import services.databaseservice.*;
import services.databaseservice.exception.*;
import services.errorservice.EService;
import services.tokenservice.JWTService;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import services.logservice.AuditLogger;

public class AuditLogFilter implements Filter {

    private final static Logger LOGGER = Logger.getLogger(Logger.GLOBAL_LOGGER_NAME);

    public void init(FilterConfig fConfig) {
        try {
            AuditLogger.setup();
        } catch (IOException e) {
            e.printStackTrace();
            throw new RuntimeException("Problems with creating the log files");
        }

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        Integer userId = -1;
        String userEmail = "Not Logged";
        HttpServletRequest req = (HttpServletRequest) request;
        String uri = req.getRequestURI();
        DataBase database = null;

        if (uri.startsWith("/index.jsp") || uri.equals("/favicon.ico") || uri.startsWith("/Common") || uri.startsWith("/css") || uri.startsWith("/resources")) {
            chain.doFilter(request, response); // Just continue chain.
        } else {
            try {
                database = DBService.getDataBase();
                Cookie[] cookies = req.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equals("jwt_auth_token") && Session.isAuthorized(cookie)) {

                            userId = Session.getUserID(cookie);
                            userEmail = UserDAO.getUser(database, userId).email;

                        }
                    }
                }
                String method = req.getMethod();
                String ip = req.getRemoteAddr();

                Enumeration<String> enumeration = req.getParameterNames();
                String message = "Requested Resource: " + uri + " Method: " + method + " IP: " + ip + " User Email: " + userEmail;
                String parameterMessage = "";
                String status = "view";
                String company = "None";
                while (enumeration.hasMoreElements()) {
                    String parameterName = enumeration.nextElement();
                    if (parameterName.equals("status")) {
                        status = req.getParameter(parameterName);
                    } else {

                        if (parameterName.equals("companyId")) {
                            int companyId = Integer.parseInt(req.getParameter(parameterName));
                            company = CompanyDAO.getCompany(database, companyId).name;
                        }

                        String details = parameterName + " : " + req.getParameter(parameterName) + "";
                        parameterMessage = parameterMessage + details;
                    }
                }
                LOGGER.setLevel(Level.SEVERE);
                LOGGER.severe(message + " Action: " + status + " Company: " + company + " Parameters: " + parameterMessage);
                AuditLog auditLog = new AuditLog(company, userEmail, uri, method, ip, status, parameterMessage);
                auditLog.insert(database);
                database.commit();
            } catch (NotFoundDBException ex) {
                EService.logAndRecover(ex);
            } catch (ResultSetDBException ex) {
                EService.logAndRecover(ex);
            } finally {
                try {
                    database.close();
                    chain.doFilter(request, response);

                } catch (NotFoundDBException e) {
                    EService.logAndRecover(e);
                }
            }
        }
    }


    @Override
    public void destroy() {
    }
}