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
    public Boolean isAdmin;
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
        }try {
            isAdmin = result.getBoolean("is_admin");
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

    public User(int userId, String email, Boolean isAdmin, String password, String firstName, String lastName, String recruitmentDate, Date endWorking, String phoneNumber, int positionId, int workFieldId) {

        this.userId = userId;
        this.email = email;
        this.isAdmin = isAdmin;
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
        ResultSet result;
        boolean exists;

        //Check unicita

        query = "INSERT INTO user(user_id,email,is_admin,password,first_name,last_name,recruitment_date,end_working,phone_number,position_id,work_field_id)" +
                "VALUES("+userId+",?,"+isAdmin+",?,?,?,"+recruitmentDate+","+endWorking+",?,"+positionId+","+workFieldId+")";


        parameters.add(email);
        parameters.add(password);
        parameters.add(firstName);
        parameters.add(lastName);
        parameters.add(phoneNumber);


        database.modify(query, parameters);

    }

}