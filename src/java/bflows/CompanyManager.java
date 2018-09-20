package bflows;

import blogics.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;
import services.errorservice.*;

public class CompanyManager implements java.io.Serializable {

    private int companyId;
    private String name;
    private String vat;
    private String address;
    private String city;
    private String email;

    public void insertCompany(){

        DataBase database=null;

        try{

            database=DBService.getDataBase();

            Company company = new Company(name,vat,address,city,email);
            company.insert(database);
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
