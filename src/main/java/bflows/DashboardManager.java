package bflows;

import blogics.*;
import global.Status;
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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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

    private Conversation[] conversations;
    private Company[] userCompanies;
    private Company[] companies;
    private Appointment[] userAppointments;
    private AppointmentUser[] appointmentUsers;
    private Appointment userAppointment;
    private CommercialProposal[] userCommercialProposals;
    private CommercialProposal userCommercialProposal;
    private User[] users;
    private User user;

    private ConversationNote[] userNotes;
    private ConversationNote userNote;

    private ContactPerson[] contactPeople;
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
            conversations = ConversationDAO.getAllConversations(database);
            contactPeople = ContactPersonDAO.getAllContactPeople(database);
            userAppointments = AppointmentDAO.getIncomingUserAppointments(database, userId);
            userCommercialProposals = CommercialProposalDAO.getProposalsByUserId(database, userId);
            userNotes = ConversationNoteDAO.getNoteByUser(database, userId);
            appointmentUsers = AppointmentDAO.getAppointmentUsers(database);
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

    public void deleteAppointment(int appointmentId) {

        DataBase database = null;

        try {
            database = DBService.getDataBase();
            AppointmentDAO.deleteAppointmentForUser(database, appointmentId, userId);

            user = UserDAO.getUser(database, userId);
            users = UserDAO.getAllUsers(database);
            userCompanies = CompanyDAO.getCompaniesByUser(database, userId);
            companies = CompanyDAO.getAllCompanies(database);
            conversations = ConversationDAO.getAllConversations(database);
            contactPeople = ContactPersonDAO.getAllContactPeople(database);
            userAppointments = AppointmentDAO.getIncomingUserAppointments(database, userId);
            appointmentUsers = AppointmentDAO.getAppointmentUsers(database);
            userCommercialProposals = CommercialProposalDAO.getProposalsByUserId(database, userId);
            userNotes = ConversationNoteDAO.getNoteByUser(database, userId);
            otherUsersNotes = ConversationNoteDAO.getNotesByOtherUsers(database, userId);

            if (getPartecipatingUsers(appointmentId).size() == 0) {
                Appointment.deleteAppointment(database, appointmentId);
            }

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

    public ContactPerson getContactPersonByCompanyId(Integer companyId) {
        ContactPerson contact = null;
        for (int k = 0; k < (contactPeople.length); k++) {
            if (contactPeople[k].companyId == companyId) {
                contact = contactPeople[k];
            }
        }
        return contact;
    }

    public Company getCompanyById(Integer companyId) {
        Company company=null;
        for (int k = 0; k < (companies.length); k++) {
            if (companies[k].companyId == companyId) {
                company = companies[k];
            }
        }
        return company;
    }

    public Company getCompanyByConversationId(Integer conversationId) {
        Company company = null;
        for (int k = 0; k < (conversations.length); k++) {
            if (conversations[k].conversationId == conversationId) {
                company = getCompanyById(conversations[k].companyId);
            }
        }
        return company;
    }

    public User getUserByNote(Integer userId) {
            User user = null;
            for (int k = 0; k < (users.length); k++) {
                if (users[k].userId== userId) {
                    user = users[k];
                }
            }
            return user;
        }

    public boolean appointmentToday(Date passedDate) {
        LocalDate date = new java.sql.Date(passedDate.getTime()).toLocalDate();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        LocalDate localDate = LocalDate.now();
        if (date.equals(localDate)) {
            return true;
        }
        return false;
    }


    public int getCommercialProposalsStatus(Status proposalStatus){
        int c=0;
        int nCommercialProposals = getUserCommercialProposals().map(t -> t.length).orElse(0);
        for(int k=0; k < nCommercialProposals; k++){
            if (getUserCommercialProposal(k).status== proposalStatus) {
                c++;
            }
        }
        return c;
    }

    public List<User> getPartecipatingUsers(Integer appointmentId) {
        List<User> users = new ArrayList<User>();

        for (int k = 0; k < (appointmentUsers.length); k++) {
            if (appointmentUsers[k].appointmentId == appointmentId) {
                users.add(getUserById(appointmentUsers[k].userId));
            }
        }
        return users;
    }

    public User getUserById(Integer userId) {
        User user = null;
        for (int k = 0; k < (users.length); k++) {
            if (users[k].userId == userId) {
                user = users[k];
            }
        }
        return user;
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

    public void setUserCommercialProposals(CommercialProposal[] userCommercialProposals) {
        this.userCommercialProposals = userCommercialProposals;
    }

    public Optional<CommercialProposal[]> getUserCommercialProposals() {
        return Optional.ofNullable(userCommercialProposals);
    }

    public CommercialProposal getUserCommercialProposal(int index) {
        return userCommercialProposals[index];
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
        return user;
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

    public ContactPerson[] getContactPeople() {
        return contactPeople;
    }

    public ContactPerson getContactPerson(int index) {
        return contactPeople[index];
    }

    public void setContactPeople(ContactPerson[] contactPeople) {
        this.contactPeople = contactPeople;
    }
}
