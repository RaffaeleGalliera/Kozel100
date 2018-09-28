package blogics;

import java.sql.*;

import services.databaseservice.*;
import services.databaseservice.exception.*;

public class ClientTypeDAO {

    public ClientTypeDAO() {

    }

    public static ClientType[] getAllClientTypes(DataBase db) throws NotFoundDBException, ResultSetDBException {

        ClientType[] clientTypes = null;
        String sql;
        ResultSet rs;
        int i = 0;

        sql = "SELECT * FROM client_type";

        rs = db.select(sql);

        try {
            if (rs.next()) {
                rs.last();
                clientTypes = new ClientType[rs.getRow()];
                rs.beforeFirst();

                while (rs.next()) {
                    clientTypes[i] = new ClientType(rs);
                    i++;
                }
            }
            rs.close();
        } catch (SQLException ex) {
            throw new ResultSetDBException("ClientTypeDAO.getAllClientTypess(): Errore nel ResultSet: " + ex.getMessage(), db);
        }

        return clientTypes;

    }
}