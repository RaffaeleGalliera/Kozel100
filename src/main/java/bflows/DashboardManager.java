package bflows;

import blogics.*;
import services.databaseservice.DBService;
import services.databaseservice.DataBase;
import services.databaseservice.exception.DuplicatedRecordDBException;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;
import services.errorservice.EService;

import javax.swing.text.html.Option;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Optional;

public class DashboardManager {
    private String appointmentDate;
    private String appointmentTime;
    private String appointmentNote;
    private Integer appointmentUserId;
    private Integer[] userIds;
    private Integer userId;
    private Integer appointmentId = -1;
    private Integer companyId = -1;

    private Company[] userCompanies;
    private Company[] companies;
    private Appointment[] userAppointments;
    private Appointment userAppointment;
    private User[] users;
    private User user;

    private ConversationNote[] userNotes;
    private ConversationNote userNote;

    private ConversationNote[] otherUsersNotes;
    private ConversationNote otherUsersNote;
    private int result;
    private String errorMessage;

    public void dashView() {

        DataBase database = null;

        try {
            database = DBService.getDataBase();

            user = UserDAO.getUser(database, userId);
            users = UserDAO.getAllUsers(database);
            userCompanies = CompanyDAO.getCompaniesByUser(database, userId);
            companies = CompanyDAO.getAllCompanies(database);

            userAppointments = AppointmentDAO.getIncomingUserAppointments(database, userId);
            userNotes = ConversationNoteDAO.getNoteByUser(database, userId);
            otherUsersNotes = ConversationNoteDAO.getNotesByOtherUsers(database, userId);

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

//    public void addAppointment() {
//
//        DataBase database = null;
//
//        try {
//            database = DBService.getDataBase();
//            this.appointmentId = AppointmentDAO.getNewID(database);
//
//            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//            Date date = dateFormat.parse(appointmentDate);
//            SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm");
//            Date dateTime = timeFormat.parse(appointmentTime);
//            Time time = new Time(dateTime.getTime());
//            Appointment appointment = new Appointment(appointmentId, companyId, appointmentNote, date, time);
//            appointment.insert(database);
//
//            AppointmentUser appointmentUser = new AppointmentUser(appointmentUserId, appointmentId);
//            appointmentUser.insert(database);
//
//            for (int k = 0; k < userIds.length; k++) {
//                AppointmentUser otherUser = new AppointmentUser(userIds[k], appointmentId);
//                otherUser.insert(database);
//            }
//
//
//            users = UserDAO.getAllUsers(database);
//            companies = CompanyDAO.getAllCompanies(database);
//            userAppointments = AppointmentDAO.getUserAppointments(database, userId);
//
//
//            database.commit();
//
//        } catch (NotFoundDBException ex) {
//            EService.logAndRecover(ex);
//            setResult(EService.UNRECOVERABLE_ERROR);
//        } catch (ParseException ex) {
////            EService.logAndRecover(ex);
//            setResult(EService.UNRECOVERABLE_ERROR);
//        } catch (ResultSetDBException ex) {
//            EService.logAndRecover(ex);
//            setResult(EService.UNRECOVERABLE_ERROR);
//        } catch (DuplicatedRecordDBException ex) {
//            EService.logAndRecover(ex);
//            setResult((EService.RECOVERABLE_ERROR));
//            setErrorMessage("Email already taken by another Contact");
//        } finally {
//            try {
//                database.close();
//            } catch (NotFoundDBException e) {
//                EService.logAndRecover(e);
//            }
//        }
//
//    }

    public String getAppointmentCompany(Integer companyId) {
        String company = "";
        for (int k = 0; k < (companies.length); k++) {
            if (companies[k].companyId == companyId) {
                company = companies[k].name;
            }
        }
        return company;
    }

    public boolean appointmentToday(Date passedDate){
        LocalDate date = new java.sql.Date(passedDate.getTime()).toLocalDate();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate localDate = LocalDate.now();
        if(date.equals(localDate)){
            return true;
        }
        return false;
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

    public Optional<Appointment[]> getUserAppointments() {
        return Optional.ofNullable(userAppointments);
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

    public User getUser() {
        return user ;
    }

    public Company getUserCompany(int index) {
        return userCompanies[index];
    }

    public Optional<Company[]> getUserCompanies() {
        return Optional.ofNullable(userCompanies);
    }

    public void setuserCompanies(Company[] userCompanies) {
        this.userCompanies = userCompanies;
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

    public Optional<Appointment> getUserAppointment() {
        return Optional.ofNullable(userAppointment);
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

    public Optional<ConversationNote[]> getUserNotes() {
        return Optional.ofNullable(userNotes);
    }

    public ConversationNote getUserNote(int index) {
        return userNotes[index];
    }

    public void setUserNotes(ConversationNote[] userNotes) {
        this.userNotes = userNotes;
    }

    public Optional<ConversationNote[]> getOtherUsersNotes() {
        return Optional.ofNullable(otherUsersNotes);
    }

    public ConversationNote getOtherUsersNote(int index) {
        return otherUsersNotes[index];
    }

    public void setOtherUsersNotes(ConversationNote[] otherUsersNotes) {
        this.otherUsersNotes = otherUsersNotes;
    }
}
