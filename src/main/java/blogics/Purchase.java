package blogics;

import services.databaseservice.DataBase;
import services.databaseservice.exception.DuplicatedRecordDBException;
import services.databaseservice.exception.NotFoundDBException;
import services.databaseservice.exception.ResultSetDBException;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class Purchase {

    public int companyId;
    public int consultingServiceId;
    public Date purchaseDate;
    public Date startDate;

    public Purchase(ResultSet result) {

        try {
            companyId = result.getInt("company_id");
        } catch (SQLException sqle) {
        }
        try {
            consultingServiceId = result.getInt("consulting_service_id");
        } catch (SQLException sqle) {
        }
        try {
            purchaseDate = result.getDate("purchase_date");
        } catch (SQLException sqle) {
        }
        try {
            startDate = result.getDate("start_date");
        } catch (SQLException sqle) {
        }
    }

    public Purchase(Integer companyId, Integer consultingServiceId, Date purchaseDate, Date startDate) {
        this.companyId = companyId;
        this.consultingServiceId = consultingServiceId;
        this.purchaseDate = purchaseDate;
        this.startDate = startDate;
    }


    public void insert(DataBase database) throws NotFoundDBException {

        String query;
        ArrayList<String> parameters = new ArrayList();
        ResultSet rs;

        java.sql.Date sqlPurchaseDate = new java.sql.Date(purchaseDate.getTime());
        java.sql.Date sqlStartDate = new java.sql.Date(startDate.getTime());


        query = "INSERT INTO purchase(company_id, consulting_service_id, purchase_date, start_date)" +
                "VALUES(" + companyId + "," + consultingServiceId + ",?, ?)";


        database.modify(query, sqlPurchaseDate, sqlStartDate);

    }


}
