package blogics;

import services.databaseservice.DataBase;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;

public class TagDAO {
    
    public TagDAO(){

    }

    public static Tag[] getAllTags(DataBase db) throws NotFoundDBException, ResultSetDBException {

        Tag[] tags =null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT * FROM tag";


        rs=db.select(sql);

        try{
            if(rs.next()){
                rs.last();
                tags = new Tag[rs.getRow()];
                rs.beforeFirst();

                while(rs.next()){
                    tags[i]=new Tag(rs);
                    i++;
                }
            }
            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("TagDAO.getTags(): Errore nel ResultSet: "+ex.getMessage(),db);
        }

        return tags;

    }

    public static Tag[] getTags(DataBase db, Integer companyId) throws NotFoundDBException,ResultSetDBException{

        Tag[] tags =null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT S.tag_id, S.name "
                + "FROM tag AS S "
                + "JOIN company_tag AS C "
                + "ON S.tag_id=C.tag_id "
                + "WHERE company_id="+companyId;

        rs=db.select(sql);

        try{

            if(rs.next()){
                rs.last();
                tags = new Tag[rs.getRow()];
                rs.beforeFirst();

                while(rs.next()){
                    tags[i]= new Tag(rs);
                    i++;
                }
            }
            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("TagDAO.getTags(): Errore nel ResultSet: "+ex.getMessage(),db);
        }

        return tags;

    }

}
