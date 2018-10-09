package blogics;

import java.sql.*;
import java.util.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;


public class ContactPerson {

    public int contactPersonId;
    public int companyId;
    public String firstName;
    public String lastName;
    public String email;
    public String phoneNumber;

    public ContactPerson(ResultSet result){

        try {contactPersonId=result.getInt("contact_person_id");} catch(SQLException sqle) {}
        try {companyId=result.getInt("company_id");} catch(SQLException sqle) {}
        try {firstName=result.getString("first_name");} catch(SQLException sqle) {}
        try {lastName=result.getString("last_name");} catch(SQLException sqle) {}
        try {email=result.getString("email");} catch(SQLException sqle) {}
        try {phoneNumber=result.getString("phone_number");} catch(SQLException sqle) {}
    }

    public ContactPerson(Integer companyId, String firstName, String lastName, String phoneNumber, String email){
        this.companyId = companyId;
        this.firstName=firstName;
        this.lastName=lastName;
        this.email=email;
        this.phoneNumber=phoneNumber;
    }

    public String fullName(){
        return firstName + " " + lastName;
    }

    public void insert(DataBase database) throws NotFoundDBException,DuplicatedRecordDBException,ResultSetDBException {

        String query;
        ArrayList<String> parameters=new ArrayList();
        ResultSet result;
        boolean exists;

        //Check unicita

        query="INSERT INTO contact_person(contact_person_id, company_id, first_name, last_name, email, phone_number)" +
                "VALUES("+contactPersonId+","+companyId+",?,?,?,?)";

        parameters.add(firstName);
        parameters.add(lastName);
        parameters.add(email);
        parameters.add(phoneNumber);

        database.modify(query,parameters);

    }
}
