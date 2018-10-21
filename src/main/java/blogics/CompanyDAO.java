package blogics;

import java.sql.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;
import util.Debug;

import java.util.*;

public class CompanyDAO {

    public CompanyDAO(){

    }

    public static Company[] getAllCompanies(DataBase db) throws NotFoundDBException,ResultSetDBException{

        Company[] companies=null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT * FROM company WHERE active_fl=1";

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

    public static Company[] getFilteredCompanies (DataBase db,Map<String,Integer> filters) throws NotFoundDBException,ResultSetDBException{

        Company[] companies=null;
        String sql;
        ResultSet rs;
        ArrayList<String> parameters=new ArrayList();
        int i=0;

        sql="SELECT * FROM company";

        //filters.forEach((key,value) -> Debug.println(key + ":"+ value)); Lambda Way

        if(filters.containsKey("productCategoryId")){
            //TODO Find Out if we can query 'active_fl=1' even here
            sql=sql + " JOIN company_product ON company.company_id=company_product.company_id AND product_category_id=?";
            parameters.add(filters.get("productCategoryId").toString());

        }

        if (filters.containsKey("userId") && filters.containsKey("clientTypeId")) {

            sql = sql + " WHERE user_id=? AND client_type_id=? AND active_fl=1";
            parameters.add(filters.get("userId").toString());
            parameters.add(filters.get("clientTypeId").toString());

        }

        if (filters.containsKey("userId") && !filters.containsKey("clientTypeId")) {

            sql = sql + " WHERE user_id=? AND active_fl=1";
            parameters.add(filters.get("userId").toString());

        }

        if (!filters.containsKey("userId") && filters.containsKey("clientTypeId")) {

            sql = sql + " WHERE client_type_id=? AND active_fl=1";
            parameters.add(filters.get("clientTypeId").toString());

        }

        rs=db.select(sql,parameters);

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

    public static Company getCompany(DataBase db, Integer companyId) throws NotFoundDBException,ResultSetDBException{

        Company company=null;
        String sql;
        ResultSet rs;

        sql="SELECT * FROM company WHERE company_id ="+companyId+" AND active_fl=1";


        rs=db.select(sql);

        try{
            if(rs.next()){
                company= new Company(rs);
            }
            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("CompanyDAO.getCompany(): ResultSetDBException: "+ex.getMessage(), db);
        }

        return company;

    }

    public static void deleteCompany(DataBase db, Integer companyId) throws NotFoundDBException{

        String sql="UPDATE contact_person SET active_fl=0 WHERE company_id="+companyId;

        db.modify(sql);

        sql="UPDATE company SET active_fl=0 WHERE company_id="+companyId;

        db.modify(sql);

    }

    public static void deleteProductCategory(DataBase db, Integer companyId, Integer productCategoryId) throws NotFoundDBException{

        String sql;

        sql="DELETE FROM company_product"
                + " WHERE company_id="+companyId+" AND product_category_id="+productCategoryId;

        db.modify(sql);
    }
}
