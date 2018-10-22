package blogics;

import services.databaseservice.DataBase;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UserDAO{


    public UserDAO(){}


    public static User[] getAllUsers(DataBase db) throws NotFoundDBException, ResultSetDBException {

        User[] users = null;
        String sql;
        ResultSet rs;
        int i = 0;

        sql = "SELECT * FROM user";

        rs = db.select(sql);

        try {
            if (rs.next()) {
                rs.last();
                users = new User[rs.getRow()];
                rs.beforeFirst();

                while (rs.next()) {
                    users[i] = new User(rs);
                    i++;
                }
            }
            rs.close();
        } catch (SQLException ex) {
            throw new ResultSetDBException("UserDAO.getAllUsers(): Errore nel ResultSet: " + ex.getMessage(), db);
        }

        return users;

    }

    public static User getUser(DataBase db, String email) throws NotFoundDBException, ResultSetDBException {

        User user=null;
        String sql;
        ArrayList<String> parameters = new ArrayList();
        ResultSet rs;

        sql="SELECT * FROM user WHERE email=?";

        parameters.add(email);

        rs=db.select(sql, parameters);

        try{
            if(rs.next()){
                user= new User(rs);
            }

            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("AttivitaDAO.getAttivita(): ResultSetDBException: "+ex.getMessage(), db);
        }

        return user;

    }

    public static User getUser(DataBase db, Integer userId) throws NotFoundDBException, ResultSetDBException {

        User user=null;
        String sql;
        ResultSet rs;

        sql="SELECT * FROM user WHERE user_id="+userId+"";

        rs=db.select(sql);

        try{
            if(rs.next()){
                user= new User(rs);
            }

            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("AttivitaDAO.getAttivita(): ResultSetDBException: "+ex.getMessage(), db);
        }

        return user;

    }



}
