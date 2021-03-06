package blogics;

import services.databaseservice.DataBase;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ConsultingServiceDAO {

    public ConsultingServiceDAO(){}

    public static ConsultingService[] getConsultingServices(DataBase database) throws NotFoundDBException,ResultSetDBException{

        ConsultingService[] consultingServices=null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT * FROM consulting_service";

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

    public static Purchase[] getPurchasedConsultingServices(DataBase database, Integer companyId) throws NotFoundDBException, ResultSetDBException {

        Purchase[] purchases = null;
        String sql;
        ResultSet rs;
        int i=0;

        sql = "SELECT * FROM purchase WHERE company_id=" + companyId + "";

        rs=database.select(sql);

        try{
            if(rs.next()){
                rs.last();
                purchases = new Purchase[rs.getRow()];
                rs.beforeFirst();

                while(rs.next()){
                    purchases[i] = new Purchase(rs);
                    i++;
                }
            }
            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("ConsultingServiceDAO.getPurchases(): Errore nel ResultSet: " + ex.getMessage(), database);
        }

        return purchases;

    }

    public static ConsultingService[] getConsultingServicesByProposal(DataBase database, Integer proposalId) throws NotFoundDBException,ResultSetDBException {

        ConsultingService[] consultingServices=null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT CS.* FROM commercial_proposal AS CP " +
                "JOIN proposal_service AS PS " +
                "ON CP.commercial_proposal_id = PS.commercial_proposal_id " +
                "JOIN consulting_service AS CS " +
                "ON CS.consulting_service_id = PS.consulting_service_id " +
                "WHERE PS.commercial_proposal_id="+proposalId;

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
