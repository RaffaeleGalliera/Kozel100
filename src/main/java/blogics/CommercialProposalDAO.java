package blogics;

import services.databaseservice.DataBase;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;

public class CommercialProposalDAO {

    public CommercialProposalDAO(){}

    public static CommercialProposal[] getProposalsByCompanyId(DataBase database, Integer companyId)throws NotFoundDBException, ResultSetDBException {

        CommercialProposal[] proposals=null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT * FROM commercial_proposal AS P " +
                "WHERE P.company_id="+companyId;

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

    public static CommercialProposal[] getProposalsByUserId(DataBase database, Integer userId)throws NotFoundDBException, ResultSetDBException {

        CommercialProposal[] proposals=null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT * FROM commercial_proposal " +
                "WHERE user_id="+userId;

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

    public static Integer getNewID(DataBase db) throws NotFoundDBException, ResultSetDBException{

        String sql;
        ResultSet rs;
        Integer companyId;

        sql="SELECT MAX(commercial_proposal_id) AS N FROM commercial_proposal FOR UPDATE";



        try {
            rs=db.select(sql);

            if (rs.next()) //Se ho letto qualcosa
                companyId = rs.getInt("N")+1;
            else //la tabella è vuota
                companyId = 1;

            rs.close();

            return companyId;
        }
        catch (SQLException e) {
            throw new ResultSetDBException("CommercialProposalDAO.getNewID(): Errore sul ResultSet --> impossibile calcolare commercialProposalId.");
        }

    }

}


