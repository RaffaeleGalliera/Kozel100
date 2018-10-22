package blogics;

import java.sql.*;
import java.util.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;



public class Company {

    public int companyId;
    public String name;
    public String vat;
    public String address;
    public String city;
    public String email;
    public int clientTypeId;
    public int productCategoryId;

    public Company(ResultSet result){

        try {companyId=result.getInt("company_id");} catch(SQLException sqle) {}
        try {clientTypeId=result.getInt("client_type_id");} catch(SQLException sqle) {}
        try {productCategoryId=result.getInt("product_category_id");} catch(SQLException sqle) {}
        try {name=result.getString("name");} catch(SQLException sqle) {}
        try {vat=result.getString("vat");} catch(SQLException sqle) {}
        try {address=result.getString("address");} catch(SQLException sqle) {}
        try {city=result.getString("city");} catch(SQLException sqle) {}
        try {email=result.getString("email");} catch(SQLException sqle) {}
    }

    public Company(Integer companyId, Integer clientTypeId, Integer productCategoryId, String name, String vat, String address, String city, String email){
        this.companyId=companyId;
        this.clientTypeId=clientTypeId;
        this.productCategoryId=productCategoryId;
        this.name=name;
        this.vat=vat;
        this.address=address;
        this.city=city;
        this.email=email;
    }

    public void insert(DataBase database) throws NotFoundDBException,DuplicatedRecordDBException,ResultSetDBException {

        String query;
        ArrayList<String> parameters=new ArrayList();
        ResultSet rs;
        boolean exist;

        //Check unicita
        query="SELECT name FROM company WHERE name=?";

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


        query="INSERT INTO company(company_id, client_type_id, product_category_id, name, vat, address, city, email)" +
              "VALUES("+companyId+","+clientTypeId+","+productCategoryId+",?,?,?,?,?)";


        parameters.add(vat);
        parameters.add(address);
        parameters.add(city);
        parameters.add(email);

        database.modify(query,parameters);
    }

    public void update(DataBase db) throws NotFoundDBException,ResultSetDBException,DuplicatedRecordDBException{

        String sql;
        ArrayList<String> parameters=new ArrayList();
        ResultSet rs;
        boolean exist;

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
                +" SET name=?, client_type_id="+clientTypeId+", product_category_id="+productCategoryId+", vat=?, address=?, city=?, email=?"
                +" WHERE company_id="+companyId;

        parameters.add(vat);
        parameters.add(address);
        parameters.add(city);
        parameters.add(email);

        db.modify(sql,parameters);
    }

    public void delete(DataBase db) throws NotFoundDBException,ResultSetDBException {

        String sql;

        sql=" UPDATE company SET FL_Attivo=0 WHERE company_id="+companyId;

        db.modify(sql);
    }
}

