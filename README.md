# illuminatiApp aka myCoolApp
Proof of concept Kahoot mobile application that allows multiple devices/users to connect to a game session and answer quiz questions: coded in Dart (Flutter) Thymeleaf, Java Spring, MySQL with UI in REST API

### What does this app do?
\
\
The server hosts a webapp that runs a quiz
\
\
The mobile app(s) connects to the session that is started by the server webapp, and the mobile app has to answer questions while the time ticks down on the server webapp.
\
\
After time has run out, the webapp displays the answers that have been answered by the mobile app(s) and displays these results in graphs.


# Pre-Requisites
1. MySQL
Ensure that you have a mysql server previously installed on your device and running, if not, download it from here: https://www.mysql.com/downloads/
2. IDE of choice, or command line with Java installed
3. Java
4. Android/IOS device connected to the running server or in the same local network

# Initialization
1. Run the MYSQL.sql file, or run the commands in the mysql server and ensure that the databases are in the tables
2. Using ur IDE of choice, or the command line, run StringOfKisses.java under src/main/java/com.stringofkisses
  <br> OR <br>
  Navigate to the root of the project via command line and execute the command
```
mvn spring-boot:run
```
4. Follow the instructions, or access localhost:8080 to get the website
5. Navigate to main.dart in the androidquiz/lib/main.dart
6. Change URL and URL2 to your local ip address (so that devices on your ip address can connect to the server)
7. Run the app on your phone, while the server and database is running!

# Troubleshooting

You MUST run the mysqld server first before running the Spring Boot Application!

# Screens

![Screenshot (2)](https://github.com/garrysjh/illuminatiApp/assets/105370724/13e4a93b-2a16-4357-89f4-249609d13318)

![Screenshot (3)](https://github.com/garrysjh/illuminatiApp/assets/105370724/cea2cee3-967c-40b6-a145-0add20c5b3b4)



