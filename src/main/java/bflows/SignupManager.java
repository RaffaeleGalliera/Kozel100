package bflows;

import blogics.User;
import services.databaseservice.DBService;
import services.databaseservice.DataBase;
import services.databaseservice.exception.DuplicatedRecordDBException;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;
import services.errorservice.EService;
import services.logservice.LService;
import util.Debug;
import util.Security;

import javax.ejb.Local;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class SignupManager implements java.io.Serializable {

    private int userId;
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private String recruitmentDate;
    private Date endWorking;
    private String phoneNumber;
    private int positionId;
    private int workFieldId;
    private int result;

    public void insertUser(){

        DataBase database=null;

        try{

            database= DBService.getDataBase();

            User user = new User(userId,email,Security.encrypt(password),firstName,lastName,recruitmentDate,endWorking,phoneNumber,positionId,workFieldId);
            user.insert(database);
            database.commit();

        }

        catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
        }
        catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
        }
        catch(DuplicatedRecordDBException ex){
            EService.logAndRecover(ex);
        }
        catch(Exception ex){
            Debug.println(ex);
        }
        finally {
            try { database.close(); }
            catch (NotFoundDBException e) { EService.logAndRecover(e); }
        }

    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {

        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getRecruitmentDate() {
        return recruitmentDate;
    }

    public void setRecruitmentDate(String recruitmentDate) {

        Debug.println("porcoddue");

        this.recruitmentDate=recruitmentDate;

//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//        try {
//            this.recruitmentDate = formatter.parse(recruitmentDate);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }

    }

    public Date getEndWorking() {
        return endWorking;
    }

    public void setEndWorking(Date endWorking) {

        this.endWorking = endWorking;

    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public int getPositionId() {
        return positionId;
    }

    public void setPositionId(int positionId) {
        this.positionId = positionId;
    }

    public int getWorkFieldId() {
        return workFieldId;
    }

    public void setWorkFieldId(int workFieldId) {
        this.workFieldId = workFieldId;
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

}
