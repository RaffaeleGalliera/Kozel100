package blogics;

import java.sql.*;

import services.databaseservice.*;
import services.databaseservice.exception.*;

public class AppointmentUser {

    public Integer userId;
    public Integer appointmentId;

    public AppointmentUser(Integer userId, Integer appointmentId) {

        this.userId = userId;
        this.appointmentId = appointmentId;
    }

    public AppointmentUser(ResultSet rs) {

        try {
            userId = rs.getInt("user_id");
        } catch (SQLException sqle) {
        }
        try {
            appointmentId = rs.getInt("appointment_id");
        } catch (SQLException sqle) {
        }
    }

    public void insert(DataBase db) throws NotFoundDBException, ResultSetDBException, DuplicatedRecordDBException {

        String sql;
        ResultSet rs;
        boolean exist;

        /*Check di unicità*/
        sql = "SELECT user_id FROM appointment_user WHERE user_id=" + userId + " AND appointment_id=" + appointmentId;

        rs = db.select(sql);

        try {
            exist = rs.next(); //Perchè ResultSet restituisce il puntatore all'elemento prima della 1^riga
            rs.close();
        } catch (SQLException e) {
            throw new ResultSetDBException("tag.insert(): Errore sul ResultSet.");
        }

        if (exist) {
            //Eccezione buona, che mi serve per passare verso l'alto un messaggio, al Bean che ha chiamato questa inserti, per dirgli che non la posso fare
            //sarà poi il Bean che decide come gestire questa situazione. 
            throw new DuplicatedRecordDBException("tag.insert(): Tentativo di inserimento di un tag già esistente."); //passo l'eccezione verso l'alto al bean che mi ha chiamato l'insert
        }

        sql = "INSERT INTO appointment_user (user_id, appointment_id) "
                + "VALUES (" + userId + "," + appointmentId + ")";

        db.modify(sql);

    }


}
