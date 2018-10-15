package blogics;

import java.sql.*;
import java.util.*;

import services.databaseservice.*;
import services.databaseservice.exception.*;


public class WorkField {

    public int workFieldId;
    public String name;

    public WorkField(ResultSet result) {

        try {
            workFieldId = result.getInt("work_field_id");
        } catch (SQLException sqle) {
        }
        try {
            name = result.getString("name");
        } catch (SQLException sqle) {
        }
    }

    public WorkField(String name) {
        this.name = name;
    }

    public void insert(DataBase database) throws NotFoundDBException, DuplicatedRecordDBException, ResultSetDBException {

        String query;
        ArrayList<String> parameters = new ArrayList();
        ResultSet rs;
        boolean exist;

        //Check unicita
        query="SELECT name FROM work_field WHERE name=?";

        parameters.add(name);

        rs=database.select(query,parameters);

        try {
            exist=rs.next(); //Perchè ResultSet restituisce il puntatore all'elemento prima della 1^riga
            rs.close();
        }
        catch (SQLException e) {
            throw new ResultSetDBException("WorkField.insert(): Errore sul ResultSet.");
        }

        if (exist) {
            //Eccezione buona, che mi serve per passare verso l'alto un messaggio, al Bean che ha chiamato questa inserti, per dirgli che non la posso fare
            //sarà poi il Bean che decide come gestire questa situazione.
            throw new DuplicatedRecordDBException("WorkField.insert(): Tentativo di inserimento di un nome gia esistente."); //passo l'eccezione verso l'alto al bean che mi ha chiamato l'insert
        }

        query = "INSERT INTO work_field(work_field_id, name)" +
                "VALUES(" + workFieldId + ",?)";

        database.modify(query, parameters);
    }


}
