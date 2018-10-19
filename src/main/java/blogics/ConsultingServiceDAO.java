package blogics;

import services.databaseservice.DataBase;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ConsultingServiceDAO {
    public ConsultingServiceDAO(){

    }

    public static ConsultingService[] getAllConsultingServices(DataBase db) throws NotFoundDBException, ResultSetDBException {

        ConsultingService[] consultingServices=null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT * FROM consulting_service WHERE active_fl=1";


        rs=db.select(sql);

        try{
            if(rs.next()){
                rs.last();
                consultingServices= new ConsultingService[rs.getRow()];
                rs.beforeFirst();

                while(rs.next()){
                    consultingServices[i]=new ConsultingService(rs);
                    i++;
                }
            }
            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("ConsultingServiceDAO.getConsultingService(): Errore nel ResultSet: "+ex.getMessage(),db);
        }

        return consultingServices;

    }
}
