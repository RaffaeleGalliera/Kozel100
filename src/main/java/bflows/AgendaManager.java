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
    private Integer appointmentUserId;
    private Integer[] userIds;
    private Integer userId;
    private Integer appointmentId = -1;

    private Company[] companies;
    private Appointment[] userAppointments;
    private Appointment userAppointment;

    private int result;
    private String errorMessage;

    public void agendaView() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();

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


}
