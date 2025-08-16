MySQL Assignment

Project Description
This project contains a collection of MySQL stored procedures designed to manage and report on subscriber watch history data. The procedures handle tasks such as checking for existing records and generating detailed reports as part of the assignment. This assumes that you will run the table initialization script (initial_SQL.sql) that is provided with the assignment o download and run it from the git repo mentioned belw. If you want a copy of the initial script, please connect to me at anshul.agrawal@research.iiit.ac.in. 

Assumptions : 

1. In the schema it is assumed that the subscriber will have a unique name in the records. We have not handled cases where 2 different subscribers have the same name. 
2. The primary keys for all tables are auto incremented on insertion of records

Prerequisites
To use these scripts, you must have a MySQL server installed and running.

Setup Instructions
Follow these steps to set up the database and load the stored procedures:

Connect to MySQL:
Open your MySQL client (e.g., MySQL Workbench, a terminal, or your preferred IDE) and connect to your database server.

Create the Database:
First, create the database that will hold your tables and procedures.

CREATE DATABASE IF NOT EXISTS Viewership;
USE Viewership;

Run the SQL Scripts:
Execute the following scripts in the order below. This ensures that the necessary tables and dependent procedures are created before they are called by other scripts (refer to the initial_sql above). The ideal sequence of SQLs to be run is q1.sql->q2.sql->q3.sql->q4.sql->q5.sql


File Structure
This project contains the following SQL scripts:

q1.sql: Contains ListAllSubscribers() which lists all the subscribers in the Subscribers table

q2.sql: Contains GetWatchHistoryBySubscriber which prints the Subscriber name, Title watched and Watchtime for a given subscriber ID

q3.sql: Defines a procedure that inserts a record for a new single subscriber.

q4.sql: Defines the SendWatchTimeReport procedure, which uses a cursor to loop through all subscribers who have watched some content and prints the Title and respective watch time.

q5.sql: Contains a procedure SubscriberWatchTimeReport with a cursor that loops through each subscriber and for each subscriber GetWatchHistoryBySubscriber() to print their watch history.

Each sql file contains the example on how to call the procedure as the last line as a comment. you can refer to it for the guidance on how to use the procedures. 

Git Repository
You can find the source code for this project on GitHub at:
https://github.com/agrawal-anshul2005/2025901015_lab2