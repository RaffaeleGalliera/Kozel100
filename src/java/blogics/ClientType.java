package blogics;

import java.sql.*;
import java.util.*;

import services.databaseservice.*;
import services.databaseservice.exception.*;


public class ClientType {

    public int clientTypeId;
    public String name;

    public ClientType(ResultSet result) {

        try {
            clientTypeId = result.getInt("client_type_id");
        } catch (SQLException sqle) {
        }
        try {
            name = result.getString("name");
        } catch (SQLException sqle) {
        }
    }

    public ClientType(String name) {
        this.name = name;
    }

    public void insert(DataBase database) throws NotFoundDBException, DuplicatedRecordDBException, ResultSetDBException {

        String query;
        ArrayList<String> parameters = new ArrayList();
        ResultSet result;
        boolean exists;

        //Check unicita

        query = "INSERT INTO client_type(client_type_id, name)" +
                "VALUES(" + clientTypeId + ",?)";

        parameters.add(name);

        database.modify(query, parameters);
    }


}
