/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.util.Base64;

/**
 *
 * @author nico
 */
public class Security {
    
    private static final String ALGORITHM = "AES";
    private static final String KEY = "1Hbfh667adfDEJ78"; //16 Byte
    
    public static String encrypt(String value) throws Exception{
        
        Key key = generateKey();
        
        Cipher cipher = Cipher.getInstance(Security.ALGORITHM); //Ottengo il Chipher AES
        cipher.init(Cipher.ENCRYPT_MODE, key); //Inizializza il Chiper in ecryption mode con la chiave specificata    
        
        byte [] encryptedByteValue = cipher.doFinal(value.getBytes("utf-8")); //Cripta                              
            
        String encryptedValue64= Base64.getEncoder().encodeToString(encryptedByteValue); //Codifico per trasferire la stringa in rete senza che venga corrotta
        
        return encryptedValue64;               
    }
    
    public static String decrypt(String value) throws Exception{
        Key key = generateKey();
        
        Cipher cipher = Cipher.getInstance(Security.ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, key);        
        
        byte [] decryptedValue64 = Base64.getDecoder().decode(value); //Decodifico 
        
        byte [] decryptedByteValue = cipher.doFinal(decryptedValue64); //Decripto
        
        String decryptedValue = new String(decryptedByteValue,"utf-8");
        
        return decryptedValue;
                
    }
    
    private static Key generateKey() throws Exception{
        
        Key key = new SecretKeySpec(Security.KEY.getBytes(),Security.ALGORITHM); //Ottengo la chiave
        
        return key;
    }
}
    
