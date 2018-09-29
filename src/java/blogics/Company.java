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

    public Company(ResultSet result){

        try {companyId=result.getInt("company_id");} catch(SQLException sqle) {}
        try {name=result.getString("name");} catch(SQLException sqle) {}
        try {vat=result.getString("vat");} catch(SQLException sqle) {}
        try {address=result.getString("address");} catch(SQLException sqle) {}
        try {city=result.getString("city");} catch(SQLException sqle) {}
        try {email=result.getString("email");} catch(SQLException sqle) {}
    }

    public Company(Integer companyId, String name, String vat, String address, String city, String email){
        this.companyId=companyId;
        this.name=name;
        this.vat=vat;
        this.address=address;
        this.city=city;
        this.email=email;
    }

    public void insert(DataBase database) throws NotFoundDBException,DuplicatedRecordDBException,ResultSetDBException {

        String query;
        ArrayList<String> parameters=new ArrayList();
        ResultSet result;
        boolean exists;

        //Check unicita

        query="INSERT INTO company(company_id, name, vat, address, city, email)" +
              "VALUES("+companyId+",?,?,?,?,?)";


        parameters.add(name);
        parameters.add(vat);
        parameters.add(address);
        parameters.add(city);
        parameters.add(email);

        database.modify(query,parameters);

    }





}
