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
            workFieldId = result.getInt("workField_id");
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
        ResultSet result;
        boolean exists;
        parameters.add(name);
        //Check unicita

        query = "INSERT INTO work_field(work_field_id, name)" +
                "VALUES(" + workFieldId + ",?)";

        database.modify(query, parameters);
    }


}
