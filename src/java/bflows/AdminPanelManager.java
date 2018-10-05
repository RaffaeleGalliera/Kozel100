package bflows;

import blogics.*;
import services.databaseservice.exception.*;
import services.databaseservice.*;
import services.errorservice.*;

import java.time.LocalTime;
import javax.servlet.http.Cookie;
//import services.sessionservice.Session;

public class AdminPanelManager implements java.io.Serializable {
    private Position[] positions;
    private WorkField[] workFields;
    private ClientType[] clientTypes;
    private ProductCategory[] productCategories;

    private int positionId;
    private String positionName;

    private int workFieldId;
    private String workFieldName;

    private int clientTypeId;
    private String clientTypeName;

    private int productCategoryId;
    private String productCategoryName;

    public AdminPanelManager() {

    }

    public void adminView() {

        DataBase db = null;

        try {

            db = DBService.getDataBase();

            positions = PositionDAO.getAllPositions(db);
            workFields = WorkFieldDAO.getAllWorkFields(db);
            productCategories = ProductCategoryDAO.getAllProductCategories(db);
            clientTypes = ClientTypeDAO.getAllClientTypes(db);
            //#TODO Una sola commit? O tre diverse?
            db.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            //#TODO SetResult
            //setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            //  setResult(EService.UNRECOVERABLE_ERROR);
        } finally {
            try {
                db.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }

    }

    public void insertPosition() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();

            Position position = new Position(positionName);
            position.insert(database);
            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
        } catch (DuplicatedRecordDBException ex) {
            EService.logAndRecover(ex);
        } finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }


    }

    public void insertWorkField() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();

            WorkField workfield = new WorkField(workFieldName);
            workfield.insert(database);
            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
        } catch (DuplicatedRecordDBException ex) {
            EService.logAndRecover(ex);
        } finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }


    }

    public void insertClientType() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();

            ClientType clientType = new ClientType(clientTypeName);
            clientType.insert(database);
            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
        } catch (DuplicatedRecordDBException ex) {
            EService.logAndRecover(ex);
        } finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }


    }

    public void insertProductCategory() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();

            ProductCategory productCategory = new ProductCategory(productCategoryName);
            productCategory.insert(database);
            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
        } catch (DuplicatedRecordDBException ex) {
            EService.logAndRecover(ex);
        } finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }


    }

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }

    public Integer getWorkFieldId() {
        return workFieldId;
    }

    public void setWorkFieldId(Integer workFieldId) {
        this.workFieldId = workFieldId;
    }

    public Integer getClientTypeId() {
        return clientTypeId;
    }

    public void setProductCategoryId(Integer productCategoryId) {
        this.productCategoryId= productCategoryId;
    }

    public Integer getProductCategoryId() {
        return productCategoryId;
    }

    public void setClientTypeId(Integer clientTypeId) {
        this.clientTypeId = clientTypeId;
    }

    public String getWorkFieldName() {
        return workFieldName;
    }

    public void setWorkFieldName(String workFieldName) {
        this.workFieldName = workFieldName;
    }

    public void setPositionName(String positionName) {
        this.positionName = positionName;
    }

    public String getPositionName() {
        return positionName;
    }

    public void setClientTypeName(String clientTypeName) {
        this.clientTypeName = clientTypeName;
    }

    public String getClientTypeName() {
        return clientTypeName;
    }

    public void setProductCategoryName(String productCategoryName) {
        this.productCategoryName = productCategoryName;
    }

    public String getProductCategoryName() {
        return productCategoryName;
    }

    public Position[] getPositions() {
        return positions;
    }

    public Position getPosition(int index) {
        return positions[index];
    }

    public WorkField[] getWorkFields() {
        return workFields;
    }

    public WorkField getWorkField(int index) {
        return workFields[index];
    }


    public ProductCategory[] getProductCategories() {
        return productCategories;
    }

    public ProductCategory getProductCategory(int index) {
        return productCategories[index];
    }

    public ClientType[] getClientTypes() {
        return clientTypes;
    }

    public ClientType getClientType(int index) {
        return clientTypes[index];
    }

}
