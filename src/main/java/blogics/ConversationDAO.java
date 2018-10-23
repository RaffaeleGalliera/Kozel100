package blogics;

import services.databaseservice.DataBase;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ConversationDAO {
    public ConversationDAO(){

    }

    public static Conversation[] getConversations(DataBase db, int companyId) throws NotFoundDBException, ResultSetDBException {

        Conversation[] conversations=null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT * FROM conversation WHERE company_id="+companyId+" "
                +"ORDER BY date DESC";


        rs=db.select(sql);

        try{
            if(rs.next()){
                rs.last();
                conversations= new Conversation[rs.getRow()];
                rs.beforeFirst();

                while(rs.next()){
                    conversations[i]=new Conversation(rs);
                    i++;
                }
            }
            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("ConversationDAO.getConversation(): Errore nel ResultSet: "+ex.getMessage(),db);
        }

        return conversations;

    }

    public static Conversation[] getAllConversations(DataBase db) throws NotFoundDBException, ResultSetDBException {

        Conversation[] conversations=null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT * FROM conversation";


        rs=db.select(sql);

        try{
            if(rs.next()){
                rs.last();
                conversations= new Conversation[rs.getRow()];
                rs.beforeFirst();

                while(rs.next()){
                    conversations[i]=new Conversation(rs);
                    i++;
                }
            }
            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("ConversationDAO.getAllConversation(): Errore nel ResultSet: "+ex.getMessage(),db);
        }

        return conversations;

    }
}