package bflows;

import blogics.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;
import services.errorservice.*;

public class ContactPersonManager implements java.io.Serializable {
    //TODO: Come fare con chiave esterna
    private int contactPersonId;
    private int companyId;
    private String firstName;
    private String lastName;
    private String email;
    private String phoneNumber;

    public void insertContactPerson() {

        DataBase database = null;

        try {

            database = DBService.getDataBase();


            ContactPerson contactPerson = new ContactPerson(firstName, lastName, phoneNumber, email);
            contactPerson.insert(database);
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

    public Integer getContactPersonId() {
        return contactPersonId;
    }

    public void setContactPersonId(Integer contactPersonId) {
        this.contactPersonId = contactPersonId;
    }

    public Integer getCompanyId() {
        return companyId;
    }

    public void setCompanyId(Integer companyId) {
        this.companyId = companyId;
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
