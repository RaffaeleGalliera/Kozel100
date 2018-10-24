    
package services.databaseservice;

import java.io.*;
import java.util.*;
import java.sql.*;

import services.databaseservice.exception.*;
import util.Debug;

public class DataBase{ //Contenitore della Connessione + lo Statement derivato dalla connessione, utilizzata dai Bean per comunicare col DB
                        //per rendere più snello il codice lato BFlow. E' un wrapper sui metodi del JDBC, che si mantiene la connessione internamente.
  
 
  //Su questi due faccio tutte le query che voglio, quando faccio commit, chiudo la transazione, faccio un altro Statement e sono pronto
  //con l'oggetto Database per fare altre query dal BFlow.
  private Connection connection;
  private PreparedStatement statement;
 
  
  public DataBase(Connection connection) throws NotFoundDBException {
    
    try{
      this.connection=connection; //Prendo la connessione aperta dal DBService che mi è stata passata e la metto dentro la variabile locale
      
        if (this.connection==null)
          throw new NotFoundDBException("DataBase: DataBase(): Impossibile aprire la Connessione logica");//Lancio verso l'alto, verrà gestita dai Bean
      
            this.connection.setAutoCommit(false); //Fondamentale
            //statement=this.connection.createStatement(); //Statement su cui lanciare poi le query
      
    } 
    catch (Exception ex) { 
      ByteArrayOutputStream stackTrace=new ByteArrayOutputStream();
      ex.printStackTrace(new PrintWriter(stackTrace,true));
      
        throw new NotFoundDBException("DataBase: DataBase(): Impossibile aprire la Connessione col DataBase: \n"+stackTrace);
    }
    
  }
  
  //Ho quindi un oggetto su cui posso eseguire immediatamente una query, e le eseguo così:
  public ResultSet select(String sql) throws NotFoundDBException { //Prende lo Statement e fa executeQuery eseguendo l'SQL che mi viene passato da sopra
    
    ResultSet resultSet;
    
    try {
        //resultSet=statement.executeQuery(sql);
        statement=connection.prepareStatement(sql);
   
           resultSet=statement.executeQuery(); //executeQuery ritorna un ResultSet, usato per SELECT
           
             return resultSet;    
    } 
    catch (SQLException ex) {
      throw new NotFoundDBException("DataBase: select(): Impossibile eseguire la query sul DB. Eccezione: "+ex+ "\n " + "sql" ,this);
    }
  }
  
  public ResultSet select(String sql, ArrayList<String> parameters) throws NotFoundDBException { //Prende lo Statement e fa executeQuery eseguendo l'SQL che mi viene passato da sopra
    
    ResultSet resultSet;
    int k=0;
    
    try {
        //resultSet=statement.executeQuery(sql);
        statement=connection.prepareStatement(sql);
        
          for(k=0;k<parameters.size();k++){
            statement.setString(k+1, parameters.get(k));
          }
 
           resultSet=statement.executeQuery(); //executeQuery ritorna un ResultSet, usato per SELECT
           
             return resultSet;    
    } 
    catch (SQLException ex) {
      throw new NotFoundDBException("DataBase: select(): Impossibile eseguire la query sul DB. Eccezione: "+ex+ "\n " + "sql" ,this);
    }
  }

    public ResultSet select(String sql, java.sql.Date sqlDate) throws NotFoundDBException { //Prende lo Statement e fa executeQuery eseguendo l'SQL che mi viene passato da sopra

        ResultSet resultSet;
        int k = 0;

        try {
            //resultSet=statement.executeQuery(sql);
            statement = connection.prepareStatement(sql);

            statement.setDate(1, sqlDate);

            resultSet = statement.executeQuery(); //executeQuery ritorna un ResultSet, usato per SELECT

            return resultSet;
        } catch (SQLException ex) {
            throw new NotFoundDBException("DataBase: select(): Impossibile eseguire la query sul DB. Eccezione: " + ex + "\n " + "sql", this);
        }
    }


  
  public int modify(String sql) throws NotFoundDBException{
      
    int recordsNumber;
    
    try {
       // recordsNumber=statement.executeUpdate(sql);
         statement=connection.prepareStatement(sql);
           
         recordsNumber=statement.executeUpdate(); //executeUpdate ritorna il numero di record modificati, usato per (INSERT,UPDATE,DELETE)
    } 
    catch (SQLException ex){  
      throw new NotFoundDBException("DataBase: modify(): Impossibile eseguire la update sul DB. Eccezione: "+ex+ "\n " + sql,this);
      
    }
        return recordsNumber;
  }
  
