package blogics;

import services.databaseservice.DataBase;
import services.databaseservice.exception.DuplicatedRecordDBException;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProposalService {

    public Integer commercialProposalId;
    public Integer consultingServiceId;

    public ProposalService(Integer commercialProposalId, Integer consultingServiceId){

        this.commercialProposalId=commercialProposalId;
        this.consultingServiceId=consultingServiceId;
    }

    public ProposalService(ResultSet rs){

        try {commercialProposalId=rs.getInt("commercial_proposal_id"); } catch (SQLException sqle) {}
        try {consultingServiceId=rs.getInt("consulting_service_id"); } catch (SQLException sqle) {}
    }

    public void insert(DataBase db) throws NotFoundDBException, ResultSetDBException, DuplicatedRecordDBException {

        String sql;
        ResultSet rs;
        boolean exist;

        /*Check di unicità*/
        sql="SELECT commercial_proposal_id FROM proposal_service WHERE commercial_proposal_id="+commercialProposalId+" AND consulting_service_id="+consultingServiceId;

        rs=db.select(sql);

        try {
            exist=rs.next(); //Perchè ResultSet restituisce il puntatore all'elemento prima della 1^riga
            rs.close();
        }
        catch (SQLException e) {
            throw new ResultSetDBException("tag.insert(): Errore sul ResultSet.");
        }

        if (exist) {
            //Eccezione buona, che mi serve per passare verso l'alto un messaggio, al Bean che ha chiamato questa inserti, per dirgli che non la posso fare
            //sarà poi il Bean che decide come gestire questa situazione.
            throw new DuplicatedRecordDBException("proposalService.insert(): Questa proposta e' gia' associata a questo servizio."); //passo l'eccezione verso l'alto al bean che mi ha chiamato l'insert
        }

        sql="INSERT INTO proposal_service (commercial_proposal_id, consulting_service_id)"
                + "VALUES ("+commercialProposalId+","+consultingServiceId+")";

        db.modify(sql);

    }




}
