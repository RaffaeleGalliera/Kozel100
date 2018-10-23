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

        sql="SELECT * FROM conversation_note WHERE conversation_id="+conversationId+"";


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

        sql="SELECT * FROM conversation_note";


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

        sql = "SELECT CN.conversation_note_id, CN.conversation_id, CN.user_id, CN.note, CN.title, CN.created_at " +
                "FROM conversation_note AS CN JOIN conversation AS C on CN.conversation_id = C.conversation_id " +
                "WHERE company_id=" + companyId + " " +
                "ORDER BY CN.created_at DESC";


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
}


