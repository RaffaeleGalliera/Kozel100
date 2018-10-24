package blogics;

import java.sql.*;
import java.util.*;
import java.util.Date;

import services.databaseservice.*;
import services.databaseservice.exception.*;


public class Conversation {

    public int conversationId;
    public int companyId;
    public int userId;
    public String reason;
    public Date date;

    public Conversation(ResultSet result){

        try {conversationId=result.getInt("conversation_id");} catch(SQLException sqle) {}
        try {companyId=result.getInt("company_id");} catch(SQLException sqle) {}
        try {userId=result.getInt("user_id");} catch(SQLException sqle) {}
        try {reason=result.getString("reason");} catch(SQLException sqle) {}
        try {date=result.getDate("date");} catch(SQLException sqle) {}
    }

    public Conversation(Integer companyId, Integer userId, String reason, Date date){
        this.companyId = companyId;
        this.userId= userId;
        this.reason=reason;
        this.date=date;
    }


    public void insert(DataBase database) throws NotFoundDBException {

        String query;
        ArrayList<String> parameters=new ArrayList();
        ResultSet rs;

        java.sql.Date sqlDate = new java.sql.Date(date.getTime());


        query="INSERT INTO conversation(conversation_id, company_id, user_id, reason, date)" +
                "VALUES("+conversationId+","+companyId+","+userId+",?, ?)";

        parameters.add(reason);

        database.modify(query, parameters, sqlDate);

    }
}
