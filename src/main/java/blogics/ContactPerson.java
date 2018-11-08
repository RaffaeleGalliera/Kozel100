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
        ResultSet rs;
        boolean exist;

        //Check unicita
        query="SELECT email FROM contact_person WHERE email=?";

        parameters.add(email);

        rs=database.select(query,parameters);

        try {
            exist=rs.next(); //Perchè ResultSet restituisce il puntatore all'elemento prima della 1^riga
            rs.close();
        }
        catch (SQLException e) {
            throw new ResultSetDBException("ContactPerson.insert(): Errore sul ResultSet.");
        }

        if (exist) {
            //Eccezione buona, che mi serve per passare verso l'alto un messaggio, al Bean che ha chiamato questa inserti, per dirgli che non la posso fare
            //sarà poi il Bean che decide come gestire questa situazione.
            throw new DuplicatedRecordDBException("ContactPerson.insert(): Tentativo di inserimento di un nome gia esistente."); //passo l'eccezione verso l'alto al bean che mi ha chiamato l'insert
        }

        query="INSERT INTO contact_person(email, contact_person_id, company_id, first_name, last_name, phone_number)" +
                "VALUES(?,"+contactPersonId+","+companyId+",?,?,?)";

        parameters.add(firstName);
        parameters.add(lastName);
        parameters.add(phoneNumber);

        database.modify(query,parameters);

    }

    public void update(DataBase db) throws NotFoundDBException, ResultSetDBException, DuplicatedRecordDBException {

        String sql;
        ArrayList<String> parameters = new ArrayList();
        ResultSet rs;
        boolean exist;


        /*Controllo che il nome aggiornato che sto per inserire non sia già presente*/
        sql = "SELECT contact_person_id FROM contact_person WHERE contact_person_id<>" + contactPersonId + " AND email=?";

        parameters.add(email);

        rs = db.select(sql, parameters);

        try {
            exist = rs.next();
            rs.close();
        } catch (SQLException e) {
            throw new ResultSetDBException("ContactPerson.update(): Errore sul ResultSet.");
        }

        if (exist) {
            throw new DuplicatedRecordDBException("ContactPerson.update(): Tentativo di inserimento di una contatto già esistente.");
        }

        sql = " UPDATE contact_person "
                + " SET email=?, firstName=?, lastName=?, phoneNumber=?"
                + " WHERE contact_person_id=" + contactPersonId;

        parameters.add(firstName);
        parameters.add(lastName);
        parameters.add(phoneNumber);

        db.modify(sql, parameters);
    }
}
