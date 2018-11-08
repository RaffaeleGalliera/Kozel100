package blogics;

import services.databaseservice.DataBase;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ContactPersonDAO {
    public ContactPersonDAO(){
        
    }

    public static ContactPerson getContactPerson(DataBase db, int companyId) throws NotFoundDBException, ResultSetDBException {

        ContactPerson contactPerson = null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT * FROM contact_person WHERE company_id="+companyId+"";


        rs=db.select(sql);

        try{
            if(rs.next()){
                contactPerson = new ContactPerson(rs);
            }
            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("ContactPersonDAO.GetContactPerson(): ResultSetDBException: " + ex.getMessage(), db);
        }

        return contactPerson;

    }

    public static ContactPerson[] getAllContactPeople(DataBase db) throws NotFoundDBException, ResultSetDBException {

        ContactPerson[] contactPeople=null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT * FROM contact_person";


        rs=db.select(sql);

        try{
            if(rs.next()){
                rs.last();
                contactPeople= new ContactPerson[rs.getRow()];
                rs.beforeFirst();

                while(rs.next()){
                    contactPeople[i]=new ContactPerson(rs);
                    i++;
                }
            }
            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("ContactPersonDAO.getAllContactPerson(): Errore nel ResultSet: "+ex.getMessage(),db);
        }

        return contactPeople;

    }
}
