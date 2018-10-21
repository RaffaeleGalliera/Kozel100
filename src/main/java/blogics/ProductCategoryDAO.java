package blogics;

import services.databaseservice.DataBase;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductCategoryDAO {
    public ProductCategoryDAO(){

    }

    public static ProductCategory[] getAllProductCategories(DataBase db) throws NotFoundDBException, ResultSetDBException {

        ProductCategory[] productCategories =null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT * FROM product_category";


        rs=db.select(sql);

        try{
            if(rs.next()){
                rs.last();
                productCategories = new ProductCategory[rs.getRow()];
                rs.beforeFirst();

                while(rs.next()){
                    productCategories[i]=new ProductCategory(rs);
                    i++;
                }
            }
            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("ProductCategoryDAO.getProductCategories(): Errore nel ResultSet: "+ex.getMessage(),db);
        }

        return productCategories;

    }

    public static ProductCategory[] getProductCategories(DataBase db, Integer companyId) throws NotFoundDBException,ResultSetDBException{

        ProductCategory[] productCategories =null;
        String sql;
        ResultSet rs;
        int i=0;

        sql="SELECT S.product_category_id, S.name "
                + "FROM product_category AS S "
                + "JOIN company_product AS C "
                + "ON S.product_category_id=C.product_category_id "
                + "WHERE company_id="+companyId;

        rs=db.select(sql);

        try{

            if(rs.next()){
                rs.last();
                productCategories = new ProductCategory[rs.getRow()];
                rs.beforeFirst();

                while(rs.next()){
                    productCategories[i]= new ProductCategory(rs);
                    i++;
                }
            }
            rs.close();
        }
        catch(SQLException ex){
            throw new ResultSetDBException("ProductCategoryDAO.getProductCategories(): Errore nel ResultSet: "+ex.getMessage(),db);
        }

        return productCategories;

    }

}
