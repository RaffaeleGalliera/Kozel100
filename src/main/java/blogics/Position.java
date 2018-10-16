package blogics;

import java.sql.*;
import java.util.*;

import services.databaseservice.*;
import services.databaseservice.exception.*;


public class Position {

    public int positionId;
    public String name;

    public Position(ResultSet result) {

        try {
            positionId = result.getInt("position_id");
        } catch (SQLException sqle) {
        }
        try {
            name = result.getString("name");
        } catch (SQLException sqle) {
        }
    }

    public Position(String name) {
        this.name = name;
    }

    public void insert(DataBase database) throws NotFoundDBException, DuplicatedRecordDBException, ResultSetDBException {

        String query;
        ArrayList<String> parameters = new ArrayList();
        ResultSet rs;
        boolean exist;

        //Check unicita
        query="SELECT name FROM work_position WHERE name=?";

        parameters.add(name);

        rs=database.select(query,parameters);

        try {
            exist=rs.next(); //Perchè ResultSet restituisce il puntatore all'elemento prima della 1^riga
            rs.close();
        }
        catch (SQLException e) {
            throw new ResultSetDBException("Position.insert(): Errore sul ResultSet.");
        }

        if (exist) {
            //Eccezione buona, che mi serve per passare verso l'alto un messaggio, al Bean che ha chiamato questa inserti, per dirgli che non la posso fare
            //sarà poi il Bean che decide come gestire questa situazione.
            throw new DuplicatedRecordDBException("Position.insert(): Tentativo di inserimento di un nome gia esistente."); //passo l'eccezione verso l'alto al bean che mi ha chiamato l'insert
        }

        query = "INSERT INTO work_position(position_id, name)" +
                "VALUES(" + positionId + ",?)";

        database.modify(query, parameters);
    }


}
