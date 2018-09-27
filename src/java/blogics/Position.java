package blogics;

import java.sql.*;
import java.util.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;



public class Position {

    public int positionId;
    public String name;

//    public Position(ResultSet result){
//
//        try {positionId=result.getInt("position_id");} catch(SQLException sqle) {}
//        try {name=result.getString("name");} catch(SQLException sqle) {}
//    }

    public Position(String name){
        this.name=name;
    }

    public void insert(DataBase database) throws NotFoundDBException,DuplicatedRecordDBException,ResultSetDBException {

        String query;
        ArrayList<String> parameters=new ArrayList();
        ResultSet result;
        boolean exists;

        //Check unicita

        query="INSERT INTO position(position_id, name)" +
                "VALUES("+positionId+",?)";

        parameters.add(name);

        database.modify(query,parameters);
    }





}
