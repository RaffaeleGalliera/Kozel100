package bflows;

import blogics.*;
import services.databaseservice.*;
import services.databaseservice.exception.*;
import services.errorservice.*;

public class AdminPanelManager implements java.io.Serializable {
    private int positionId;
    private String positionName;

    private int workFieldId;
    private String workFieldName;

    private int clientTypeId;
    private String clientTypeName;
    

    public void insertPosition(){

        DataBase database=null;

        try{

            database=DBService.getDataBase();

            Position position = new Position(positionName);
            position.insert(database);
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

    public void insertWorkField(){

        DataBase database=null;

        try{

            database=DBService.getDataBase();

            WorkField workfield= new WorkField(workFieldName);
            workfield.insert(database);
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

     public void insertClientType(){

            DataBase database=null;

            try{

                database=DBService.getDataBase();

                ClientType clientType = new ClientType(clientTypeName);
                clientType.insert(database);
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

    public void setClientTypeId(Integer clientTypeId) {
        this.clientTypeId= clientTypeId;
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

    public void setClientTypeName (String clientTypeName) {
        this.clientTypeName= clientTypeName;
    }

    public String getClientTypeName() {
        return clientTypeName;
    }
}
