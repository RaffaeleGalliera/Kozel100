package bflows;

import blogics.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;
import services.errorservice.*;

import java.util.HashMap;
import java.util.Map;

public class CompanyManager implements java.io.Serializable {

    private int contactPersonId;
    private int companyId;
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
    private ContactPerson[] contacts;
    private ClientType[] clientTypes;
    private ProductCategory[] productCategories;
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

    public void companiesView() {

        DataBase db = null;

        try {
            db = DBService.getDataBase();

            companies = CompanyDAO.getAllCompanies(db);

//            totalRecords=OrdineDAO.getRicevutiTotalRecords();

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
            companies = CompanyDAO.getAllCompanies(database);

            ContactPerson contactPerson = new ContactPerson(companyId, firstName, lastName, phoneNumber, contactEmail);
            contactPerson.insert(database);
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

    public ProductCategory[] getProductCategories() { return productCategories; }

    public ProductCategory getProductCategory(int index){ return productCategories[index];}

    public void setProductCategories(ProductCategory[] productCategories) { this.productCategories = productCategories; }

    public User[] getUsers() { return users; }

    public User getUser(int index){ return users[index];}


    public void setUsers(User[] users) { this.users = users; }

    public ContactPerson[] getContactPeople(int companyId) {

        DataBase db=null;

        try{
            db=DBService.getDataBase();

            contacts = ContactPersonDAO.getContactPeople(db, companyId);

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
        return contacts;
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
