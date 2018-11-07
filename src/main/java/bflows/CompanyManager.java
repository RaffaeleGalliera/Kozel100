package bflows;

import blogics.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;
import services.errorservice.*;

import javax.xml.crypto.Data;
import java.util.*;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;

public class CompanyManager implements java.io.Serializable {
  
    private int contactPersonId=-1;
    private Integer companyId=-1;
    private int clientTypeId=-1;
    private int productCategoryId=-1;
    private int userId=-1;
    private int conversationUserId=-1;
    private int conversationNoteUserId=-1;
    private int commercialProposalUserId=-1;
    private int tagId=-1;
    private Integer companyNoteId = -1;
    private int appointmentId = -1;
    private String firstName;
    private String lastName;
    private String phoneNumber;

    private String name;
    private String vat;
    private String address;
    private String city;
    private String country;
    private String state;
    private Integer zip;
    private String companyEmail;
    private String contactEmail;

    private String reason;
    private String conversationDate;

    private String title;
    private String note;
    private Integer conversationId;

    private String appointmentDate;
    private String appointmentTime;
    private String appointmentNote;
    private Integer appointmentUserId;
    private Integer[] userIds;

    private Integer[] selectedCompanies;
    private Company[] companies;
    private ConversationNote companyNote;
    private Conversation[] conversations;
    private User conversationUser;
    private Company company;
    private Conversation conversation;
    private ConversationNote[] companyNotes;
    private ClientType[] clientTypes;
    private ClientType clientType;
    private ProductCategory[] productCategories;
    private ProductCategory productCategory;
    private Tag[] tags;
    private Tag[] companyTags;
    private Integer[] tagIds;
    private ContactPerson[] contactPeople;
    private User[] users;
    private User user;

    private Map<Integer, ArrayList<Tag>> tagsByCompany;

    private CommercialProposal[] commercialProposals;
    private ConsultingService[] consultingServicesPurchased;
    private ConsultingService[] consultingServices;
    private int[] consultingServiceIds;
    private int purchasedServiceId;
    private String purchaseDate;
    private String startDate;

    private String proposalName;
    private String proposalDescription;

    private Map<Integer, ArrayList<ConsultingService>> consultingServicesProposed;
    private Appointment[] companyAppointments;
    private Appointment companyAppointment;


    private int result;
    private String errorMessage;

    public void insertCompany() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();

            //Insert Company
            this.companyId = CompanyDAO.getNewID(database);

            Company company = new Company(companyId, clientTypeId, productCategoryId, userId, name, vat, address, city, country, state, zip, companyEmail);

            company.insert(database);
            //Insert Contact_Person
            ContactPerson contactPerson = new ContactPerson(companyId, firstName, lastName, phoneNumber, contactEmail);
            contactPerson.insert(database);

//            //Insert Tag
//            CompanyTag companyTags = new CompanyTag(companyId, tagId);
//            companyTags.insert(database);

