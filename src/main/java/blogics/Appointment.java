package blogics;

import java.sql.*;
import java.util.*;
import java.util.Date;

import services.databaseservice.*;
import services.databaseservice.exception.*;


public class Appointment {

    public int appointmentId;
    public int companyId;
    public String note;
    public Date date;
    public Time time;

    public Appointment(ResultSet result) {

        try {
            appointmentId = result.getInt("appointment_id");
        } catch (SQLException sqle) {
        }
        try {
            companyId = result.getInt("company_id");
        } catch (SQLException sqle) {
        }
        try {
            note = result.getString("note");
        } catch (SQLException sqle) {
        }
        try {
            date = result.getDate("date");
        } catch (SQLException sqle) {
        }
        try {
            time = result.getTime("time");
        } catch (SQLException sqle) {
        }
    }

    public Appointment(Integer appointmentId, Integer companyId, String note, Date date, Time time) {
        this.appointmentId = appointmentId;
        this.companyId = companyId;
        this.note = note;
        this.date = date;
        this.time = time;
    }

    public void insert(DataBase database) throws NotFoundDBException, DuplicatedRecordDBException, ResultSetDBException {

        String query;
        ArrayList<String> parameters = new ArrayList();
        ResultSet rs;
        boolean exist;

        java.sql.Date sqlDate = new java.sql.Date(date.getTime());

        java.sql.Time sqlTime = new java.sql.Time(time.getTime());

        //Check unicita
        query = "SELECT company_id, date FROM appointment WHERE company_id=" + companyId + " AND date=?";

        rs = database.select(query, sqlDate);

        try {
            exist = rs.next(); //Perchè ResultSet restituisce il puntatore all'elemento prima della 1^riga
            rs.close();
        } catch (SQLException e) {
            throw new ResultSetDBException("Appointment.insert(): Errore sul ResultSet.");
        }

        if (exist) {
            //Eccezione buona, che mi serve per passare verso l'alto un messaggio, al Bean che ha chiamato questa inserti, per dirgli che non la posso fare
            //sarà poi il Bean che decide come gestire questa situazione.
            throw new DuplicatedRecordDBException("Appointment.insert(): Tentativo di inserimento di un un appuntamento gia esistente."); //passo l'eccezione verso l'alto al bean che mi ha chiamato l'insert
        }

        query = "INSERT INTO appointment(appointment_id, company_id, note, date, time)" +
                "VALUES(" + appointmentId + "," + companyId + ",?,?,?)";

        parameters.add(note);

        database.modify(query, parameters, sqlDate, sqlTime);

    }
}
