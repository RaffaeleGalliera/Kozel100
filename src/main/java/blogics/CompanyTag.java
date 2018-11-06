package blogics;

import java.sql.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;

public class CompanyTag {

    public Integer companyId;
    public Integer tagId;

    public CompanyTag(Integer companyId, Integer tagId){

        this.companyId=companyId;
        this.tagId=tagId;
    }

    public CompanyTag(ResultSet rs){

        try {companyId=rs.getInt("company_id"); } catch (SQLException sqle) {}
        try {tagId=rs.getInt("tag_id"); } catch (SQLException sqle) {}
    }

    public void insert(DataBase db) throws NotFoundDBException,ResultSetDBException{

        String sql;
        ResultSet rs;
        boolean exist;

        /*Check di unicità*/
        sql="SELECT company_id FROM company_tag WHERE company_id="+companyId+" AND tag_id="+tagId;

        rs=db.select(sql);

        try {
            exist=rs.next(); //Perchè ResultSet restituisce il puntatore all'elemento prima della 1^riga
            rs.close();
        }
        catch (SQLException e) {
            throw new ResultSetDBException("tag.insert(): Errore sul ResultSet.");
        }

        if (!exist) {
            //Se non esiste inserisco,  altrimenti non succede nulla
            sql="INSERT INTO company_tag (company_id, tag_id)"
                    + "VALUES ("+companyId+","+tagId+")";
            db.modify(sql);
        }


    }



}
