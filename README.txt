# spring-boot-angularjs-example
Author : Jadumani Meher

This is a Java Maven Project aims to provide AngularJS tutorial with Spring Boot and Hibernate.


Technology Used:
AngularJS, JSP, JQuery, BootStrap
Java 8, Spring Framework, Spring Boot, MicroService,RestService, Hibernate, JPA, JUnit, Maven Build  

Database:
Provided Configuration required for both SqlLocalDB and MySQL Server - (DB Independent Application)

Tools Required: 
Spring Tool Suite 4, Microsoft SqlSever Management Studio/MySQL Workbench,  Soap UI  (Soap UI Optional for Testing)


Steps to Configure and Run Project:
1. Import spring-boot-angularjs-example project as existing maven project to your STS (Spring IDE Tool) workspace
2. Choose the DB which you are going to use  SqlLocalDB or MySQL
3. Change the Database URL and Credentials in application.properties from resources folder as per your DB requirement (comment uncomment other section)
4. Change the Database driver dependency in pom.xml in root folder as per your DB requirement (comment uncomment other section)
5. Wait for all Maven dependencies to download and build the project
6. Connect to  SQL LocalDB or MySQL and Create the DB tables by running the sql scripts provided in /db_script folder as per the DB (separate files provide for SQL LocalDB and MySQL).
7. Run the Java Class com.jmeher.tutorials.example.SpringBootApp.java ( This class responsible for start the Spring Boot Application - Contain Main Method)
8. After console message as "SUCCESSFULLY STARTED: JMEHER TUTORIALS SPRING BOOT"
9. In your Web Browser (Chrome) open the URL :  http://localhost:8081/jmeher/index
10. Click on Add Customer Details to start adding Customer to DB
11. Click on Fetch Customer List to perform other operations on Customer and their addresses
12. Please refer the Screen Shots Provided for each functional screens.
13. Thank You!
