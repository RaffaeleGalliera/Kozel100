package bflows;

import blogics.*;
import services.databaseservice.exception.*;
import services.databaseservice.*;
import services.errorservice.*;
import util.Debug;
import util.Security;

import javax.swing.text.html.Option;
import java.util.Date;
import java.util.Optional;
//import services.sessionservice.Session;

public class AdminPanelManager implements java.io.Serializable {
    private Position[] positions;
    private Tag[] tags;
    private WorkField[] workFields;
    private ClientType[] clientTypes;
    private ProductCategory[] productCategories;
    private User[] users;
    private AuditLog[] auditLogs;
    private Company[] companies;

    private int positionId;
    private String positionName;

    private int consultingServiceId;
    private String consultingServiceName;

    private int productCategoryId;
    private String productCategoryName;

    private int workFieldId;
    private String workFieldName;

    private int clientTypeId;
    private String clientTypeName;

    private int tagId;
    private String tagName;

    private int userId;
    private String email;
    private Boolean isAdmin;
    private String password;
    private String firstName;
    private String lastName;
    private String recruitmentDate;
    private Date endWorking;
    private String phoneNumber;

    private String serviceName;

    private ConsultingService[] consultingServices;

    private int result;
    private String errorMessage;



    public AdminPanelManager() {

    }

    public void adminView() {

        DataBase db = null;

        try {

            db = DBService.getDataBase();

            positions = PositionDAO.getAllPositions(db);
            workFields = WorkFieldDAO.getAllWorkFields(db);
            tags = TagDAO.getAllTags(db);
            clientTypes = ClientTypeDAO.getAllClientTypes(db);
            productCategories = ProductCategoryDAO.getAllProductCategories(db);
            users = UserDAO.getAllUsers(db);
            consultingServices = ConsultingServiceDAO.getConsultingServices(db);

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
    public void getPositionWorkFieldList() {

            DataBase db = null;

            try {

                db = DBService.getDataBase();

                positions = PositionDAO.getAllPositions(db);
                workFields = WorkFieldDAO.getAllWorkFields(db);
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

            positions = PositionDAO.getAllPositions(database);
            workFields = WorkFieldDAO.getAllWorkFields(database);


            User user = new User(userId, email, isAdmin, Security.encrypt(password),firstName,lastName,recruitmentDate,endWorking,phoneNumber,positionId,workFieldId);
            user.insert(database);
            database.commit();

        }

        catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch(DuplicatedRecordDBException ex){
            EService.logAndRecover(ex);
            setResult(EService.RECOVERABLE_ERROR);
            setErrorMessage("Email already taken by another User");
        }
        catch(Exception ex){
            Debug.println(ex);
        }
        finally {
            try { database.close(); }
            catch (NotFoundDBException e) { EService.logAndRecover(e); }
        }

    }

    public void insertConsultingService(){


        DataBase database = null;

        try {

            database = DBService.getDataBase();
            ConsultingService consultingService = new ConsultingService(consultingServiceName);
            consultingService.insert(database);



            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch(DuplicatedRecordDBException ex){
            EService.logAndRecover(ex);
            setResult((EService.RECOVERABLE_ERROR));
        }
        finally {
            try {
                database.close();
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

        }
        catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch(DuplicatedRecordDBException ex){
            EService.logAndRecover(ex);
            setResult(EService.RECOVERABLE_ERROR);
            setErrorMessage("Position already exist");
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

        }
        catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch(DuplicatedRecordDBException ex){
            EService.logAndRecover(ex);
            setResult(EService.RECOVERABLE_ERROR);
            setErrorMessage("Work Field already exist");
        }finally {
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

        }
        catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch(DuplicatedRecordDBException ex){
            EService.logAndRecover(ex);
            setResult(EService.RECOVERABLE_ERROR);
            setErrorMessage("Product Category already exist");
        }finally {
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

        }catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch(DuplicatedRecordDBException ex){
            EService.logAndRecover(ex);
            setResult(EService.RECOVERABLE_ERROR);
            setErrorMessage("Client Type already exist");
        } finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }


    }

    public void insertTag() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();

            Tag tag = new Tag(tagName);
            tag.insert(database);
            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch(DuplicatedRecordDBException ex){
            EService.logAndRecover(ex);
            setResult(EService.RECOVERABLE_ERROR);
            setErrorMessage("Tag already exist");
        } finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }


    }

    public void logView() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();
            auditLogs = AuditLogDAO.getAllAuditLogs(database);
            companies = CompanyDAO.getAllCompanies(database);
            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }


    }

    public Company getCompanyByName(String companyName) {
        Company company=null;
        for (int k = 0; k < (companies.length); k++) {
            if (companies[k].name.equals(companyName)) {
                company = companies[k];
            }
        }
        return company;
    }
    public String getServiceName(){return serviceName;}

    public void setServiceName(String serviceName){this.serviceName = serviceName;}

    public Integer getPositionId() {
        return positionId;
    }

    public void setPositionId(Integer positionId) {
        this.positionId = positionId;
    }

    public Integer getProductCategoryId() {
        return productCategoryId;
    }

    public void setProductCategoryId(Integer productCategoryId) {
        this.productCategoryId = productCategoryId;
    }

    public Integer getConsultingServiceId() {
        return consultingServiceId;
    }

    public void setConsultingServiceId(Integer consultingServiceId) {
        this.consultingServiceId = consultingServiceId;
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

    public void setTagId(Integer tagId) {
        this.tagId = tagId;
    }

    public Integer getTagId() {
        return tagId;
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

    public void setTagName(String tagName) {
        this.tagName = tagName;
    }

    public String getTagName() {
        return tagName;
    }

    public void setConsultingServiceName(String consultingServiceName) {
        this.consultingServiceName= consultingServiceName;
    }

    public String getConsultingServiceName() {
        return consultingServiceName;
    }

    public void setProductCategoryName(String productCategoryName) {
        this.productCategoryName= productCategoryName;
    }

    public String getProductCategoryName() {
        return productCategoryName;
    }

    public Optional<Position[]> getPositions() {
        return Optional.ofNullable(positions);
    }

    public Position getPosition(int index) {
        return positions[index];
    }


    public ConsultingService getConsultingService(int index) {
        return consultingServices[index];
    }

    public Optional<ConsultingService[]> getConsultingServices(){return Optional.ofNullable(consultingServices);}

    public Optional<WorkField[]> getWorkFields() {
        return Optional.ofNullable(workFields);
    }

    public WorkField getWorkField(int index) {
        return workFields[index];
    }


    public Optional<Tag[]> getTags() {
        return Optional.ofNullable(tags);
    }

    public Tag getTag(int index) {
        return tags[index];
    }

    public Optional<ClientType[]> getClientTypes() {
        return Optional.ofNullable(clientTypes);
    }

    public ClientType getClientType(int index) {
        return clientTypes[index];
    }

    public Optional<ProductCategory[]> getProductCategories() {
        return Optional.ofNullable(productCategories);
    }

    public ProductCategory getProductCategory(int index) {
        return productCategories[index];
    }

    public User[] getUsers() {
        return users;
    }

    public User getUser(int index) {
        return users[index];
    }

    public AuditLog[] getAuditLogs() {
        return auditLogs;
    }

    public AuditLog getAuditLog(int index) {
        return auditLogs[index];
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Boolean getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(Boolean isAdmin) {
        this.isAdmin= isAdmin;
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

    public int getResult() {
        return result;
    }

    public void setResult(int result) {
        this.result = result;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

}



