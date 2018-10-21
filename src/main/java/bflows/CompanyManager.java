package bflows;

import blogics.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;
import services.errorservice.*;

import java.util.Map;

public class CompanyManager implements java.io.Serializable {

    private int contactPersonId;
    private Integer companyId;
    private int clientTypeId;
    private int userId;
    private int productCategoryId;
    private String firstName;
    private String lastName;
    private String phoneNumber;

    private String name;
    private String vat;
    private String address;
    private String city;
    private String companyEmail;
    private String contactEmail;

    private Company[] companies;
    private Company company;
    private ClientType[] clientTypes;
    private ClientType clientType;
    private ProductCategory[] productCategories;
    private ProductCategory[] companyProducts;
    private ContactPerson[] contactPeople;
    private User[] users;

    private int result;
    private String errorMessage;

    public void insertCompany() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();

            clientTypes = ClientTypeDAO.getAllClientTypes(database);


            //Insert Company
            this.companyId = CompanyDAO.getNewID(database);

            Company company = new Company(companyId, clientTypeId, name, vat, address, city, companyEmail);

            company.insert(database);
            //Insert Contact_Person
            ContactPerson contactPerson = new ContactPerson(companyId, firstName, lastName, phoneNumber, contactEmail);
            contactPerson.insert(database);

            //Insert product categories
            CompanyProduct companyProduct= new CompanyProduct(companyId, productCategoryId);
            companyProduct.insert(database);

