package blogics;

import java.sql.*;

import services.databaseservice.*;
import services.databaseservice.exception.*;
import util.Debug;

import java.util.*;

public class AppointmentDAO {

    public AppointmentDAO() {

    }


    public static Integer getNewID(DataBase db) throws NotFoundDBException, ResultSetDBException {

        String sql;
        ResultSet rs;
        Integer appointmentId;

        sql = "SELECT MAX(appointment_id) AS N FROM appointment FOR UPDATE";


        try {
            rs = db.select(sql);

            if (rs.next()) //Se ho letto qualcosa
                appointmentId = rs.getInt("N") + 1;
            else //la tabella è vuota
                appointmentId = 1;

            rs.close();

            return appointmentId;
        } catch (SQLException e) {
            throw new ResultSetDBException("AppointmentDAO.getNewID(): Errore sul ResultSet --> impossibile calcolare AppointmentId.");
        }

    }

    public static Appointment[] getCompanyAppointments(DataBase db, int companyId) throws NotFoundDBException, ResultSetDBException {

        Appointment[] appointments = null;
        String sql;
        ResultSet rs;
        int i = 0;

        sql = "SELECT * FROM appointment WHERE company_id=" + companyId + "";


        rs = db.select(sql);

        try {
            if (rs.next()) {
                rs.last();
                appointments = new Appointment[rs.getRow()];
                rs.beforeFirst();

                while (rs.next()) {
                    appointments[i] = new Appointment(rs);
                    i++;
                }
            }
            rs.close();
        } catch (SQLException ex) {
            throw new ResultSetDBException("AppointmentDAO.getAppointment(): Errore nel ResultSet: " + ex.getMessage(), db);
        }

        return appointments;

    }


}
