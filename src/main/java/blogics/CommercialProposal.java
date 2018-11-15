package blogics;

import global.Status;
import services.databaseservice.DataBase;
import services.databaseservice.exception.DuplicatedRecordDBException;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
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
    public Timestamp updatedAt;

    public CommercialProposal(ResultSet result){

        try {commercial_proposal_id=result.getInt("commercial_proposal_id");} catch(SQLException sqle) {}
        try {name=result.getString("name");} catch(SQLException sqle) {}
        try {description=result.getString("description");} catch(SQLException sqle) {}
        try {company_id=result.getInt("company_id");} catch(SQLException sqle) {}
        try {user_id=result.getInt("user_id");} catch(SQLException sqle) {}
        try {updatedAt=result.getTimestamp("updated_at");} catch(SQLException sqle) {}

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

        query="INSERT INTO commercial_proposal(commercial_proposal_id, name, description, company_id, user_id)" +
                "VALUES("+commercial_proposal_id+",?,?,"+company_id+","+user_id+")";

        parameters.add(name);
        parameters.add(description);
        //parameters.add(status.name()); // the name() method returns the name of the enum value as a String


        database.modify(query,parameters);

    }

    public void update(DataBase db) throws NotFoundDBException,ResultSetDBException,DuplicatedRecordDBException{

        String sql;
        ArrayList<String> parameters=new ArrayList();
        ResultSet rs;
        boolean exist;


        sql=" UPDATE commercial_proposal "
                + " SET status=?"
                +" WHERE commercial_proposal_id="+commercial_proposal_id;

        parameters.add(status.name()); // the name() method returns the name of the enum value as a String

        db.modify(sql,parameters);
    }

    public void delete(DataBase db) throws NotFoundDBException,ResultSetDBException {

        String sql;

        sql=" UPDATE commercial_proposal SET active_fl=0 WHERE commercial_proposal_id="+commercial_proposal_id;

        db.modify(sql);
    }

}
