package blogics;

import services.databaseservice.DataBase;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;

public class AuditLogDAO {
    public AuditLogDAO() {

    }

    public static AuditLog[] getAllAuditLogs(DataBase db) throws NotFoundDBException, ResultSetDBException {

        AuditLog[] auditLogs = null;
        String sql;
        ResultSet rs;
        int i = 0;

        sql = "SELECT * FROM audit_log";


        rs = db.select(sql);

        try {
            if (rs.next()) {
                rs.last();
                auditLogs = new AuditLog[rs.getRow()];
                rs.beforeFirst();

                while (rs.next()) {
                    auditLogs[i] = new AuditLog(rs);
                    i++;
                }
            }
            rs.close();
        } catch (SQLException ex) {
            throw new ResultSetDBException("AuditLogDAO.getAllAuditLog(): Errore nel ResultSet: " + ex.getMessage(), db);
        }

        return auditLogs;

    }
}