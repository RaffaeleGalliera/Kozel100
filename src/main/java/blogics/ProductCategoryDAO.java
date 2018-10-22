package blogics;

import java.sql.*;

import services.databaseservice.*;
import services.databaseservice.exception.*;

public class ProductCategoryDAO {

    public ProductCategoryDAO() {

    }

    public static ProductCategory[] getAllProductCategories(DataBase db) throws NotFoundDBException, ResultSetDBException {

        ProductCategory[] productCategories = null;
        String sql;
        ResultSet rs;
        int i = 0;

        sql = "SELECT * FROM product_category";

        rs = db.select(sql);

        try {
            if (rs.next()) {
                rs.last();
                productCategories = new ProductCategory[rs.getRow()];
                rs.beforeFirst();

                while (rs.next()) {
                    productCategories[i] = new ProductCategory(rs);
                    i++;
                }
            }
            rs.close();
        } catch (SQLException ex) {
            throw new ResultSetDBException("ProductCategoryDAO.getAllProductCategories(): Errore nel ResultSet: " + ex.getMessage(), db);
        }

        return productCategories;

    }

    public static ProductCategory getProductCategory(DataBase db, Integer productCategoryId) throws NotFoundDBException,ResultSetDBException{

        ProductCategory productCategory=null;
        String sql;
        ResultSet rs;

        sql="SELECT * FROM product_category WHERE product_category_id ="+productCategoryId+"";


        rs=db.select(sql);

        try{
            if(rs.next()){
                productCategory= new ProductCategory(rs);
            }
            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("ProductCategoryDAO.getProductCategory(): ResultSetDBException: "+ex.getMessage(), db);
        }

        return productCategory;

    }

}