package blogics;

import global.Status;
import services.databaseservice.DataBase;
import services.databaseservice.exception.DuplicatedRecordDBException;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class CommercialProposal {

    public int commercial_proposal_id;
    public String name;
    public String description;
    public Status status;
    public int company_id;
    public int user_id;

    public CommercialProposal(ResultSet result){

        try {commercial_proposal_id=result.getInt("commercial_proposal_id");} catch(SQLException sqle) {}
        try {name=result.getString("name");} catch(SQLException sqle) {}
        try {description=result.getString("description");} catch(SQLException sqle) {}
        try {company_id=result.getInt("company_id");} catch(SQLException sqle) {}
        try {user_id=result.getInt("user_id");} catch(SQLException sqle) {}

        try {

            Map<String, Status> map = new HashMap<String, Status>();

            for (Status status : Status.values()) {
                map.put(status.name(), status);
            }


            status=map.get(result.getString("status"));


        } catch(SQLException sqle) {}


    }

    public CommercialProposal(int commercial_proposal_id, String name, String description, int company_id, int user_id) {

        this.commercial_proposal_id=commercial_proposal_id;
        this.name=name;
        this.description=description;
        this.status=status;
        this.company_id=company_id;
        this.user_id=user_id;

    }

    public void insert(DataBase database) throws NotFoundDBException, DuplicatedRecordDBException, ResultSetDBException {

        String query;
        ArrayList<String> parameters=new ArrayList();
        ResultSet rs;
        boolean exist;

        //Check unicita solo su proposte non cancellate
        query="SELECT name FROM commercial_proposal WHERE name=? AND active_fl=1";

        parameters.add(name);

        rs=database.select(query,parameters);

        try {
            exist=rs.next(); //Perchè ResultSet restituisce il puntatore all'elemento prima della 1^riga
            rs.close();
        }
        catch (SQLException e) {
            throw new ResultSetDBException("CommercialProposal.insert(): Errore sul ResultSet.");
        }

        if (exist) {
            //Eccezione buona, che mi serve per passare verso l'alto un messaggio, al Bean che ha chiamato questa inserti, per dirgli che non la posso fare
            //sarà poi il Bean che decide come gestire questa situazione.
            throw new DuplicatedRecordDBException("CommercialProposal.insert(): Tentativo di inserimento di un nome gia esistente."); //passo l'eccezione verso l'alto al bean che mi ha chiamato l'insert
        }

        query="INSERT INTO commercial_proposal(commercial_proposal_id, name, description, company_id, user_id)" +
                "VALUES("+commercial_proposal_id+",?,?,"+company_id+","+user_id+")";


        parameters.add(description);
        //parameters.add(status.name()); // the name() method returns the name of the enum value as a String


        database.modify(query,parameters);

    }

    public void update(DataBase db) throws NotFoundDBException,ResultSetDBException,DuplicatedRecordDBException{

        String sql;
        ArrayList<String> parameters=new ArrayList();
        ResultSet rs;
        boolean exist;

        /*Controllo che il nome aggiornato che sto per inserire non sia già presente*/
        sql="SELECT commercial_proposal_id FROM commercial_proposal WHERE commercial_proposal_id<>"+commercial_proposal_id+" AND name=? AND active_fl=1";

        parameters.add(name);

        rs=db.select(sql, parameters);

        try{
            exist=rs.next();
            rs.close();
        }
        catch (SQLException e){
            throw new ResultSetDBException("CommercialProposal.update(): Errore sul ResultSet.");
        }

        if (exist){
            throw new DuplicatedRecordDBException("CommercialProposal.update(): Tentativo di inserimento di una CommercialProposal già esistente.");
        }

        sql=" UPDATE commercial_proposal "
                +" SET name=?, description=?, status+?"
                +" WHERE commercial_proposal_id="+commercial_proposal_id;

        parameters.add(name);
        parameters.add(description);
        parameters.add(status.name()); // the name() method returns the name of the enum value as a String

        db.modify(sql,parameters);
    }

    public void delete(DataBase db) throws NotFoundDBException,ResultSetDBException {

        String sql;

        sql=" UPDATE commercial_proposal SET active_fl=0 WHERE commercial_proposal_id="+commercial_proposal_id;

        db.modify(sql);
    }

}
