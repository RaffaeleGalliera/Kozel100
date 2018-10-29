package blogics;

import services.databaseservice.DataBase;
import services.databaseservice.exception.DuplicatedRecordDBException;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ConsultingService {

    public int consulting_service_id;
    public String name;


    public ConsultingService(ResultSet result){

        try {consulting_service_id=result.getInt("consulting_service_id");} catch(SQLException sqle) {}
        try {name=result.getString("name");} catch(SQLException sqle) {}


    }

    public ConsultingService(String name){

        this.name=name;

    }

    public void insert(DataBase database) throws NotFoundDBException, DuplicatedRecordDBException, ResultSetDBException {

        String query;
        ArrayList<String> parameters=new ArrayList();
        ResultSet rs;
        boolean exist;

        //Check unicita solo su proposte non cancellate
        query="SELECT name FROM consulting_service WHERE name=? AND active_fl=1";

        parameters.add(name);

        rs=database.select(query,parameters);

        try {
            exist=rs.next(); //Perchè ResultSet restituisce il puntatore all'elemento prima della 1^riga
            rs.close();
        }
        catch (SQLException e) {
            throw new ResultSetDBException("ConsultingService.insert(): Errore sul ResultSet.");
        }

        if (exist) {
            //Eccezione buona, che mi serve per passare verso l'alto un messaggio, al Bean che ha chiamato questa inserti, per dirgli che non la posso fare
            //sarà poi il Bean che decide come gestire questa situazione.
            throw new DuplicatedRecordDBException("ConsultingService.insert(): Tentativo di inserimento di un nome gia esistente."); //passo l'eccezione verso l'alto al bean che mi ha chiamato l'insert
        }

        query="INSERT INTO consulting_service(consulting_service_id, name)" +
                " VALUES("+consulting_service_id+",?)";

        database.modify(query,parameters);

    }

    public void update(DataBase db) throws NotFoundDBException,ResultSetDBException,DuplicatedRecordDBException{

        String sql;
        ArrayList<String> parameters=new ArrayList();
        ResultSet rs;
        boolean exist;

        /*Controllo che il nome aggiornato che sto per inserire non sia già presente*/
        sql="SELECT consulting_service_id FROM consulting_service WHERE consulting_service_id<>"+consulting_service_id+" AND name=? AND active_fl=1";

        parameters.add(name);

        rs=db.select(sql, parameters);

        try{
            exist=rs.next();
            rs.close();
        }
        catch (SQLException e){
            throw new ResultSetDBException("ConsultingService.update(): Errore sul ResultSet.");
        }

        if (exist){
            throw new DuplicatedRecordDBException("ConsultingService.update(): Tentativo di inserimento di una CommercialProposal già esistente.");
        }

        sql=" UPDATE consulting_service "
                +" SET name=?"
                +" WHERE consulting_service_id="+consulting_service_id;

        parameters.add(name);

        db.modify(sql,parameters);
    }

    public void delete(DataBase db) throws NotFoundDBException,ResultSetDBException {

        String sql;

        sql=" UPDATE consulting_service SET active_fl=0 WHERE consulting_service_id="+consulting_service_id;

        db.modify(sql);
    }


}
