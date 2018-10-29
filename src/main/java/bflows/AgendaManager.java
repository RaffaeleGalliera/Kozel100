package bflows;

import blogics.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;
import services.errorservice.*;

import java.util.*;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class AgendaManager {
    private String appointmentDate;
    private String appointmentTime;
    private String appointmentNote;
    private Integer appointmentUserId;
    private Integer[] userIds;
    private Integer userId;
    private Integer appointmentId = -1;
    private Integer companyId = -1;

    private Company[] companies;
    private Appointment[] userAppointments;
    private Appointment userAppointment;
    private User[] users;

    private int result;
    private String errorMessage;

    public void agendaView() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();

            users = UserDAO.getAllUsers(database);
            companies = CompanyDAO.getAllCompanies(database);
            userAppointments = AppointmentDAO.getUserAppointments(database, userId);


            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }
    }

    public void addAppointment() {

        DataBase database = null;

        try {
            database = DBService.getDataBase();
            this.appointmentId = AppointmentDAO.getNewID(database);

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = dateFormat.parse(appointmentDate);
            SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm");
            Date dateTime = timeFormat.parse(appointmentTime);
            Time time = new Time(dateTime.getTime());
            Appointment appointment = new Appointment(appointmentId, companyId, appointmentNote, date, time);
            appointment.insert(database);

            AppointmentUser appointmentUser = new AppointmentUser(appointmentUserId, appointmentId);
            appointmentUser.insert(database);

            for (int k = 0; k < userIds.length; k++) {
                AppointmentUser otherUser = new AppointmentUser(userIds[k], appointmentId);
                otherUser.insert(database);
            }


            users = UserDAO.getAllUsers(database);
            companies = CompanyDAO.getAllCompanies(database);
            userAppointments = AppointmentDAO.getUserAppointments(database, userId);


            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ParseException ex) {
//            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (DuplicatedRecordDBException ex) {
            EService.logAndRecover(ex);
            setResult((EService.RECOVERABLE_ERROR));
            setErrorMessage("Email already taken by another Contact");
        } finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }

    }

    public String getAppointmentCompany(Integer companyId) {
        String company = "";
        for (int k = 0; k < (companies.length); k++) {
            if (companies[k].companyId == companyId) {
                company = companies[k].name;
            }
        }
        return company;
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getErrorMessage() {

        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Appointment[] getUserAppointments() {
        return userAppointments;
    }

    public void setUserAppointments(Appointment[] userAppointments) {
        this.userAppointments = userAppointments;
    }

    public Appointment getUserAppointment(int index) {
        return userAppointments[index];
    }

    public User[] getUsers() {
        return users;
    }

    public void setUsers(User[] users) {
        this.users = users;
    }

    public User getUser(int index) {
        return users[index];
    }

    public Company getCompany(int index) {
        return companies[index];
    }

    public Company[] getCompanies() {
        return companies;
    }

    public void setCompanies(Company[] companies) {
        this.companies = companies;
    }

    public String getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(String appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public String getAppointmentNote() {
        return appointmentNote;
    }

    public void setAppointmentNote(String appointmentNote) {
        this.appointmentNote = appointmentNote;
    }

    public Integer getAppointmentUserId() {
        return appointmentUserId;
    }

    public void setAppointmentUserId(Integer appointmentUserId) {
        this.appointmentUserId = appointmentUserId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Appointment getUserAppointment() {
        return userAppointment;
    }

    public void setUserAppointment(Appointment userAppointment) {
        this.userAppointment = userAppointment;
    }

    public Integer[] getUserIds() {
        return userIds;
    }

    public void setUserIds(Integer[] userIds) {
        this.userIds = userIds;
    }
}
