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

    String token = JWTService.createJWT(Integer.toString(user.userId),"Kozel100",user.firstName+" "+user.lastName,user.email,user.isAdmin,-1);
    cookies[0]=new Cookie("jwt_auth_token",token);
    cookies[0].setPath("/"); //Così i cookie valgono per tutto il sito e non solo per le pagine sotto alla cartella in cui la jsp che li ha creati risiede

    return cookies;
  }


  public static Integer getUserID(Cookie cookie) {

      if(JWTService.verifyAndParseJWT(cookie.getValue())!=null) {
          return Integer.parseInt(JWTService.verifyAndParseJWT(cookie.getValue()).getId());
      }

      return null;
  }

  public static Boolean isAdmin(Cookie cookie) {

      if(JWTService.verifyAndParseJWT(cookie.getValue())!=null) {
          return Boolean.parseBoolean(JWTService.verifyAndParseJWT(cookie.getValue()).get("isAdmin").toString());
      }

      return null;

  }

  public static boolean isAuthorized(Cookie cookie){

      if (JWTService.verifyAndParseJWT(cookie.getValue())!=null){

          return true;

      } else {

          return false;

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