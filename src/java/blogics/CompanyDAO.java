package blogics;

import java.sql.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;
import java.util.*;
public class CompanyDAO {

    public CompanyDAO(){

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
