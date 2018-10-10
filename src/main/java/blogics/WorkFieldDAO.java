package blogics;

import java.sql.*;

import services.databaseservice.*;
import services.databaseservice.exception.*;

public class WorkFieldDAO {

    public WorkFieldDAO() {

    }

    public static WorkField[] getAllWorkFields(DataBase db) throws NotFoundDBException, ResultSetDBException {

        WorkField[] workFields = null;
        String sql;
        ResultSet rs;
        int i = 0;

        sql = "SELECT * FROM work_field";

        rs = db.select(sql);

        try {
            if (rs.next()) {
                rs.last();
                workFields = new WorkField[rs.getRow()];
                rs.beforeFirst();

                while (rs.next()) {
                    workFields[i] = new WorkField(rs);
                    i++;
                }
            }
            rs.close();
        } catch (SQLException ex) {
            throw new ResultSetDBException("WorkFieldDAO.getAllWorkFields(): Errore nel ResultSet: " + ex.getMessage(), db);
        }

        return workFields;

    }
}