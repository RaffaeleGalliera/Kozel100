package blogics;

import services.databaseservice.DataBase;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ConversationNoteDAO {
    public ConversationNoteDAO(){

    }

    public static ConversationNote[] getConversationNotes(DataBase db, int conversationId) throws NotFoundDBException, ResultSetDBException {

        ConversationNote[] conversationNotes=null;
        String sql;
        ResultSet rs;
        int i=0;

        sql = "SELECT * FROM conversation_note WHERE conversation_id=" + conversationId + " WHERE active_fl=1";


        rs=db.select(sql);

        try{
            if(rs.next()){
                rs.last();
                conversationNotes= new ConversationNote[rs.getRow()];
                rs.beforeFirst();

                while(rs.next()){
                    conversationNotes[i]=new ConversationNote(rs);
                    i++;
                }
            }
            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("ConversationNoteDAO.getConversationNote(): Errore nel ResultSet: "+ex.getMessage(),db);
        }

        return conversationNotes;

    }

    public static ConversationNote[] getAllConversationNotes(DataBase db) throws NotFoundDBException, ResultSetDBException {

        ConversationNote[] conversationNotes=null;
        String sql;
        ResultSet rs;
        int i=0;

        sql = "SELECT * FROM conversation_note WHERE active_fl=1";


        rs=db.select(sql);

        try{
            if(rs.next()){
                rs.last();
                conversationNotes= new ConversationNote[rs.getRow()];
                rs.beforeFirst();

                while(rs.next()){
                    conversationNotes[i]=new ConversationNote(rs);
                    i++;
                }
            }
            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("ConversationNoteDAO.getAllConversationNote(): Errore nel ResultSet: "+ex.getMessage(),db);
        }

        return conversationNotes;

    }

    public static ConversationNote[] getCompanyNotes(DataBase db, int companyId) throws NotFoundDBException,ResultSetDBException {

        ConversationNote[] conversationNotes=null;
        String sql;
        ResultSet rs;
        int i=0;

        sql = "SELECT CN.conversation_note_id, CN.conversation_id, CN.user_id, CN.note, CN.title, CN.created_at, CN.updated_at " +
                "FROM conversation_note AS CN JOIN conversation AS C on CN.conversation_id = C.conversation_id " +
                "WHERE company_id=" + companyId + " AND CN.active_fl=1 " +
                "ORDER BY CN.updated_at DESC";


        rs=db.select(sql);

        try{
            if(rs.next()){
                rs.last();
                conversationNotes= new ConversationNote[rs.getRow()];
                rs.beforeFirst();

                while(rs.next()){
                    conversationNotes[i]=new ConversationNote(rs);
                    i++;
                }
            }
            rs.close();
        } catch (SQLException ex) {
            throw new ResultSetDBException("ConversationNoteDAO.getAllConversationNote(): Errore nel ResultSet: "+ex.getMessage(),db);
        }

        return conversationNotes;

    }

    public static ConversationNote[] getNotesByOtherUsers(DataBase db, int userId) throws NotFoundDBException, ResultSetDBException {

        ConversationNote[] conversationNotes = null;
        String sql;
        ResultSet rs;
        int i = 0;

        sql = "SELECT CN.conversation_note_id, CN.conversation_id, CN.user_id, CN.note, CN.title, CN.created_at, CN.updated_at " +
                "FROM conversation_note AS CN JOIN conversation AS C on CN.conversation_id = C.conversation_id JOIN company AS CO ON CO.company_id=C.company_id " +
                "WHERE CO.user_id = " + userId + " AND CN.user_id!=" + userId + " AND CN.active_fl=1 " +
                "ORDER BY CN.updated_at DESC";

        rs = db.select(sql);

        try {
            if (rs.next()) {
                rs.last();
                conversationNotes = new ConversationNote[rs.getRow()];
                rs.beforeFirst();

                while (rs.next()) {
                    conversationNotes[i] = new ConversationNote(rs);
                    i++;
                }
            }
            rs.close();
        } catch (SQLException ex) {
            throw new ResultSetDBException("ConversationNoteDAO.getAllConversationNote(): Errore nel ResultSet: " + ex.getMessage(), db);
        }

        return conversationNotes;

    }

    public static ConversationNote[] getNoteByUser(DataBase db, int userId) throws NotFoundDBException, ResultSetDBException {

        ConversationNote[] conversationNotes = null;
        String sql;
        ResultSet rs;
        int i = 0;

        sql = "SELECT * FROM conversation_note"
                + " WHERE user_id=" + userId + " AND active_fl=1"
                + " ORDER BY created_at DESC";


        rs = db.select(sql);

        try {
            if (rs.next()) {
                rs.last();
                conversationNotes = new ConversationNote[rs.getRow()];
                rs.beforeFirst();

                while (rs.next()) {
                    conversationNotes[i] = new ConversationNote(rs);
                    i++;
                }
            }
            rs.close();
        } catch (SQLException ex) {
            throw new ResultSetDBException("ConversationNoteDAO.getAllConversationNote(): Errore nel ResultSet: " + ex.getMessage(), db);
        }

        return conversationNotes;

    }

    public static ConversationNote getNote(DataBase db, Integer noteId) throws NotFoundDBException, ResultSetDBException {

        ConversationNote conversationNote = null;
        String sql;
        ResultSet rs;

        sql = "SELECT * FROM conversation_note WHERE conversation_note_id =" + noteId + " AND active_fl=1";


        rs = db.select(sql);

        try {
            if (rs.next()) {
                conversationNote = new ConversationNote(rs);
            }
            rs.close();
        } catch (SQLException ex) {
            throw new ResultSetDBException("ConversationNoteDAO.getConversationNote(): ResultSetDBException: " + ex.getMessage(), db);
        }

        return conversationNote;

    }

    public static void delete(DataBase db, Integer noteId) throws NotFoundDBException {

        String sql = "UPDATE conversation_note SET active_fl=0 WHERE conversation_note_id=" + noteId;

        db.modify(sql);

    }
}


