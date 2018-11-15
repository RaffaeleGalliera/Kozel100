![Alt Text](https://raw.githubusercontent.com/RaffaeleGalliera/Kozel100/master/src/main/webapp/resources/logo.png)
# Kozel100

Kozel100 is a material designed Customer Relationship Management system for Consulting Firms with the purpose to manage company-clients relationships.

Made with love by two students for their WEB Engineering University exam in UNIFE (Ferrara, Italy). 

Link: http://www.unife.it/ing/informazione 

Exam Page: http://www.unife.it/ing/informazione/sistemi-web

1. Users are able to perform CRUD actions on customers (company), with all the details and characteristics, listing customer notes,  consulting services purchased and other details. Each customer is assigned to one application user(employee).

2. View of the customers list, browsing by companies' product category, tags, by customer type (prospect, new customer, client at risk of abandonment, etc..) and by assigned user.

3. Customer Notes Management: every time a customer is contacted it's possible to register / edit / delete one or more notes related to the conversation that occurred and the user who registered it.

4. Commercial Proposals Management: for each client, users are able to insert a new opportunity -commercial proposal- which can be linked to consulting services.

5. Appointment Management: Insert an appointment with a note, a date, every partecipating user and the customer which it refers.

6. Every user has his personal agenda  -made with JavaScript FullCalendar plugin https://fullcalendar.io/ - 

7. Insert tags for each customer, even add them massivly, selecting customers from the customer list. Browse customer lists as point 2.

8. Export customer lists to PDFs (choosing the fields to be exported).

9. Personal interactive Dashboard that collects the most important informations for each user: upcoming appointments, opportunities, assigned companies, last notes saved and last notes saved by others on their customers.

10. Admin Panel for Administrators: including an audit logging feature that collects all the actions carried out on the application. Saving them into the database and even logging file, the records are structured by: type of action, user who made it, action timestamp, IP Address and the objects which is operated on with the correspondent parameters.

## ER Diagram
![Alt Text](https://raw.githubusercontent.com/RaffaeleGalliera/Kozel100/master/databaseDocs/100sER.png)

# Screenshots

## Dashboard
![Alt Text](https://raw.githubusercontent.com/RaffaeleGalliera/Kozel100/master/screenshots/dashboard.png)
_________________________________________________________________________________________________________

![Alt Text](https://raw.githubusercontent.com/RaffaeleGalliera/Kozel100/master/screenshots/dashboard2.png)

## Users Agenda
![Alt Text](https://raw.githubusercontent.com/RaffaeleGalliera/Kozel100/master/screenshots/agenda.png)

_________________________________________________________________________________________________________

![Alt Text](https://raw.githubusercontent.com/RaffaeleGalliera/Kozel100/master/screenshots/agendaList.png)

_________________________________________________________________________________________________________

![Alt Text](https://raw.githubusercontent.com/RaffaeleGalliera/Kozel100/master/screenshots/agendaAppointment.png)

## Companies Manager
![Alt Text](https://raw.githubusercontent.com/RaffaeleGalliera/Kozel100/master/screenshots/CompaniesList.png)

### Select Companies and tag or export them
![Alt Text](https://raw.githubusercontent.com/RaffaeleGalliera/Kozel100/master/screenshots/selectCompanies.png)

### Massive Tag
![Alt Text](https://raw.githubusercontent.com/RaffaeleGalliera/Kozel100/master/screenshots/massiveTag.png)

### Export Companies List as PDF
![Alt Text](https://raw.githubusercontent.com/RaffaeleGalliera/Kozel100/master/screenshots/pdfExample.png)

## Single Company Manager
![Alt Text](https://raw.githubusercontent.com/RaffaeleGalliera/Kozel100/master/screenshots/overview.png)

_________________________________________________________________________________________________________

![Alt Text](https://raw.githubusercontent.com/RaffaeleGalliera/Kozel100/master/screenshots/customerNotes.png)

_________________________________________________________________________________________________________

![Alt Text](https://raw.githubusercontent.com/RaffaeleGalliera/Kozel100/master/screenshots/commercialProposals.png)

# Audit Log 

![Alt Text](https://raw.githubusercontent.com/RaffaeleGalliera/Kozel100/master/screenshots/auditLogging.png)

