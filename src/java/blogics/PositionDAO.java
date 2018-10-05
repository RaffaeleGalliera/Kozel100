package blogics;

import java.sql.*;

import services.databaseservice.*;
import services.databaseservice.exception.*;

public class PositionDAO {

    public PositionDAO() {

    }

    public static Position[] getAllPositions(DataBase db) throws NotFoundDBException, ResultSetDBException {

        Position[] positions = null;
        String sql;
        ResultSet rs;
        int i = 0;

        sql = "SELECT * FROM work_position";

        rs = db.select(sql);

        try {
            if (rs.next()) {
                rs.last();
                positions = new Position[rs.getRow()];
                rs.beforeFirst();

                while (rs.next()) {
                    positions[i] = new Position(rs);
                    i++;
                }
            }
            rs.close();
        } catch (SQLException ex) {
            throw new ResultSetDBException("PositionDAO.getAllPositionss(): Errore nel ResultSet: " + ex.getMessage(), db);
        }

        return positions;

    }
}
