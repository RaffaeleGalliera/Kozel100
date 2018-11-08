package blogics;

import java.sql.*;
import java.util.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;


public class ConversationNote {

    public int conversationNoteId;
    public int conversationId;
    public int userId;
    public String note;
    public String title;
    public Timestamp createdAt;
    public Timestamp updatedAt;

    public ConversationNote(ResultSet result){

        try {conversationNoteId=result.getInt("conversation_note_id");} catch(SQLException sqle) {}
        try {conversationId=result.getInt("conversation_id");} catch(SQLException sqle) {}
        try {userId=result.getInt("user_id");} catch(SQLException sqle) {}
        try {note=result.getString("note");} catch(SQLException sqle) {}
        try {title=result.getString("title");} catch(SQLException sqle) {}
        try {
            createdAt = result.getTimestamp("created_at");
        } catch (SQLException sqle) {
        }
        try {updatedAt=result.getTimestamp("updated_at");} catch(SQLException sqle) {}

    }

    public ConversationNote(Integer conversationId,Integer userId, String title, String note){
        this.conversationId = conversationId;
        this.userId = userId;
        this.title=title;
        this.note=note;
    }


    public void insert(DataBase database) throws NotFoundDBException,ResultSetDBException {

        String query;
        ArrayList<String> parameters=new ArrayList();
        ResultSet rs;

        query="INSERT INTO conversation_note(conversation_note_id, conversation_id, user_id, title, note)" +
                "VALUES("+conversationNoteId+","+conversationId+","+userId+",?,?)";

        parameters.add(title);
        parameters.add(note);

        database.modify(query,parameters);

    }

    public void update(DataBase db) throws NotFoundDBException, ResultSetDBException, DuplicatedRecordDBException {

        String sql;
        ArrayList<String> parameters = new ArrayList();
        ResultSet rs;
        boolean exist;

        sql = " UPDATE conversation_note "
                + " SET conversation_id=" + conversationId + ", title=?, note=?"
                + " WHERE conversation_note_id=" + conversationNoteId;

        parameters.add(title);
        parameters.add(note);

        db.modify(sql, parameters);
    }

}
