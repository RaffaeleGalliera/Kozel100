package blogics;

import services.databaseservice.DataBase;
import services.databaseservice.exception.DuplicatedRecordDBException;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

public class User{

    public int userId;
    public String email;
    public String password;
    public String firstName;
    public String lastName;
    public String recruitmentDate;
    public Date endWorking;
    public String phoneNumber;
    public int positionId;
    public int workFieldId;


    public User(ResultSet result) {

        try {
            userId = result.getInt("user_id");
        } catch (SQLException sqle) {
        }
        try {
            email = result.getString("email");
        } catch (SQLException sqle) {
        }
        try {
            password = result.getString("password");
        } catch (SQLException sqle) {
        }
        try {
            firstName = result.getString("first_name");
        } catch (SQLException sqle) {
        }
        try {
            lastName = result.getString("last_name");
        } catch (SQLException sqle) {
        }
        try {
            recruitmentDate = result.getString("recruitment_date");
        } catch (SQLException sqle) {
        }
        try {
            endWorking = result.getDate("end_working");
        } catch (SQLException sqle) {
        }
        try {
            phoneNumber = result.getString("phone_number");
        } catch (SQLException sqle) {
        }
        try {
            positionId = result.getInt("position_id");
        } catch (SQLException sqle) {
        }
        try {
            workFieldId = result.getInt("work_field_id");
        } catch (SQLException sqle) {
        }

    }

    public User(int userId, String email, String password, String firstName, String lastName, String recruitmentDate, Date endWorking, String phoneNumber, int positionId, int workFieldId) {

        this.userId = userId;
        this.email = email;
        this.password = password;
        this.firstName = firstName;
        this.lastName = lastName;
        this.recruitmentDate = recruitmentDate;
        this.endWorking = endWorking;
        this.phoneNumber = phoneNumber;
        this.positionId = positionId;
        this.workFieldId = workFieldId;

    }

    public String fullName(){
        return firstName + " " + lastName;
    }

    public void insert(DataBase database) throws NotFoundDBException, DuplicatedRecordDBException, ResultSetDBException {

        String query;
        ArrayList<String> parameters = new ArrayList();
        ResultSet rs;
        boolean exist;

        //Check unicita
        query="SELECT email FROM user WHERE name=?";

        parameters.add(email);

        rs=database.select(query,parameters);

        try {
            exist=rs.next(); //Perchè ResultSet restituisce il puntatore all'elemento prima della 1^riga
            rs.close();
        }
        catch (SQLException e) {
            throw new ResultSetDBException("User.insert(): Errore sul ResultSet.");
        }

        if (exist) {
            //Eccezione buona, che mi serve per passare verso l'alto un messaggio, al Bean che ha chiamato questa inserti, per dirgli che non la posso fare
            //sarà poi il Bean che decide come gestire questa situazione.
            throw new DuplicatedRecordDBException("User.insert(): Tentativo di inserimento di un email gia esistente."); //passo l'eccezione verso l'alto al bean che mi ha chiamato l'insert
        }

        query = "INSERT INTO user(user_id,email,password,first_name,last_name,recruitment_date,end_working,phone_number,position_id,work_field_id)" +
                "VALUES("+userId+",?,?,?,?,"+recruitmentDate+","+endWorking+",?,"+positionId+","+workFieldId+")";


        parameters.add(password);
        parameters.add(firstName);
        parameters.add(lastName);
        parameters.add(phoneNumber);


        database.modify(query, parameters);

    }

}