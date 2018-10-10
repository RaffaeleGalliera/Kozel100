package bflows;

import blogics.*;
import services.databaseservice.exception.*;
import services.databaseservice.*;
import services.errorservice.*;
import util.Debug;
import util.Security;

import java.time.LocalTime;
import java.util.Date;
import javax.servlet.http.Cookie;
//import services.sessionservice.Session;

public class AdminPanelManager implements java.io.Serializable {
    private Position[] positions;
    private WorkField[] workFields;
    private ClientType[] clientTypes;
    private ProductCategory[] productCategories;
    private User[] users;

    private int positionId;
    private String positionName;

    private int workFieldId;
    private String workFieldName;

    private int clientTypeId;
    private String clientTypeName;

    private int productCategoryId;
    private String productCategoryName;

    private int userId;
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private String recruitmentDate;
    private Date endWorking;
    private String phoneNumber;
    private int result;


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
            users = UserDAO.getAllUsers(db);
            db.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } finally {
            try {
                db.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }

    }

    public void insertUser(){

        DataBase database=null;

        try{

            database= DBService.getDataBase();

            User user = new User(userId,email, Security.encrypt(password),firstName,lastName,recruitmentDate,endWorking,phoneNumber,positionId,workFieldId);
            user.insert(database);
            database.commit();

        }

        catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
        }
        catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
        }
        catch(DuplicatedRecordDBException ex){
            EService.logAndRecover(ex);
        }
        catch(Exception ex){
            Debug.println(ex);
        }
        finally {
            try { database.close(); }
            catch (NotFoundDBException e) { EService.logAndRecover(e); }
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
        this.productCategoryId = productCategoryId;
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

    public User[] getUsers() {
        return users;
    }

    public User getUser(int index) {
        return users[index];
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {

        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getRecruitmentDate() {
        return recruitmentDate;
    }

    public void setRecruitmentDate(String recruitmentDate) {

        this.recruitmentDate=recruitmentDate;

//        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
//        try {
//            this.recruitmentDate = formatter.parse(recruitmentDate);
//        } catch (ParseException e) {
//            e.printStackTrace();
//        }

    }

    public Date getEndWorking() {
        return endWorking;
    }

    public void setEndWorking(Date endWorking) {

        this.endWorking = endWorking;

    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public void setWorkFieldId(int workFieldId) {
        this.workFieldId = workFieldId;
    }

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

}



