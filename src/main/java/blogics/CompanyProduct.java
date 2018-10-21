package blogics;

import java.sql.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;

public class CompanyProduct {

    public Integer companyId;
    public Integer productCategoryId;

    public CompanyProduct(Integer companyId, Integer productCategoryId){

        this.companyId=companyId;
        this.productCategoryId=productCategoryId;
    }

    public CompanyProduct(ResultSet rs){

        try {companyId=rs.getInt("company_id"); } catch (SQLException sqle) {}
        try {productCategoryId=rs.getInt("product_category__id"); } catch (SQLException sqle) {}
    }

    public void insert(DataBase db) throws NotFoundDBException,ResultSetDBException,DuplicatedRecordDBException{

        String sql;
        ResultSet rs;
        boolean exist;

        /*Check di unicità*/
        sql="SELECT company_id FROM company_product WHERE company_id="+companyId+" AND product_category_id="+productCategoryId;

        rs=db.select(sql);

        try {
            exist=rs.next(); //Perchè ResultSet restituisce il puntatore all'elemento prima della 1^riga
            rs.close();
        }
        catch (SQLException e) {
            throw new ResultSetDBException("productCategory.insert(): Errore sul ResultSet.");
        }

        if (exist) {
            //Eccezione buona, che mi serve per passare verso l'alto un messaggio, al Bean che ha chiamato questa inserti, per dirgli che non la posso fare
            //sarà poi il Bean che decide come gestire questa situazione. 
            throw new DuplicatedRecordDBException("productCategory.insert(): Tentativo di inserimento di un productCategory già esistente."); //passo l'eccezione verso l'alto al bean che mi ha chiamato l'insert
        }

        sql="INSERT INTO company_product (company_id, product_category_id)"
                + "VALUES ("+companyId+","+productCategoryId+")";

        db.modify(sql);

    }



}