            //GetAllInfos
            companies = CompanyDAO.getAllCompanies(database);
            clientTypes = ClientTypeDAO.getAllClientTypes(database);
            productCategories = ProductCategoryDAO.getAllProductCategories(database);
            users = UserDAO.getAllUsers(database);


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
            setErrorMessage("Company already exist");
        }
        finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }
    }

    public void updateCompany() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();

            clientTypes = ClientTypeDAO.getAllClientTypes(database);


            company = CompanyDAO.getCompany(database, companyId);

            company.name=name;
            company.address=address;
            company.email=companyEmail;
            company.city=city;
            company.vat=vat;
            company.clientTypeId=clientTypeId;

            clientTypes = ClientTypeDAO.getAllClientTypes(database);
            productCategories = ProductCategoryDAO.getAllProductCategories(database);

            company = CompanyDAO.getCompany(database, companyId);
            clientType = ClientTypeDAO.getClientType(database, company.clientTypeId);
            contactPeople = ContactPersonDAO.getContactPeople(database, companyId);
            companyProducts = ProductCategoryDAO.getProductCategories(database, companyId);

            company.update(database);
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
            setErrorMessage("Company already exist");
        }
        finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }
    }

    public void companyView() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();
            //Get all infos
            clientTypes = ClientTypeDAO.getAllClientTypes(database);
            productCategories = ProductCategoryDAO.getAllProductCategories(database);

            company = CompanyDAO.getCompany(database, companyId);
            clientType = ClientTypeDAO.getClientType(database, company.clientTypeId);
            contactPeople = ContactPersonDAO.getContactPeople(database, companyId);
            companyProducts = ProductCategoryDAO.getProductCategories(database, companyId);

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
        finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }
    }

    public void addProductCategory(){
        DataBase database = null;


        try {

            database = DBService.getDataBase();
            CompanyProduct CompanyProduct= new CompanyProduct(companyId, productCategoryId);
            CompanyProduct.insert(database);

            //Get all infos
            clientTypes = ClientTypeDAO.getAllClientTypes(database);
            productCategories = ProductCategoryDAO.getAllProductCategories(database);

            company = CompanyDAO.getCompany(database, companyId);
            clientType = ClientTypeDAO.getClientType(database, company.clientTypeId);
            contactPeople = ContactPersonDAO.getContactPeople(database, companyId);
            companyProducts = ProductCategoryDAO.getProductCategories(database, companyId);



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
//            setErrorMessage("Email already taken by another Contact");
        }
        finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }
    }

    public void companiesView() {

        DataBase db = null;

        try {
           db = DBService.getDataBase();

           companies = CompanyDAO.getAllCompanies(db);
           clientTypes = ClientTypeDAO.getAllClientTypes(db);
           productCategories = ProductCategoryDAO.getAllProductCategories(db);
           users = UserDAO.getAllUsers(db);
           contactPeople = ContactPersonDAO.getAllContactPeople(db);


//           totalRecords=OrdineDAO.getRicevutiTotalRecords();

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
    public void clientTypeList(){

        DataBase db=null;

        try{
            db=DBService.getDataBase();
            clientTypes=ClientTypeDAO.getAllClientTypes(db);
//            totalRecords=OrdineDAO.getRicevutiTotalRecords();

            db.commit();
        }
        catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        finally {
            try { db.close(); }
            catch (NotFoundDBException e) { EService.logAndRecover(e); }
        }

    }

    public void filterCompanies(Map<String,Integer> filters){

        DataBase db=null;

        try{
            db=DBService.getDataBase();

            companies=CompanyDAO.getFilteredCompanies(db,filters);
            clientTypes = ClientTypeDAO.getAllClientTypes(db);
            productCategories = ProductCategoryDAO.getAllProductCategories(db);
            users = UserDAO.getAllUsers(db);



            db.commit();
        }
        catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
//            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
//            setResult(EService.UNRECOVERABLE_ERROR);
        }
        finally {
            try { db.close(); }
            catch (NotFoundDBException e) { EService.logAndRecover(e); }
        }

    }

    public void insertContactPerson() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();
            ContactPerson contactPerson = new ContactPerson(companyId, firstName, lastName, phoneNumber, contactEmail);
            contactPerson.insert(database);
            companies = CompanyDAO.getAllCompanies(database);


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
            setErrorMessage("Email already taken by another Contact");
        }
        finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }

    }

    public void deleteCompany(int companyId){

        DataBase db=null;

        try{

            db=DBService.getDataBase();
            CompanyDAO.deleteCompany(db, companyId);

            //GetAll infos
            companies = CompanyDAO.getAllCompanies(db);
            clientTypes = ClientTypeDAO.getAllClientTypes(db);
            productCategories = ProductCategoryDAO.getAllProductCategories(db);
            users = UserDAO.getAllUsers(db);
            contactPeople = ContactPersonDAO.getAllContactPeople(db);





            db.commit();
        }
        catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
        finally {
            try { db.close(); }
            catch (NotFoundDBException e) { EService.logAndRecover(e); }
        }

    }

    public void deleteProductCategory(Integer productCategoryId){

        DataBase database=null;

        try{

            database=DBService.getDataBase();
            CompanyDAO.deleteProductCategory(database, companyId, productCategoryId);

            //Get all infos
            clientTypes = ClientTypeDAO.getAllClientTypes(database);
            productCategories = ProductCategoryDAO.getAllProductCategories(database);

            company = CompanyDAO.getCompany(database, companyId);
            clientType = ClientTypeDAO.getClientType(database, company.clientTypeId);
            contactPeople = ContactPersonDAO.getContactPeople(database, companyId);
            companyProducts = ProductCategoryDAO.getProductCategories(database, companyId);




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
        finally {
            try { database.close(); }
            catch (NotFoundDBException e) { EService.logAndRecover(e); }
        }

    }



    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Integer getClientTypeId() {
        return clientTypeId;
    }

    public void setClientTypeId(Integer clientTypeId) {
        this.clientTypeId= clientTypeId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company= company;
    }

    public ClientType getClientType() {
        return clientType;
    }

    public void setClientType(ClientType clientType) {
        this.clientType = clientType;
    }

    public String getVat() {
        return vat;
    }

    public void setVat(String vat) {
        this.vat = vat;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCompanyEmail() {
        return companyEmail;
    }

    public void setCompanyEmail(String companyEmail) {
        this.companyEmail = companyEmail;
    }

    public String getcontactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public Integer getContactPersonId() {
        return contactPersonId;
    }

    public void setContactPersonId(Integer contactPersonId) {
        this.contactPersonId = contactPersonId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setfirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setlastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setphoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public ClientType[] getClientTypes() {
        return clientTypes;
    }

    public ClientType getClientType(int index) {
        return clientTypes[index];
    }


    public Company[] getCompanies() {
        return companies;
    }

    public Company getCompany(int index) {
        return companies[index];
    }


    public User[] getUsers() { return users; }

    public User getUser(int index){ return users[index];}


    public void setUsers(User[] users) { this.users = users; }

    public ContactPerson[] getContactPeople() {
        return contactPeople;
    }

    public void setContactPeople(ContactPerson[] contactPeople) {
        this.contactPeople=contactPeople;
    }

    public ProductCategory[] getProductCategories() {
        return productCategories;
    }

    public void setProductCategories(ProductCategory[] productCategories) {
        this.productCategories = productCategories;
    }

    public ProductCategory[] getCompanyProducts() {
        return companyProducts;
    }

    public ProductCategory getCompanyProduct(int index) {
        return companyProducts[index];
    }

    public void setCompanyProducts(ProductCategory[] companyProducts) {
        this.companyProducts=companyProducts;
    }

    public int getProductCategoryId() {
        return productCategoryId;
    }

    public void setProductCategoryId(int productCategoryId) {
        this.productCategoryId=productCategoryId;
    }

    public ProductCategory getProductCategory(int index){ return productCategories[index];}

    public ContactPerson getContactPerson(int index){ return contactPeople[index];}


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
