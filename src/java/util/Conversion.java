/*
 * Conversion.java
 *
 */

package util;

//import global.*;
import java.util.*;
//import java.text.*;
//import java.io.*;
//import java.sql.*;
//import oracle.xml.parser.v2.*;
//import org.w3c.dom.*;
//import org.w3c.dom.Node;
//import javax.servlet.http.*;
//import java.net.URL;

public class Conversion {

    /** From ' to '' for Oracle queries
     * @param inputString The String to convert
     * @return The converted String
     */
    public static String getDatabaseString(String inputString) {

        if (inputString == null)
            return "-";

        /* inputString = inputString.replace('"', '\''); */

        StringBuffer temp = new StringBuffer();
        int indexFrom = 0;
        int indexTo = 0;
        indexTo = inputString.indexOf("'", indexFrom);
        while (indexTo >= 0) {
            temp.append(inputString.substring(indexFrom, indexTo));
            temp.append("`");
            indexFrom = indexTo;
            indexTo = inputString.indexOf("'", ++indexFrom);
        }
        temp = temp.append(inputString.substring(indexFrom, inputString.length()));

        for (int i=temp.length()-1; i>=0; i--) {
            if (temp.charAt(i) == '"') temp.deleteCharAt(i);
        }


        return temp.toString();

    }



    /** Constructs a Vector of String objects from a string tokenized by the separator
     * @param toTokenize The String to tokenize
     * @param separator The separator String
     * @return A Vector of String objects
     */
    public static ArrayList<String> tokenizeString(String toTokenize,String separator) {

        StringTokenizer tokenizer;
        ArrayList<String> result=new ArrayList<String>();

        if (toTokenize!=null) {
            tokenizer=new StringTokenizer(toTokenize,separator);
            while (tokenizer.hasMoreTokens())
                result.add((String)tokenizer.nextToken());
        }

        return result;

    }

    /** Replace all the substrings in a String with other substrings
     * @param sTxt The String to scan
     * @param sOldTag The substring to substitute
     * @param sNewTag The new String
     * @return The modified String
     */
    public static String replaceAll (String sTxt, String sOldTag, String sNewTag) {

        String newText = "";
        int pos=0;
        int lastpos=0;
        while ( (pos=sTxt.indexOf(sOldTag,lastpos))!=-1) {
            newText += sTxt.substring(lastpos,pos)+sNewTag;
            lastpos = pos+sOldTag.length();
        }
        newText += sTxt.substring(lastpos,sTxt.length());
        return newText.toString();

    }

    public static String getDatabaseDate(int anno, int mese, int giorno){

        String data=anno+"-";

        if(mese<10){
            data=data+"0"+mese+"-";
        }
        else{
            data=data+mese+"-";
        }

        if(giorno<10){
            data=data+"0"+giorno;
        }
        else{
            data=data+giorno;
        }

        return data;
    }
}

