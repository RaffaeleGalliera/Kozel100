package blogics;

import java.net.InetAddress;
import java.sql.*;
import java.util.*;
import java.util.Date;

import services.databaseservice.*;
import services.databaseservice.exception.*;


public class AuditLog {

    public int auditLogId;
    public String companyName;
    public String requestedResource;
    public String action;
    public String userEmail;
    public String method;
    public String ip;
    public String details;
    public Timestamp timestamp;

    public AuditLog(ResultSet result) {

        try {
            auditLogId = result.getInt("audit_log_id");
        } catch (SQLException sqle) {
        }
        try {
            companyName = result.getString("company_name");
        } catch (SQLException sqle) {
        }
        try {
            requestedResource = result.getString("requested_resource");
        } catch (SQLException sqle) {
        }
        try {
            userEmail = result.getString("user_email");
        } catch (SQLException sqle) {
        }
        try {
            method = result.getString("method");
        } catch (SQLException sqle) {
        }
        try {
            ip = result.getString("ip");
        } catch (SQLException sqle) {
        }
        try {
            details = result.getString("details");
        } catch (SQLException sqle) {
        }
        try {
            timestamp = result.getTimestamp("created_at");
        } catch (SQLException sqle) {
        }
        try {
            action = result.getString("action");
        } catch (SQLException sqle) {
        }
    }

    public AuditLog(String companyName, String userEmail, String requestedResource, String method, String ip, String status, String parameters) {
        this.companyName = companyName;
        this.userEmail = userEmail;
        this.requestedResource = requestedResource;
        this.method = method;
        this.ip = ip;
        this.details = parameters;
        this.action = status;
    }

    public void insert(DataBase database) throws NotFoundDBException {

        String query;
        ArrayList<String> parameters = new ArrayList();
        ResultSet rs;


        query = "INSERT INTO audit_log(audit_log_id, company_name, user_email, ip, method, details, action, requested_resource)" +
                "VALUES(" + auditLogId + ",?,?,?,?,?,?,?)";

        parameters.add(companyName);
        parameters.add(userEmail);
        parameters.add(ip);
        parameters.add(method);
        parameters.add(details);
        parameters.add(action);
        parameters.add(requestedResource);

        database.modify(query, parameters);

    }
}
