package blogics;

import java.sql.*;
import java.util.*;

import services.databaseservice.*;
import services.databaseservice.exception.*;


public class ProductCategory {

    public int productCategoryId;
    public String name;

    public ProductCategory(ResultSet result) {

        try {
            productCategoryId = result.getInt("product_category_id");
        } catch (SQLException sqle) {
        }
        try {
            name = result.getString("name");
        } catch (SQLException sqle) {
        }
    }

    public ProductCategory(String name) {
        this.name = name;
    }

    public void insert(DataBase database) throws NotFoundDBException, DuplicatedRecordDBException, ResultSetDBException {

        String query;
        ArrayList<String> parameters = new ArrayList();
        ResultSet result;
        boolean exists;

        //Check unicita

        query = "INSERT INTO product_category(product_category_id, name)" +
                "VALUES(" + productCategoryId + ",?)";

        parameters.add(name);

        database.modify(query, parameters);
    }


}
