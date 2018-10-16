package services.tokenservice;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.security.Key;
import io.jsonwebtoken.*;

import java.util.Base64;
import java.util.Date;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.security.Keys;
import util.Debug;

public class JWTService {

    private static final String base64Key = "EdttObe7hTM3rBwd6WVJgrilAw2pSSQI11PsuqGvBKiP5vs4dLsF7q+o/7Uk7eMg1K765LmQMvMBaqRxNO9U+w==";


    //This method is used to create a JWT Token everytime that a user logs in
    public static String createJWT(String id, String issuer, String subject,String email, long ttlMillis) {

        //The JWT signature algorithm we will be using to sign the token
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS512;

        byte[] decodedKey = Base64.getDecoder().decode(base64Key);
        Key apiKey = new SecretKeySpec(decodedKey,signatureAlgorithm.getJcaName());

        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);



        //This code sets JWT Claims and signs the token with the key
        JwtBuilder builder = Jwts.builder().setId(id)
                .setIssuedAt(now)
                .setSubject(subject)
                .setIssuer(issuer)
                .claim("email",email)
                .signWith(apiKey);

        //if it has been specified, let's add the expiration
        if (ttlMillis >= 0) {
            long expMillis = nowMillis + ttlMillis;
            Date exp = new Date(expMillis);
            builder.setExpiration(exp);
        }

        //Builds the JWT and serializes it to a compact, URL-safe string
        return builder.compact();
    }


    //Sample method to validate and read the JWT
    public static boolean parseAndVerifyJWT(String jwt) {

        //TODO Verify the time to live - ttl - of the token -> if expired then the user must login again

        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS512;
        byte[] decodedKey = Base64.getDecoder().decode(base64Key);
        SecretKey apiKey = new SecretKeySpec(decodedKey,signatureAlgorithm.getJcaName());

        //This line will throw an exception if it is not a signed JWS (as expected)
        try {
            Claims claims = Jwts.parser()
                    .setSigningKey(apiKey)
                    .parseClaimsJws(jwt).getBody();

//        Debug.println("ID: " + claims.getId());
//        Debug.println("Subject: " + claims.getSubject());
//        Debug.println("Issuer: " + claims.getIssuer());
//        Debug.println("Expiration: " + claims.getExpiration());

        return true;

        //TODO Find out the type of exception thrown

        }catch (Exception ex){

            Debug.println("Token not verified: " + ex.getMessage());
            return false;

        }
    }

}



//    Codice per generare una chiave e codificarla come strina in Base64

//    Key key = Keys.secretKeyFor(SignatureAlgorithm.HS512);
//    byte[] keyBytes = key.getEncoded();
//    String encodedKey = Base64.getEncoder().encodeToString(keyBytes);

//    Processo inverso

//    byte[] decodedKey = Base64.getDecoder().decode(encodedKey);
//    rebuild key using SecretKeySpec
//    SecretKey originalKey = new SecretKeySpec(decodedKey, 0, decodedKey.length, "AES");