  public int modify(String sql, ArrayList<String> parameters) throws NotFoundDBException{
    
    int recordsNumber,k;
    
    try {
       //recordsNumber=statement.executeUpdate(sql);
         statement=connection.prepareStatement(sql);                  
         
            for(k=0;k<parameters.size();k++){
                statement.setString(k+1, parameters.get(k));
            }
           
                recordsNumber=statement.executeUpdate(); //executeUpdate ritorna il numero di record modificati, usato per (INSERT,UPDATE,DELETE)
    } 
    catch (SQLException ex){  
      throw new NotFoundDBException("DataBase: modify(): Impossibile eseguire la update sul DB. Eccezione: "+ex+ "\n " + sql,this);
      
    }
    
        return recordsNumber;
    
  }

    public int modify(String sql, ArrayList<String> parameters, java.sql.Date sqlDate) throws NotFoundDBException{

        int recordsNumber,k,c;
        c=0;

        try {
            //recordsNumber=statement.executeUpdate(sql);
            statement=connection.prepareStatement(sql);

            for(k=0; k<parameters.size(); k++){
                statement.setString(k+1, parameters.get(k));
                c++;
            }
            statement.setDate(c+1, sqlDate);

            recordsNumber = statement.executeUpdate(); //executeUpdate ritorna il numero di record modificati, usato per (INSERT,UPDATE,DELETE)
        } catch (SQLException ex) {
            throw new NotFoundDBException("DataBase: modify(): Impossibile eseguire la update sul DB. Eccezione: " + ex + "\n " + sql, this);

        }

        return recordsNumber;

    }

    public int modify(String sql, ArrayList<String> parameters, java.sql.Date sqlDate, java.sql.Time sqlTime) throws NotFoundDBException {

        int recordsNumber, k, c;
        c = 0;

        try {
            //recordsNumber=statement.executeUpdate(sql);
            statement = connection.prepareStatement(sql);

            for (k = 0; k < parameters.size(); k++) {
                statement.setString(k + 1, parameters.get(k));
                c++;
            }
            statement.setDate(c + 1, sqlDate);
            statement.setTime(c + 2, sqlTime);

            recordsNumber=statement.executeUpdate(); //executeUpdate ritorna il numero di record modificati, usato per (INSERT,UPDATE,DELETE)
        } catch (SQLException ex){
            throw new NotFoundDBException("DataBase: modify(): Impossibile eseguire la update sul DB. Eccezione: "+ex+ "\n " + sql,this);

        }

        return recordsNumber;

    }
  
  public void commit() throws NotFoundDBException { //Gestisce il ciclo di vita della Connessione stessa
    
    try{
      connection.commit(); //Committa la Transazione
      statement.close(); //Chiude lo Statement
      
    } 
    catch (SQLException ex){
      throw new NotFoundDBException("DataBase: commit(): Impossibile eseguire la commit sul DB. Eccezione: "+ex,this);
    }
    
  }
  
  public void rollBack(){
    
    try{
      connection.rollback();//Rollbacka la Connesione
      statement.close();//Chiude lo Statement
    } 
    catch (SQLException ex){
      new NotFoundDBException("DataBase: rollback(): Impossibile eseguire il RollBack sul DB. Eccezione: "+ex);
    }
  }
  
  public void close() throws NotFoundDBException {
    try{
      connection.close();
    } 
    catch (SQLException ex){
      throw new NotFoundDBException("DataBase: close(): Impossibile chiudere il DB. Eccezione: "+ex);
    }
  }
  
  protected void finalize() throws Throwable {
    this.close();
  }
  
  
}


