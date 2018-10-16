/*
 * Session.java
 *
 */

package services.sessionservice;

import blogics.*;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.*;
import javax.servlet.http.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;
import services.tokenservice.JWTService;


public class Session {

  public Session(){
  }

  public static Cookie[] createUserCookies(DataBase db, String mail) throws NotFoundDBException,ResultSetDBException {

    Cookie cookies[]=new Cookie[1];

    User user=UserDAO.getUser(db, mail);

    String token = JWTService.createJWT(Integer.toString(user.userId),"Kozel100",user.firstName+" "+user.lastName,user.email,-1);
    cookies[0]=new Cookie("jwt_auth_token",token);
    cookies[0].setPath("/"); //Così i cookie valgono per tutto il sito e non solo per le pagine sotto alla cartella in cui la jsp che li ha creati risiede


    return cookies;
  }



  public static String getValue(Cookie[] cookies, String name, int position) {

    int i;
    boolean found=false;
    String value=null;
    ArrayList<String> oV=null;

    for (i=0;i<cookies.length && !found;i++)
      if (cookies[i].getName().equals(name)) {
        try{oV = util.Conversion.tokenizeString(URLDecoder.decode(cookies[i].getValue(),"utf-8"),"#");} catch(Exception ex){} //Decodifica il cookie con il tokenize
        //Mi tira fuori gli elementi separati dal separatore "#" e li mette in un Vector
        value=oV.get(position);
        found=true;
      }

    return value;

  }

  public static ArrayList<String> getValues(Cookie[] cookies, String name){

    int i;
    boolean found=false;
    ArrayList<String> oV=new ArrayList<String>();

    for (i=0;i<cookies.length && !found;i++){

      if (cookies[i].getName().equals(name)){
        try{oV = util.Conversion.tokenizeString(URLDecoder.decode(cookies[i].getValue(),"utf-8"),"#");} catch(Exception ex){} //Decodifica il cookie con il tokenize
        //Mi tira fuori gli elementi separati dal separatore "#" e li mette in un Vector
        found=true;
      }
    }
    return oV;
  }

  public static Integer getUserID(Cookie[] cookies) {

       String ID=getValue(cookies, "IDAttivita", 0) ;

       if(ID!=null){
           return Integer.valueOf(ID);
       }
       else{
           return Integer.valueOf(getValue(cookies, "IDCliente", 0));
       }
  }

  public static String getUserFirstname(Cookie[] cookies) {
    return getValue(cookies, "Nome", 0);
  }

  public static String getUserSurname(Cookie[] cookies) {
    return getValue(cookies, "Nome", 1);
  }



  public static void setClienteName(Cookie[] cookies, String nome, String cognome){

      int i=0;

      while(!cookies[i].getName().equals("Nome")){
            i++;
      }

      try{ cookies[i].setValue(URLEncoder.encode(nome+"#"+cognome,"utf-8")); } catch(Exception ex){}

      for(int k=0;k<cookies.length;k++){
            cookies[k].setPath("/");
      }

  }

  public static Cookie[] deleteCookie(Cookie[] cookies) {

    for (int i=0; i<cookies.length; i++) {
      cookies[i].setMaxAge(0);
      cookies[i].setPath("/"); //Lo devo mettere anche quando li distruggo
    }

    return cookies;
  }

  public static void showCookies(Cookie[] cookies){

    util.Debug.println("Cookie presenti:" + cookies.length);
    int i;
    for (i=0;i< cookies.length;i++)
      util.Debug.println("Nome:" + cookies[i].getName() + " Valore:" +cookies[i].getValue());
  }

}