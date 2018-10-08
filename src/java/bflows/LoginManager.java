package bflows;

import services.databaseservice.*;
import services.databaseservice.exception.*;
import services.errorservice.*;
import services.sessionservice.*;
import blogics.*;

//import javax.jms.Session;
import javax.servlet.http.*;
import util.Debug;
import util.Security;


public class LoginManager implements java.io.Serializable{

    private String email;
    private String password;
    private int result;
    private String errorMessage;
    private Cookie[] cookies;

    public LoginManager(){

    }

    public void login(){

        DataBase db=null;

        try {

            db=DBService.getDataBase(); //QUESTO VA FATTO SOLO QUA, NON NELLE BLOGICS, ottiene la connessione al DB (Transazione A ON)

            User user=UserDAO.getUser(db, email);

            if ( user==null || !Security.decrypt(user.password).equals(password)){ //Se utente non presente o sbaglia password
                //Se non è neanche un Cliente o sbaglia password
                cookies=null;
                setResult(EService.RECOVERABLE_ERROR);
                setErrorMessage("Mail o password errate");
                }
                else{ //E' un Cliente
                    cookies=Session.createUserCookies(db,user.email);
                }


            db.commit();

        }
        catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch(Exception ex){
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        finally {
            try { db.close(); }
            catch (NotFoundDBException e) { EService.logAndRecover(e); }
        }
    }

    public void logout() {
        cookies= Session.deleteCookie(cookies);
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public Cookie[] getCookies() {
        return cookies;
    }

    public void setCookies(Cookie[] cookies) {
        this.cookies = cookies;
    }

    public Cookie getCookies(int index) {
        return this.cookies[index];
    }

    public void setCookies(int index, Cookie cookies) {
        this.cookies[index] = cookies;
    }

}