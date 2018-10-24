package bflows;

import blogics.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;
import services.errorservice.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CompanyManager implements java.io.Serializable {

    private int contactPersonId=-1;
    private Integer companyId=-1;
    private int clientTypeId=-1;
    private int productCategoryId=-1;
    private int userId=-1;
    private int tagId=-1;
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
    private ProductCategory productCategory;
    private Tag[] tags;
    private Tag[] companyTags;
    private ContactPerson[] contactPeople;
    private User[] users;
    private User user;
    private CommercialProposal[] commercialProposals;
    private ConsultingService[] consultingServices;
    private Map<Integer,ArrayList<ConsultingService>> consultingServicesProposed;

    private int result;
    private String errorMessage;

    public void insertCompany() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();

            //Insert Company
            this.companyId = CompanyDAO.getNewID(database);

            Company company = new Company(companyId, clientTypeId, productCategoryId, userId, name, vat, address, city, companyEmail);

            company.insert(database);
            //Insert Contact_Person
            ContactPerson contactPerson = new ContactPerson(companyId, firstName, lastName, phoneNumber, contactEmail);
            contactPerson.insert(database);

//            //Insert Tag
//            CompanyTag companyTags = new CompanyTag(companyId, tagId);
//            companyTags.insert(database);

            //GetAllInfos
            companies = CompanyDAO.getAllCompanies(database);
            clientTypes = ClientTypeDAO.getAllClientTypes(database);
            productCategories = ProductCategoryDAO.getAllProductCategories(database);
            tags = TagDAO.getAllTags(database);
            users = UserDAO.getAllUsers(database);
            contactPeople = ContactPersonDAO.getAllContactPeople(database);


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

            company = CompanyDAO.getCompany(database, companyId);

            company.name=name;
            company.address=address;
            company.email=companyEmail;
            company.city=city;
            company.vat=vat;
            company.clientTypeId=clientTypeId;
            company.productCategoryId=productCategoryId;
            company.userId=userId;
            company.update(database);

            tags = TagDAO.getAllTags(database);
            clientTypes = ClientTypeDAO.getAllClientTypes(database);
            productCategories = ProductCategoryDAO.getAllProductCategories(database);
            users=UserDAO.getAllUsers(database);
            company = CompanyDAO.getCompany(database, companyId);
            clientType = ClientTypeDAO.getClientType(database, company.clientTypeId);
            productCategory = ProductCategoryDAO.getProductCategory(database, company.productCategoryId);
            contactPeople = ContactPersonDAO.getContactPeople(database, companyId);
            user  = UserDAO.getUser(database, company.userId);
            companyTags = TagDAO.getTags(database, companyId);

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
            tags = TagDAO.getAllTags(database);
            users = UserDAO.getAllUsers(database);

            company = CompanyDAO.getCompany(database, companyId);
            user=UserDAO.getUser(database, company.userId);
            clientType = ClientTypeDAO.getClientType(database, company.clientTypeId);
            productCategory = ProductCategoryDAO.getProductCategory(database, company.productCategoryId);
            contactPeople = ContactPersonDAO.getContactPeople(database, companyId);
            companyTags = TagDAO.getTags(database, companyId);
            consultingServices = ConsultingServiceDAO.getPurchasedConsultingServices(database,companyId);
            commercialProposals = CommercialProposalDAO.getProposalsByCompanyId(database,companyId);

            consultingServicesProposed = new HashMap<Integer,ArrayList<ConsultingService>>();

            for(CommercialProposal proposal : commercialProposals){

                consultingServicesProposed.put(proposal.commercial_proposal_id, new ArrayList<ConsultingService>());

                ConsultingService[] services = ConsultingServiceDAO.getConsultingServicesByProposal(database,proposal.commercial_proposal_id);

                for(ConsultingService s : services){

                    consultingServicesProposed.get(proposal.commercial_proposal_id).add(s);

                }

            }


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

    public void addTag(){
        DataBase database = null;


        try {

            database = DBService.getDataBase();
            CompanyTag companyTags = new CompanyTag(companyId, tagId);
            companyTags.insert(database);

            //Get all infos
            clientTypes = ClientTypeDAO.getAllClientTypes(database);
            productCategories = ProductCategoryDAO.getAllProductCategories(database);
            tags = TagDAO.getAllTags(database);

            company = CompanyDAO.getCompany(database, companyId);
            clientType = ClientTypeDAO.getClientType(database, company.clientTypeId);
            user=UserDAO.getUser(database, company.userId);
            productCategory = ProductCategoryDAO.getProductCategory(database, company.productCategoryId);
            contactPeople = ContactPersonDAO.getContactPeople(database, companyId);
            this.companyTags = TagDAO.getTags(database, companyId);



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
           tags = TagDAO.getAllTags(db);
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
            clientTypes = ClientTypeDAO.getAllClientTypes(db);
            productCategories = ProductCategoryDAO.getAllProductCategories(db);
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
            tags = TagDAO.getAllTags(db);
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
            tags = TagDAO.getAllTags(db);
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

    public void deleteTag(Integer tagId){

        DataBase database=null;

        try{

            database=DBService.getDataBase();
            CompanyDAO.deleteTag(database, companyId, tagId);

            //Get all infos
            clientTypes = ClientTypeDAO.getAllClientTypes(database);
            productCategories = ProductCategoryDAO.getAllProductCategories(database);
            tags = TagDAO.getAllTags(database);

            company = CompanyDAO.getCompany(database, companyId);
            clientType = ClientTypeDAO.getClientType(database, company.clientTypeId);
            productCategory = ProductCategoryDAO.getProductCategory(database, company.productCategoryId);
            user=UserDAO.getUser(database, company.userId);
            contactPeople = ContactPersonDAO.getContactPeople(database, companyId);
            companyTags = TagDAO.getTags(database, companyId);




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

    public ConsultingService[] getConsultingServices() {
        return consultingServices;
    }

    public ConsultingService getConsultingService(int index) {
        return consultingServices[index];
    }

    public void setConsultingServices(ConsultingService[] consultingServices) {
        this.consultingServices = consultingServices;
    }

    public ArrayList<ConsultingService> getConsultingServicesProposedTo(int commercialProposalId){

        int id = new Integer(commercialProposalId);

        ArrayList<ConsultingService> proposedServicesList = new ArrayList<ConsultingService>();
        ConsultingService[] proposedServices;

        return consultingServicesProposed.get(id);
    }

    public CommercialProposal[] getCommercialProposals(){return commercialProposals;}

    public CommercialProposal getCommercialProposal(int index){return commercialProposals[index];}

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getClientTypeId() {
        return clientTypeId;
    }

    public void setClientTypeId(Integer clientTypeId) {
        this.clientTypeId= clientTypeId;
    }

    public Integer getProductCategoryId() {
        return productCategoryId;
    }

    public void setProductCategoryId(Integer productCategoryId) {
        this.productCategoryId= productCategoryId;
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

    public User getUser() {
            return user;
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

    public ProductCategory getProductCategory(int index) {
        return productCategories[index];
    }

    public ProductCategory getProductCategory() {
        return productCategory;
    }

    public void setProductCategory(ProductCategory productCategory) {
        this.productCategory = productCategory;
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

    public ProductCategory[] getProductCategories() {
        return productCategories;
    }

    public void setProductCategories(ProductCategory[] productCategories) {
        this.productCategories = productCategories;
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

    public Tag[] getTags() {
        return tags;
    }

    public void setTags(Tag[] tags) {
        this.tags = tags;
    }

    public Tag[] getCompanyTags() {
        return companyTags;
    }

    public Tag getCompanyTag(int index) {
        return companyTags[index];
    }

    public void setcompanyTags(Tag[] companyTags) {
        this.companyTags=companyTags;
    }

    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId=tagId;
    }

    public Tag getTag(int index){ return tags[index];}

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
