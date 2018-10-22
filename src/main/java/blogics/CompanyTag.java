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

    public void insert(DataBase db) throws NotFoundDBException,ResultSetDBException,DuplicatedRecordDBException{

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

        if (exist) {
            //Eccezione buona, che mi serve per passare verso l'alto un messaggio, al Bean che ha chiamato questa inserti, per dirgli che non la posso fare
            //sarà poi il Bean che decide come gestire questa situazione. 
            throw new DuplicatedRecordDBException("tag.insert(): Tentativo di inserimento di un tag già esistente."); //passo l'eccezione verso l'alto al bean che mi ha chiamato l'insert
        }

        sql="INSERT INTO company_tag (company_id, tag_id)"
                + "VALUES ("+companyId+","+tagId+")";

        db.modify(sql);

    }



}
