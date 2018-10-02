package blogics;

import java.sql.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;
import java.util.*;
public class CompanyDAO {

    public CompanyDAO(){

    }

    public static Company[] getAllCompanies(DataBase db) throws NotFoundDBException,ResultSetDBException{

        Company[] companies=null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT * FROM company";

        rs=db.select(sql);

        try{
            if(rs.next()){
                rs.last();
                companies= new Company[rs.getRow()];
                rs.beforeFirst();

                while(rs.next()){
                    companies[i]=new Company(rs);
                    i++;
                }
            }
            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("CompanyDAO.getAllCompanies(): Errore nel ResultSet: "+ex.getMessage(),db);
        }

        return companies;

    }
    
    public static Integer getNewID(DataBase db) throws NotFoundDBException, ResultSetDBException{

        String sql;
        ResultSet rs;
        Integer companyId;

        sql="SELECT MAX(company_id) AS N FROM company FOR UPDATE";

        try {
            rs=db.select(sql);

            if (rs.next()) //Se ho letto qualcosa
                companyId = rs.getInt("N")+1;
            else //la tabella è vuota
                companyId = 1;

            rs.close();

            return companyId;
        }
        catch (SQLException e) {
            throw new ResultSetDBException("COmpanyDAO.getNewID(): Errore sul ResultSet --> impossibile calcolare CompanyId.");
        }

    }
}
