package blogics;

import java.sql.*;
import java.util.Date;
import java.util.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;

import javax.persistence.criteria.CriteriaBuilder;


public class Company {

    public int companyId;
    public String name;
    public String vat;
    public String address;
    public String city;
    public Integer zip;
    public String country;
    public String state;
    public String email;
    public int clientTypeId;
    public int productCategoryId;
    public int userId;
    public Date startDate;

    public Company(ResultSet result){

        try {companyId=result.getInt("company_id");} catch(SQLException sqle) {}
        try {clientTypeId=result.getInt("client_type_id");} catch(SQLException sqle) {}
        try {productCategoryId=result.getInt("product_category_id");} catch(SQLException sqle) {}
        try {userId=result.getInt("user_id");} catch(SQLException sqle) {}
        try {name=result.getString("name");} catch(SQLException sqle) {}
        try {vat=result.getString("vat");} catch(SQLException sqle) {}
        try {address=result.getString("address");} catch(SQLException sqle) {}
        try {city=result.getString("city");} catch(SQLException sqle) {}
        try {
            country = result.getString("country");
        } catch (SQLException sqle) {
        }
        try {
            state = result.getString("state");
        } catch (SQLException sqle) {
        }
        try {
            zip = result.getInt("zip_code");
        } catch (SQLException sqle) {
        }
        try {email=result.getString("email");} catch(SQLException sqle) {}
        try {
            startDate = result.getDate("start_date");
        } catch (SQLException sqle) {
        }
    }

    public Company(Integer companyId, Integer clientTypeId, Integer productCategoryId, Integer userId, String name, String vat, String address, String city, String country, String state, Integer zip, String email, Date date) {
        this.companyId=companyId;
        this.clientTypeId=clientTypeId;
        this.productCategoryId=productCategoryId;
        this.userId=userId;
        this.name=name;
        this.vat=vat;
        this.address=address;
        this.city=city;
        this.country = country;
        this.zip = zip;
        this.state = state;
        this.email=email;
        this.startDate = date;
    }

    public void insert(DataBase database) throws NotFoundDBException,DuplicatedRecordDBException,ResultSetDBException {

        String query;
        ArrayList<String> parameters=new ArrayList();
        ResultSet rs;
        boolean exist;

        //Converto data
        java.sql.Date sqlDate = new java.sql.Date(startDate.getTime());

        //Check unicita
        query = "SELECT name FROM company WHERE name=? AND active_fl=1";

        parameters.add(name);

        rs=database.select(query,parameters);

        try {
            exist=rs.next(); //Perchè ResultSet restituisce il puntatore all'elemento prima della 1^riga
            rs.close();
        }
        catch (SQLException e) {
            throw new ResultSetDBException("Company.insert(): Errore sul ResultSet.");
        }

        if (exist) {
            //Eccezione buona, che mi serve per passare verso l'alto un messaggio, al Bean che ha chiamato questa inserti, per dirgli che non la posso fare
            //sarà poi il Bean che decide come gestire questa situazione.
            throw new DuplicatedRecordDBException("Company.insert(): Tentativo di inserimento di un nome gia esistente."); //passo l'eccezione verso l'alto al bean che mi ha chiamato l'insert
        }


        query = "INSERT INTO company(company_id, client_type_id, product_category_id, user_id, name, vat, address, city, country, state, zip_code, email, start_date)" +
                "VALUES(" + companyId + "," + clientTypeId + "," + productCategoryId + "," + userId + ",?,?,?,?,?,?," + zip + ",?,?)";


        parameters.add(vat);
        parameters.add(address);
        parameters.add(city);
        parameters.add(country);
        parameters.add(state);
        parameters.add(email);

        database.modify(query, parameters, sqlDate);
    }

    public void update(DataBase db) throws NotFoundDBException,ResultSetDBException,DuplicatedRecordDBException{

        String sql;
        ArrayList<String> parameters=new ArrayList();
        ResultSet rs;
        boolean exist;

        java.sql.Date sqlDate = new java.sql.Date(startDate.getTime());

        /*Controllo che il nome aggiornato che sto per inserire non sia già presente*/
        sql="SELECT company_id FROM company WHERE company_id<>"+companyId+" AND name=? AND active_fl=1";

        parameters.add(name);

        rs=db.select(sql, parameters);

        try{
            exist=rs.next();
            rs.close();
        }
        catch (SQLException e){
            throw new ResultSetDBException("Company.update(): Errore sul ResultSet.");
        }

        if (exist){
            throw new DuplicatedRecordDBException("company.update(): Tentativo di inserimento di una compagnia già esistente.");
        }

        sql=" UPDATE company "
                + " SET name=?, client_type_id=" + clientTypeId + ", product_category_id=" + productCategoryId + ", user_id=" + userId + ", vat=?, address=?, city=?, country=?, state=?, zip_code=" + zip + ", email=?, start_date=?"
                +" WHERE company_id="+companyId;

        parameters.add(vat);
        parameters.add(address);
        parameters.add(city);
        parameters.add(country);
        parameters.add(state);
        parameters.add(email);

        db.modify(sql, parameters, sqlDate);
    }

    public void delete(DataBase db) throws NotFoundDBException,ResultSetDBException {

        String sql;

        sql=" UPDATE company SET active_fl=0 WHERE company_id="+companyId;

        db.modify(sql);
    }
}

