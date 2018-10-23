package blogics;

import services.databaseservice.DataBase;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CommercialProposalDAO {

    public CommercialProposal[] getProposalsByCompanyId(DataBase database, Integer companyId)throws NotFoundDBException, ResultSetDBException {

        CommercialProposal[] proposals=null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT * FROM commercial_proposal AS P " +
                "WHERE P.company_id="+companyId+" AND active_fl=1";

        rs=database.select(sql);

        try{
            if(rs.next()){
                rs.last();
                proposals= new CommercialProposal[rs.getRow()];
                rs.beforeFirst();

                while(rs.next()){
                    proposals[i]=new CommercialProposal(rs);
                    i++;
                }
            }
            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("CommercialProposalDAO.getAllCompanies(): Errore nel ResultSet: "+ex.getMessage(),database);
        }

        return proposals;

    }

}