            getAllCompaniesInfo(database);

            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (DuplicatedRecordDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.RECOVERABLE_ERROR);
            setErrorMessage("Company already exist");
        } finally {
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
            company.country = country;
            company.state = state;
            company.vat=vat;
            company.zip = zip;
            company.clientTypeId=clientTypeId;
            company.productCategoryId=productCategoryId;
            company.userId=userId;
            company.update(database);

            getAllCompaniesInfo(database);


            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (DuplicatedRecordDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.RECOVERABLE_ERROR);
            setErrorMessage("Company already exist");
        } finally {
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
            getAllCompanyInfos(database);


            database.commit();

        } catch (NotFoundDBException ex) {
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

    public void addTag() {
        DataBase database = null;


        try {

            database = DBService.getDataBase();

                for (int k = 0; k < tagIds.length; k++) {
                    CompanyTag companyTags = new CompanyTag(companyId, tagIds[k]);
                    companyTags.insert(database);
                }

            getAllCompanyInfos(database);
            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ResultSetDBException ex) {
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

    public void addNTagNCompanies() {
        DataBase db = null;

        try {
            db = DBService.getDataBase();
            for (int c = 0; c < selectedCompanies.length; c++) {
                for (int k = 0; k < tagIds.length; k++) {
                    CompanyTag companyTags = new CompanyTag(selectedCompanies[c], tagIds[k]);
                    companyTags.insert(db);
                }
            }
            getAllCompaniesInfo(db);
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

    public void addConversation() {

        DataBase database = null;

        try {
            database = DBService.getDataBase();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date parsed = format.parse(conversationDate);
            Conversation conversation = new Conversation(companyId, conversationUserId, reason, parsed);
            conversation.insert(database);

            getAllCompanyInfos(database);


            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ParseException ex) {
//            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }

    }

    public void addAppointment() {

        DataBase database = null;

        try {
            database = DBService.getDataBase();
            this.appointmentId = AppointmentDAO.getNewID(database);

            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date date = dateFormat.parse(appointmentDate);
            SimpleDateFormat timeFormat = new SimpleDateFormat("hh:mm");
            Date dateTime = timeFormat.parse(appointmentTime);
            Time time = new Time(dateTime.getTime());
            Appointment appointment = new Appointment(appointmentId, companyId, appointmentNote, date, time);
            appointment.insert(database);

            AppointmentUser appointmentUser = new AppointmentUser(appointmentUserId, appointmentId);
            appointmentUser.insert(database);

            for (int k = 0; k < userIds.length; k++) {
                AppointmentUser otherUser = new AppointmentUser(userIds[k], appointmentId);
                otherUser.insert(database);
            }


            getAllCompanyInfos(database);


            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ParseException ex) {
//            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (DuplicatedRecordDBException ex) {
            EService.logAndRecover(ex);
            setResult((EService.RECOVERABLE_ERROR));
            setErrorMessage("Email already taken by another Contact");
        } finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }

    }

    public void addConversationNote() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();
            ConversationNote conversationNote = new ConversationNote(conversationId, conversationNoteUserId, title, note);
            conversationNote.insert(database);

            getAllCompanyInfos(database);


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

    public void purchaseService() {


        DataBase database = null;

        try {

            database = DBService.getDataBase();
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            Date parsedPurchaseDate = format.parse(purchaseDate);
            Date parseStartDate = format.parse(startDate);

            Purchase purchase = new Purchase(companyId, purchasedServiceId, parsedPurchaseDate, parseStartDate);
            purchase.insert(database);

            //Get all infos
            getAllCompanyInfos(database);


            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);

        } catch (ParseException ex) {
            setResult(EService.UNRECOVERABLE_ERROR);
        } finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }


    }

    public void addCommercialProposal() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();
            int proposalId = CommercialProposalDAO.getNewID(database);
            CommercialProposal commercialProposal = new CommercialProposal(proposalId, proposalName, proposalDescription, companyId, commercialProposalUserId);
            commercialProposal.insert(database);

            if(consultingServices!=null) {
                for (int k = 0; k < consultingServiceIds.length; k++) {
                    ProposalService linkedService = new ProposalService(proposalId, consultingServiceIds[k]);
                    linkedService.insert(database);
                }
            }
            //Get all infos
            getAllCompanyInfos(database);

            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);

        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);

        } catch (DuplicatedRecordDBException ex) {
            EService.logAndRecover(ex);
            setResult((EService.RECOVERABLE_ERROR));
            setErrorMessage("A proposal with the same name already exists");
        } finally {
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

            getAllCompaniesInfo(db);
            db.commit();


        }
        catch (NotFoundDBException ex) {
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

    public void filterCompanies(Map<String, Integer> filters) {

        DataBase db = null;

        try {
            db = DBService.getDataBase();

            companies = CompanyDAO.getFilteredCompanies(db, filters);
            clientTypes = ClientTypeDAO.getAllClientTypes(db);
            productCategories = ProductCategoryDAO.getAllProductCategories(db);
            tags = TagDAO.getAllTags(db);
            users = UserDAO.getAllUsers(db);
            contactPeople = ContactPersonDAO.getAllContactPeople(db);


            db.commit();
        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
//            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
//            setResult(EService.UNRECOVERABLE_ERROR);
        } finally {
            try {
                db.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
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
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (DuplicatedRecordDBException ex) {
            EService.logAndRecover(ex);
            setResult((EService.RECOVERABLE_ERROR));
            setErrorMessage("Email already taken by another Contact");
        } finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }

    }

    public void deleteCompany(int companyId) {

        DataBase db = null;

        try {
            db = DBService.getDataBase();
            CompanyDAO.deleteCompany(db, companyId);

            getAllCompaniesInfo(db);

            db.commit();
        } catch (NotFoundDBException ex) {
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

    public void deleteCompanyNote(int noteId) {

        DataBase db = null;

        try {
            db = DBService.getDataBase();
            ConversationNoteDAO.delete(db, noteId);

            getAllCompanyInfos(db);

            db.commit();
        } catch (NotFoundDBException ex) {
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

    public void updateCompanyNote() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();

            companyNote = ConversationNoteDAO.getNote(database, companyNoteId);

            companyNote.title = title;
            companyNote.note = note;
            companyNote.conversationId = conversationId;
            companyNote.update(database);

            getAllCompanyInfos(database);
            database.commit();

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (DuplicatedRecordDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.RECOVERABLE_ERROR);
            setErrorMessage("Company already exist");
        } finally {
            try {
                database.close();
            } catch (NotFoundDBException e) {
                EService.logAndRecover(e);
            }
        }
    }

    public void deleteTag(Integer tagId) {

        DataBase database = null;

        try {

            database = DBService.getDataBase();
            CompanyDAO.deleteTag(database, companyId, tagId);

            getAllCompanyInfos(database);


            database.commit();
        } catch (NotFoundDBException ex) {
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

    public void getAllCompanyInfos(DataBase database) {
        try {
            clientTypes = ClientTypeDAO.getAllClientTypes(database);
            productCategories = ProductCategoryDAO.getAllProductCategories(database);
            tags = TagDAO.getAllTags(database);
            users = UserDAO.getAllUsers(database);

            company = CompanyDAO.getCompany(database, companyId);
            user = UserDAO.getUser(database, company.userId);
            clientType = ClientTypeDAO.getClientType(database, company.clientTypeId);
            productCategory = ProductCategoryDAO.getProductCategory(database, company.productCategoryId);
            contactPeople = ContactPersonDAO.getContactPeople(database, companyId);
            conversations = ConversationDAO.getConversations(database, companyId);
            companyTags = TagDAO.getTags(database, companyId);

            consultingServices = ConsultingServiceDAO.getConsultingServices(database);
            consultingServicesPurchased = ConsultingServiceDAO.getPurchasedConsultingServices(database, companyId);
            commercialProposals = CommercialProposalDAO.getProposalsByCompanyId(database, companyId);

            consultingServicesProposed = new HashMap<Integer, ArrayList<ConsultingService>>();

            if (commercialProposals != null) {
                for (CommercialProposal proposal : commercialProposals) {

                    consultingServicesProposed.put(proposal.commercial_proposal_id, new ArrayList<ConsultingService>());

                    ConsultingService[] services = ConsultingServiceDAO.getConsultingServicesByProposal(database, proposal.commercial_proposal_id);

                    if (services != null) {
                        for (ConsultingService s : services) {

                            consultingServicesProposed.get(proposal.commercial_proposal_id).add(s);

                        }
                    }

                }
            }

            companyNotes = ConversationNoteDAO.getCompanyNotes(database, companyId);
            companyAppointments = AppointmentDAO.getCompanyAppointments(database, companyId);

        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }

    }

    public void getAllCompaniesInfo(DataBase db){
        try {
            companies = CompanyDAO.getAllCompanies(db);
            clientTypes = ClientTypeDAO.getAllClientTypes(db);
            productCategories = ProductCategoryDAO.getAllProductCategories(db);
            tags = TagDAO.getAllTags(db);
            users = UserDAO.getAllUsers(db);
            contactPeople = ContactPersonDAO.getAllContactPeople(db);

            tagsByCompany = new HashMap<Integer, ArrayList<Tag>>();

            for (Company company : companies) {

                tagsByCompany.put(company.companyId, new ArrayList<Tag>());

                Tag[] tagsOfCompany = TagDAO.getTags(db, company.companyId);

                if (tagsOfCompany != null) {

                    for (Tag tag : tagsOfCompany) {

                        tagsByCompany.get(company.companyId).add(tag);

                    }

                }

            }


            db.commit();
        } catch (NotFoundDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        } catch (ResultSetDBException ex) {
            EService.logAndRecover(ex);
            setResult(EService.UNRECOVERABLE_ERROR);
        }
    }


    public Optional<ConsultingService[]> getConsultingServicesPurchased() {
        return Optional.ofNullable(consultingServicesPurchased);
    }

    public Optional<ConsultingService> getConsultingService(int index) {
        return Optional.ofNullable(consultingServices[index]);
    }

    public ConsultingService getConsultingServicePurchased(int index) {
        return consultingServicesPurchased[index];
    }

    public void setConsultingServicesPurchased(ConsultingService[] consultingServicesPurchased) {
        this.consultingServicesPurchased = consultingServicesPurchased;
    }

    public Optional<ArrayList<ConsultingService>> getConsultingServicesProposedTo(int commercialProposalId) {

        int id = new Integer(commercialProposalId);


        ArrayList<ConsultingService> proposedServicesList = new ArrayList<ConsultingService>();
        ConsultingService[] proposedServices;

        return Optional.ofNullable(consultingServicesProposed.get(id));
    }

    public String getConversationUserName(Integer userId) {
        String user = "";
        for (int k = 0; k < (users.length); k++) {
            if (users[k].userId == userId) {
                user = users[k].fullName();
            }
        }
        return user;
    }


    public int getPurchasedServiceId() {
        return purchasedServiceId;
    }

    public void setPurchasedServiceId(int purchasedServiceId) {
        this.purchasedServiceId = purchasedServiceId;
    }

    public int[] getConsultingServiceIds() {
        return consultingServiceIds;
    }

    public void setConsultingServiceIds(int[] consultingServiceIds) {
        this.consultingServiceIds = consultingServiceIds;
    }

    public Optional<ConsultingService[]> getConsultingServices() {
        return Optional.ofNullable(consultingServices);
    }

    public void setConsultingServices(ConsultingService[] consultingServices) {
        this.consultingServices = consultingServices;
    }

    public String getPurchaseDate() {
        return purchaseDate;
    }

    public void setPurchaseDate(String purchaseDate) {
        this.purchaseDate = purchaseDate;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getProposalName() {
        return proposalName;
    }

    public void setProposalName(String proposalName) {
        this.proposalName = proposalName;
    }

    public String getProposalDescription() {
        return proposalDescription;
    }

    public void setProposalDescription(String proposalDescription) {
        this.proposalDescription = proposalDescription;
    }

    public String getCompanyNoteConversation(Integer conversationId) {
        String conversation = "";
        for (int k = 0; k < (conversations.length); k++) {
            if (conversations[k].conversationId == conversationId) {
                conversation = "Reason: " + conversations[k].reason + "<br>Date: " + conversations[k].date + "<br>Created by: " + getConversationUserName(conversations[k].userId);
            }
        }
        return conversation;
    }


    public Optional<CommercialProposal[]> getCommercialProposals() {
        return Optional.ofNullable(commercialProposals);
    }

    public CommercialProposal getCommercialProposal(int index) {
        return commercialProposals[index];
    }

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

    public Integer getConversationUserId() {
        return conversationUserId;
    }

    public void setConversationUserId(Integer conversationUserId) {
        this.conversationUserId = conversationUserId;
    }

    public Integer getConversationNoteUserId() {
        return conversationNoteUserId;
    }

    public void setConversationNoteUserId(Integer conversationNoteUserId) {
        this.conversationNoteUserId = conversationNoteUserId;
    }

    public int getCommercialProposalUserId() {
        return commercialProposalUserId;
    }

    public void setCommercialProposalUserId(int commercialProposalUserId) {
        this.commercialProposalUserId = commercialProposalUserId;
    }

    public Integer getClientTypeId() {
        return clientTypeId;
    }

    public void setClientTypeId(Integer clientTypeId) {
        this.clientTypeId = clientTypeId;
    }

    public Integer getProductCategoryId() {
        return productCategoryId;
    }

    public void setProductCategoryId(Integer productCategoryId) {
        this.productCategoryId = productCategoryId;
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
        this.company = company;
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

    public Optional<Company[]> getCompanies() {
        return Optional.ofNullable(companies);
    }

    public Company getCompany(int index) {
        return companies[index];
    }


    public User[] getUsers() {
        return users;
    }

    public User getUser(int index) {
        return users[index];
    }


    public void setUsers(User[] users) {
        this.users = users;
    }

    public ContactPerson[] getContactPeople() {
        return contactPeople;
    }

    public void setContactPeople(ContactPerson[] contactPeople) {
        this.contactPeople = contactPeople;
    }

    public Tag[] getTags() {
        return tags;
    }

    public void setTags(Tag[] tags) {
        this.tags = tags;
    }

    public Integer[] getTagIds() {
        return tagIds;
    }

    public void setTagIds(Integer[] tagIds) {
        this.tagIds = tagIds;
    }

    public Integer[] getUserIds() {
        return userIds;
    }

    public void setUserIds(Integer[] userIds) {
        this.userIds = userIds;
    }

    public Optional<Tag[]> getCompanyTags() {
        return Optional.ofNullable(companyTags);
    }

    public Tag getCompanyTag(int index) {
        return companyTags[index];
    }

    public Optional<Conversation[]> getConversations() {
        return Optional.ofNullable(conversations);
    }

    public Conversation getConversation(int index) {
        return conversations[index];
    }

    public Optional<ConversationNote[]> getCompanyNotes() {
        return Optional.ofNullable(companyNotes);
    }

    public ConversationNote getCompanyNote(int index) {
        return companyNotes[index];
    }

    public Optional<Appointment[]> getCompanyAppointments() {
        return Optional.ofNullable(companyAppointments);
    }

    public Appointment getCompanyAppointment(int index) {
        return companyAppointments[index];
    }

    public void setcompanyTags(Tag[] companyTags) {
        this.companyTags = companyTags;
    }

    public int getTagId() {
        return tagId;
    }

    public void setTagId(int tagId) {
        this.tagId = tagId;
    }

    public int getConversationId() {
        return conversationId;
    }

    public void setConversationId(int conversationId) {
        this.conversationId = conversationId;
    }

    public Optional<ArrayList<Tag>> getTagsForCompany(int companyId) {

        return Optional.ofNullable(tagsByCompany.get(companyId));

    }

    public Tag getTag(int index) {
        return tags[index];
    }

    public ContactPerson getContactPerson(int index) {
        return contactPeople[index];
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

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getAppointmentNote() {
        return appointmentNote;
    }

    public void setAppointmentNote(String appointmentNote) {
        this.appointmentNote = appointmentNote;
    }

    public Integer getAppointmentUserId() {
        return appointmentUserId;
    }

    public void setAppointmentUserId(Integer appointmentUserId) {
        this.appointmentUserId = appointmentUserId;
    }

    public String getConversationDate() {
        return conversationDate;
    }

    public void setConversationDate(String conversationDate) {
        this.conversationDate = conversationDate;
    }

    public String getAppointmentDate() {
        return appointmentDate;
    }

    public void setAppointmentDate(String appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public String getAppointmentTime() {
        return appointmentTime;
    }

    public void setAppointmentTime(String appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public Integer getCompanyNoteId() {
        return companyNoteId;
    }

    public Integer[] getselectedCompanies() {
        return selectedCompanies;
    }

    public void setselectedCompanies(Integer[] selectedCompanies) {
        this.selectedCompanies = selectedCompanies;
    }

    public void setCompanyNoteId(Integer companyNoteId) {
        this.companyNoteId = companyNoteId;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public Integer getZip() {
        return zip;
    }

    public void setZip(Integer zip) {
        this.zip = zip;
    }
}
