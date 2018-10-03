///*
// * Session.java
// *
// */
//
//package services.sessionservice;
//
//import blogics.*;
//import java.net.URLDecoder;
//import java.net.URLEncoder;
//import java.util.*;
import javax.servlet.http.*;
//import services.databaseservice.*;
//import services.databaseservice.exception.*;
//
//
//public class Session {
//
//  public Session(){
//  }
//
//  public static Cookie[] createAttivitaCookies(DataBase db, String mail) throws NotFoundDBException,ResultSetDBException {
//
//    Cookie[] cookies=new Cookie[2]; //Crea un array di 2 cookie
//
//    Attivita attivita=AttivitaDAO.getAttivita(db, mail);
//
//    cookies[0]=new Cookie("IDAttivita",attivita.idAttivita.toString());
//    try{cookies[1]=new Cookie("Nome",URLEncoder.encode(attivita.nome,"utf-8"));} catch(Exception ex){};
//
//      for (Cookie cookie : cookies) {
//          cookie.setPath("/"); //Così i cookie valgono per tutto il sito e non solo per le pagine sotto alla cartella in cui la jsp che li ha creati risiede
//      }
//
//    return cookies;
//  }
//
//  public static Cookie[] createClienteCookies(DataBase db, String mail) throws NotFoundDBException,ResultSetDBException {
//
//    Cookie[] cookies=new Cookie[5]; //Crea un array di 4 cookies
//
//    Cliente cliente=ClienteDAO.getCliente(db, mail);
//
//    cookies[0]=new Cookie("IDCliente",cliente.idCliente.toString());
//    try{cookies[1]=new Cookie("Nome",URLEncoder.encode(cliente.nome+"#"+cliente.cognome,"utf-8"));} catch(Exception ex){};
//    cookies[2]=new Cookie("Provincia",cliente.provincia);
//    cookies[3]=new Cookie("BasketItems","0");
//    cookies[4]=new Cookie("BasketQta","0");
//
//      for (Cookie cookie : cookies) {
//          cookie.setPath("/"); //Così i cookie valgono per tutto il sito e non solo per le pagine sotto alla cartella in cui la jsp che li ha creati risiede
//      }
//
//    return cookies;
//  }
//
//  public static void addProduct(Cookie[] cookies, Integer id, Integer qta){
//
//      ArrayList<String> basketItems=getValues(cookies,"BasketItems");
//      ArrayList<String> basketQta=getValues(cookies,"BasketQta");
//      boolean found=false;
//      int tot=0;
//      int i=0;
//
//
//        while(!cookies[i].getName().equals("BasketItems")){
//            i++;
//        }
//
//        if(cookies[i].getValue().equals("0")){
//            cookies[i].setValue(id.toString());
//            cookies[i+1].setValue(qta.toString());
//        }
//        else{
//
//            for(int k=0;k<basketItems.size() && !found;k++){ //Ciclo sugli elementi del carrello
//
//                if( id==Integer.parseInt(basketItems.get(k)) ){ //Se sto per aggiungere uno stesso prodotto al carrello
//
//                    tot=qta+Integer.parseInt(basketQta.get(k)); //Calcolo la nuova qta
//                    basketQta.set(k,String.valueOf(tot)); //La setto nell'ArrayList;
//
//                    cookies[i].setValue(listToCookieValue(basketItems)); //Aggiorno i cookie
//                    cookies[i+1].setValue(listToCookieValue(basketQta)); //Aggiorno i cookie
//                    found=true; //Esco
//                }
//            }
//
//            if(!found){
//                cookies[i].setValue(cookies[i].getValue()+"#"+id);
//                cookies[i+1].setValue(cookies[i+1].getValue()+"#"+qta);
//            }
//        }
//
//        for(int k=0;k<cookies.length;k++){
//            cookies[k].setPath("/");
//        }
//  }
//
//  public static void modifyBasketQta(Cookie[] cookies, Integer qta, Integer idProdotto){
//
//      ArrayList<String> basketQta=getValues(cookies,"BasketQta");
//      ArrayList<String> basketItems=getValues(cookies,"BasketItems");
//
//      int i=0;
//      int index=0;
//
//        while(!cookies[i].getName().equals("BasketQta")){
//            i++;
//        }
//
//        while( !basketItems.get(index).equals(String.valueOf(idProdotto)) ){
//            index++;
//        }
//
//        basketQta.set(index,String.valueOf(qta));
//
//        cookies[i].setValue(listToCookieValue(basketQta));
//
//      for (Cookie cookie : cookies) {
//          cookie.setPath("/");
//      }
//
//  }
//
//  public static void deleteBasketOrderProducts(Cookie[] cookies, Integer[] idProdotto){
//
//      ArrayList<String> basketQta=getValues(cookies,"BasketQta");
//      ArrayList<String> basketItems=getValues(cookies,"BasketItems");
//
//      int i=0,k,j;
//
//        for(k=0;k<basketItems.size();k++){ //Ciclo su tutti i prodotti presenti nei cookies
//            for(j=0;j<idProdotto.length;j++){ //Ciclo su tutti i prodotti dell'ordine
//
//                if(basketItems.get(k).equals(idProdotto[j].toString())){ //Ogni volta che trovo delle congruenze elimino dai cookies
//                    basketItems.remove(k);
//                    basketQta.remove(k);
//                }
//            }
//        }
//
//
//        while(!cookies[i].getName().equals("BasketItems")){
//            i++;
//        }
//            if(basketItems.isEmpty()){
//                cookies[i].setValue("0");
//            }
//            else{
//                cookies[i].setValue(listToCookieValue(basketItems));
//            }
//
//        i=0;
//
//        while(!cookies[i].getName().equals("BasketQta")){
//            i++;
//        }
//            if(basketItems.isEmpty()){
//                cookies[i].setValue("0");
//            }
//            else{
//                cookies[i].setValue(listToCookieValue(basketQta));
//            }
//
//
//      for (Cookie cookie : cookies) {
//          cookie.setPath("/");
//      }
//
//  }
//
//  public static void deleteBasketSingleProduct(Cookie[] cookies, Integer idProdotto){
//
//      ArrayList<String> basketQta=getValues(cookies,"BasketQta");
//      ArrayList<String> basketItems=getValues(cookies,"BasketItems");
//
//      int i=0;
//
//        while(!basketItems.get(i).equals(idProdotto.toString())){
//            i++;
//        }
//
//        basketItems.remove(i);
//        basketQta.remove(i);
//
//        i=0;
//
//        while(!cookies[i].getName().equals("BasketItems")){
//            i++;
//        }
//            if(basketItems.isEmpty()){
//                cookies[i].setValue("0");
//            }
//            else{
//                cookies[i].setValue(listToCookieValue(basketItems));
//            }
//
//        i=0;
//
//        while(!cookies[i].getName().equals("BasketQta")){
//            i++;
//        }
//            if(basketItems.isEmpty()){
//                cookies[i].setValue("0");
//            }
//            else{
//                cookies[i].setValue(listToCookieValue(basketQta));
//            }
//
//
//      for (Cookie cookie : cookies) {
//          cookie.setPath("/");
//      }
//
//  }
//
//  public static String listToCookieValue(ArrayList<String> valueList){
//
//      //Metodo usato solo per modificare i prodotti nel carrello
//
//      String value="";
//
//      for(int i=0;i<valueList.size();i++){
//          value=value+valueList.get(i)+"#";
//      }
//
//      return value;
//  }
//
//  public static String getValue(Cookie[] cookies, String name, int position) {
//
//    int i;
//    boolean found=false;
//    String value=null;
//    ArrayList<String> oV=null;
//
//    for (i=0;i<cookies.length && !found;i++)
//      if (cookies[i].getName().equals(name)) {
//        try{oV = util.Conversion.tokenizeString(URLDecoder.decode(cookies[i].getValue(),"utf-8"),"#");} catch(Exception ex){} //Decodifica il cookie con il tokenize
//        //Mi tira fuori gli elementi separati dal separatore "#" e li mette in un Vector
//        value=oV.get(position);
//        found=true;
//      }
//
//    return value;
//
//  }
//
//  public static ArrayList<String> getValues(Cookie[] cookies, String name){
//
//    int i;
//    boolean found=false;
//    ArrayList<String> oV=new ArrayList<String>();
//
//    for (i=0;i<cookies.length && !found;i++){
//
//      if (cookies[i].getName().equals(name)){
//        try{oV = util.Conversion.tokenizeString(URLDecoder.decode(cookies[i].getValue(),"utf-8"),"#");} catch(Exception ex){} //Decodifica il cookie con il tokenize
//        //Mi tira fuori gli elementi separati dal separatore "#" e li mette in un Vector
//        found=true;
//      }
//    }
//    return oV;
//  }
//
//  public static Integer getUserID(Cookie[] cookies) {
//
//       String ID=getValue(cookies, "IDAttivita", 0) ;
//
//       if(ID!=null){
//           return Integer.valueOf(ID);
//       }
//       else{
//           return Integer.valueOf(getValue(cookies, "IDCliente", 0));
//       }
//  }
//
//  public static String getUserFirstname(Cookie[] cookies) {
//    return getValue(cookies, "Nome", 0);
//  }
//
//  public static String getUserSurname(Cookie[] cookies) {
//    return getValue(cookies, "Nome", 1);
//  }
//
//  public static int getBasketValue(Cookie[] cookies){
//
//      int i;
//      int value=0;
//
//      ArrayList<String> basketValue= getValues(cookies,"BasketQta");
//
//      for(i=0;i<basketValue.size();i++){
//          value += Integer.parseInt(basketValue.get(i));
//      }
//
//      return value;
//  }
//
//  public static String getClienteProvincia(Cookie[] cookies){
//    return getValue(cookies, "Provincia", 0);
//  }
//
//  public static void setClienteName(Cookie[] cookies, String nome, String cognome){
//
//      int i=0;
//
//      while(!cookies[i].getName().equals("Nome")){
//            i++;
//      }
//
//      try{ cookies[i].setValue(URLEncoder.encode(nome+"#"+cognome,"utf-8")); } catch(Exception ex){}
//
//      for(int k=0;k<cookies.length;k++){
//            cookies[k].setPath("/");
//      }
//
//  }
//
//  public static void setClienteProvincia(Cookie[] cookies, String provincia){
//
//      int i=0;
//
//      while(!cookies[i].getName().equals("Provincia")){
//            i++;
//      }
//
//      cookies[i].setValue(provincia);
//
//      for(int k=0;k<cookies.length;k++){
//            cookies[k].setPath("/");
//      }
//
//  }
//
//  public static void setAttivitaName(Cookie[] cookies, String nome){
//
//      int i=0;
//
//      while(!cookies[i].getName().equals("Nome")){
//            i++;
//      }
//
//      try{ cookies[i].setValue(URLEncoder.encode(nome,"utf-8")); } catch(Exception ex){}
//
//      for(int k=0;k<cookies.length;k++){
//            cookies[k].setPath("/");
//      }
//  }
//
//  public static Cookie[] deleteCookie(Cookie[] cookies) {
//
//    for (int i=0; i<cookies.length; i++) {
//      cookies[i].setMaxAge(0);
//      cookies[i].setPath("/"); //Lo devo mettere anche quando li distruggo
//    }
//
//    return cookies;
//  }
//
//  public static void showCookies(Cookie[] cookies){
//
//    util.Debug.println("Cookie presenti:" + cookies.length);
//    int i;
//    for (i=0;i< cookies.length;i++)
//      util.Debug.println("Nome:" + cookies[i].getName() + " Valore:" +cookies[i].getValue());
//  }
//
//}