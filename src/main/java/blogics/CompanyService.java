package blogics;

import java.sql.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;

public class CompanyService {

    public Integer companyId;
    public Integer consultingServiceId;

    public CompanyService(Integer companyId, Integer consultingServiceId){

        this.companyId=companyId;
        this.consultingServiceId=consultingServiceId;
    }

    public CompanyService(ResultSet rs){

        try {companyId=rs.getInt("company_id"); } catch (SQLException sqle) {}
        try {consultingServiceId=rs.getInt("consulting_service_id"); } catch (SQLException sqle) {}
    }

    public void insert(DataBase db) throws NotFoundDBException,ResultSetDBException,DuplicatedRecordDBException{

        String sql;
        ResultSet rs;
        boolean exist;

        /*Check di unicità*/
        sql="SELECT companyId FROM company_service WHERE company_id="+companyId+" AND consulting_service_id="+consultingServiceId;

        rs=db.select(sql);

        try {
            exist=rs.next(); //Perchè ResultSet restituisce il puntatore all'elemento prima della 1^riga
            rs.close();
        }
        catch (SQLException e) {
            throw new ResultSetDBException("CompanyService.insert(): Errore sul ResultSet.");
        }

        if (exist) {
            //Eccezione buona, che mi serve per passare verso l'alto un messaggio, al Bean che ha chiamato questa inserti, per dirgli che non la posso fare
            //sarà poi il Bean che decide come gestire questa situazione. 
            throw new DuplicatedRecordDBException("CompanyService.insert(): Tentativo di inserimento di un companyService già esistente."); //passo l'eccezione verso l'alto al bean che mi ha chiamato l'insert
        }

        sql="INSERT INTO company_service (companyId,consultingServiceId)"
                + "VALUES ("+companyId+","+consultingServiceId+")";

        db.modify(sql);

    }

    public void delete(DataBase db) throws NotFoundDBException{

        String sql;

        sql=" DELETE FROM company_service"
                + " WHERE companyId="+companyId;

        db.modify(sql);
    }

}
