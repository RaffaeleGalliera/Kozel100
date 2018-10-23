package blogics;

import services.databaseservice.DataBase;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ConsultingServiceDAO {

    public ConsultingServiceDAO(){}

    public static ConsultingService[] getPurchasedConsultingServices(DataBase database, Integer companyId) throws NotFoundDBException,ResultSetDBException {

        ConsultingService[] consultingServices=null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT * FROM consulting_service AS CS " +
                "JOIN purchase AS P " +
                "ON CS.consulting_service_id = P.consulting_service_id " +
                "WHERE P.company_id="+companyId+" AND active_fl=1";

        rs=database.select(sql);

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
            throw new ResultSetDBException("ConsultingServiceDAO.getAllCompanies(): Errore nel ResultSet: "+ex.getMessage(),database);
        }

        return consultingServices;

    }

    public static ConsultingService[] getConsultingServicesByProposal(DataBase database, Integer proposalId) throws NotFoundDBException,ResultSetDBException {

        ConsultingService[] consultingServices=null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT * FROM commercial_proposal AS CP " +
                "JOIN proposal_service AS PS " +
                "ON CP.commercial_proposal_id = PS.commercial_proposal_id " +
                "JOIN consulting_service AS CS " +
                "ON CS.consulting_service_id = PS.consulting_service_id " +
                "WHERE PS.commercial_proposal_id="+proposalId+" AND active_fl=1";

        rs=database.select(sql);

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
            throw new ResultSetDBException("ConsultingServiceDAO.getAllCompanies(): Errore nel ResultSet: "+ex.getMessage(),database);
        }

        return consultingServices;

    }


}
