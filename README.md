# CS3319-asn2

# Assignment 2
## Purpose:
#### *To give you practice:*
- drawing more ER diagrams
- converting an ER diagram to a relational database
- creating a database using SQL
- creating tables using SQL
- inserting, modifying and deleting data from tables using SQL
- querying a database using SQL
- doing a bulk load of a table using a comma separated file
## The Problem:
The database you design should be for the following scenario:  A bus tour company needs to keep track of its bus trips.  Each bus trip has a unique trip id (integer), a start date, an end date, a country that will be visited (just one country per trip - up to 30 chars) and a trip name (not necessarily unique - 50 chars).   There will be buses.  Each bus has a unique License Plate number (7chars), and a capacity (total number of seats on the bus).There will be passengers. Each passenger will have a unique passenger id (integer), a first name (20 char) and a last name(20 char).  There will be passports. Each passport will have a unique passport number (4 char), an expiry date, a country of citizenship (only 1 - up to 30 chars) and a birth date. All of the above fields are required and cannot be null.  The relationships will be:

- Passengers have one passport only (we wont be dealing with dual citizenship). Every passenger MUST have a passport. 
- Passengers book bus trips. The price for the trip is different for each passenger depending on when and where they purchased the trip, so keep track of the price the passenger paid for the trip.  A passenger might take many trips with the company.  Not every passenger will book a trip when we start keeping track of the passenger.  New trips might not have any passengers initially.
- Each bus trip is assigned 1 bus.  New trips won't have buses assigned to them initially.  New buses will not initially have any trips assigned to them.


## Instructions:
There are 2 parts for this assignment. In part 1 you will draw an ER diagram and in part 2 you will convert your ER diagram into a database and  create the database on your virtual machine using MySQL
### **Part 1:**
For the above scenario, draw an ER diagram using MS Visio or draw.io.   Then save your ER diagram as last2digits\_ERDiagram.jpg (or .pdf, or .gif). You should show the total or partial participation using the single/double lines. You do NOT need to include the (min,max) this time. Do NOT use Crows Feet Notation.  Make sure you indicate the primary key and the cardinality. 
### **Part 2:**
Using your ER diagram from above, figure out what tables you will need for your database. Create the following 4 script files (more details to follow):

1. File 1: Delete the database and create a new database  and create the tables
1. File 2: Insert some data and update the data
1. File 3: Query the data
1. File 4: Delete some data, add a constraint, add a view

Make sure the SQL commands are UPPER case and the table names and column names are lowercase.  
## IMPORTANT:
Get onto your virtual machine using your terminal window or putty (use vm???@cs3319.gaul.csd.uwo.ca, then ssh centos@vm??? where ??? is the number for the virtual machine you were assigned) and do the following:

- Make sure that you have set up your Bit Bucket Account properly. This video walks you through it and helps you set it up so that you don't have to type your password each time you want to push or pull files -  it shows you how to set a public/private key pair on both your laptop and on your vitual machine (This is shown starting at Minute 0, Second 45). It also shows you how to set up your directory for assignment 2 on your VM and push from the VM to Bit Bucket.(This is shown starting at about Minute 7, Second 10). You probably want to watch the whole 20 minutes and follow along on your computer.  Here is the link: <https://www.csd.uwo.ca/~lreid2/blendedcs3319/videolectures/week5/video2019/bitbucketpart3/bitbucketpart3.html>
- From your home directory, create a directory called ***assignment2*** as shown in the video (this step is around Minute 13):
- Make sure that you create your 4 script files for the assignment (see below for description of the script files) in that ***assignment2*** directory that is now in Bit Bucket.
- Make sure that you FREQUENTLY push your script files up to Bit Bucket so that you have backups of your work.  MAKE SURE YOU PUSH YOUR SCRIPT FILES OFTEN!


### **File 1 - Creation of Database and Tables**
Create a script file that contains the MySQL commands to:

- List all the current databases owned by you
- Delete the database called last2digitsofyourstudentnumber\_assign2db if it exists
- Create a database called last2digitsofyourstudentnumber\_assign2db
- Connect to (use) that database
- List all the tables (should be none initially)
- Create the tables you need to solve the problem above with the appropriate types and keys, foreign keys.  Make sure that:
  - you create the foreign keys (this may force you to create the tables in a certain order in order to indicate the foreign keys)
  - when you delete a bustrip, cause an error to occur if the bustrip still has any bookings so that you can return the passengers money.  If you delete a  passenger make sure that any bookings that passenger has gets deleted also and that the associated passport get deleted as well.  (HINT: Google CASCADE for the delete command)
- List the tables again
- Call this script: ***last2digitsofyourstudentnumbe\_script1.sq**l*
- After you have the script working, save the output from it using the following command (DO NOT copy and paste this command, type it in yourself because we have had issues when students copy and paste from owl):
  `            `**s*udo mysql -nvvf --verbose -pyourpassword < last2digits\_script1.sql  > last2digits\_outputscript1.txt 2>&*1**
  - NOTES:
    - make sure you turn -pyourpassword to be whatever your MySQL password is. Likely you will put:  ***-pcs3319***
    - < means pipe every command in the usernamescript1.sql INTO mysql to execute each command in order.
    - > means pipe all the output from the commands in the input script to usernameoutscript.txt
    - 2>&1 means also pipe (>) any errors (errors go to 2) into the same location as the stdout(&1) as the output script file as well rather than to the terminal
### **File 2 - Insertion and Modification**
- HINT: You will need to make sure you are connected to the correct database as the first step in this script. 
- REMEMBER that before you start your inserts, do a SELECT command to prove the table was empty AND after you insert the all the data for each table, do a SELECT to prove that it now has data. 
- Using the ***LOAD DATA LOCAL INFILE ...*** mysql command (you will need to Google to see the syntax for this command), load the following data into the ***bus*** table:  [<http://www.csd.uwo.ca/~lreid/blendedcs3319/assignments/assignment2/loaddatafall2021.txt>]
  - NOTE: You will need to make a copy of the above data file in your assignment2 directory on your virtual machine. You cannot directly link to the above file. 
- Using the SQL INSERT statement, insert the following data also into the tables. NOTE: it doesn't matter if you insert the passengers first or the passports first BUT the way you did the foreign key will affect this. Because it was total participation between the two on both sides, you could put the passport key in the passenger table as a foreign key OR you might have put the passenger key in the passport table as a foreign key. Which ever way you choice will dictate the order you must insert into these 2 tables as you cant insert the foreign keys until you have created the associated primary keys. 
  - **Passengers:**
    - 11, Homer Simpson, US10
    - 22, Marge Simpson, US12
    - 33, Bart Simpson, US13
    - 34, Lisa Simpson, US14
    - 35, Maggie Simpson, US15
    - 44, Ned Flanders, US22
    - 45, Todd Flanders, US23
    - 66, Heidi Klum, GE11
    - 77, Michael Scott, US88
    - 78, Dwight Schrute, US89
    - 79, Pam Beesly, US90
    - 80, Creed Bratton, US91
    - A character from your favourite TV Show
  - **Passports:**
    - US10, USA, 1/1/2025, 2/19/1970 
    - US12, USA, 1/1/2025, 8/12/1972
    - US13, USA, 1/1/2025, 5/12/2001
    - US14, USA, 1/1/2025, 3/19/2004
    - US15, USA, 1/1/2025, 9/17/2012
    - US22, USA, 4/4/2030, 6/11/1950
    - US23, USA, 3/3/2018, 6/24/1940
    - GE11, Germany, 1/1/2027, 7/12/1970
    - US88, Canada, 2/13/2030,4/25/1979
    - US89, Canada, 2/2/2022, 4/8/1976
    - US90, Italy, 2/28/2020, 4/4/1980
    - US91, Germany, 1/1/2030, 2/2/1959
    - A passport for the character from your favourite TV Show
  - **Bus Trips:**
    - 1, "Castles of Germany", 1/1/2022, 1/17/2022, Germany, VAN1111
    - 2, "Tuscany Sunsets", 3/3/2022, 3/14/2022, Italy, TAXI222
    - 3, "California Wines", 5/5/2022, 5/10/2022, USA, VAN2222
    - 4, "Beaches Galore", 4/4/2022, 4/14/2022, Bermuda, TAXI222
    - 5, "Cottage Country", 6/1/2022, 6/22/2022, Canada, CAND123
    - 6, "Arrivaderci Roma", 7/5/2022, 7/15/2022, Italy, TAXI111
    - 7, "Shetland and Orkney", 9/9/2022, 9/29/2022, UK, TAXI111
    - 8. "Disney World and Sea World", 6/10/2022, 6/20/2022, USA, VAN2222
    - 9, Make up your own dream trip
    - 10, Make up your worst nightmare trip!
  - Bookings:
    - All of the Simpson are going to do the Castles of Germany trip. The 2 adults paid 500 dollars each and 3 children paid 200 dollars each
    - Heidi Klum is also doing the Castles of Germany trip.  She paid 600.99 dollars.
    - Both of the Flanders are going to Disney World/Sea World.  Ned paid 400 dollars and Todd paid 200 dollars
    - Dwight and Creed are going Beaches Galore trip. They both paid 600 dollars.
    - Dwight is also doing the Castles of Germany trip. He paid 550 dollars
    - Bart and Lisa Simpson are going to Disney World and Sea World. They both paid 300 dollars.
    - All of the Simpsons are doing the Arrivaderci Roma trip. The parents paid 600 dollars and each of the kids paid 100 dollars.
    - Homer Simpson and Ned Flanders and Michael Scott are all doing the "Shetland Orkney" trip. Homer paid 300, Ned paid 400 and Michael paid 500 dollars
    - Have your made up TV character take your nightmare trip. You can decide on the cost (must be greater than 0)
 
- Make sure you remembered to show what was in the table before and after in each table to prove that your inserts worked.
- Using the SQL UPDATE command, update the data as follows (remember to show the table BEFORE and AFTER you do each of the updates below):
  - Change the country of passport for Dwight Schrute to be Germany rather than Canada. Use the first and last name to change the value (so you must join to the passenger table, so not just eyeball Dwight's passport number). 
  - Change any trip that is from the USA to use VAN1111
- Call this script: *last2digitsofstudentnumber\_script2.sql*
- After you have the script working, save the output from it using the following command:

`    `**s*udo mysql -nvvf --verbose -pyourpassword < last2digits\_script2.sql  > last2digits\_outputscript2.txt 2>&*1**


### **File 3 - Queries**
Write SQL commands that query the data to:

1. Show the trip names of all the trips from Italy
1. Show the last names of all passengers with no repeats
1. Show all the data in the bus trip table, but show them in order of their trip names from A to Z;
1. List the trip name and country and start date of all trips that start after April 30 of 2022.
1. List the first name, last name and birth date of all citizens of the USA. 
1. List the trip name and the number of seat available (Capacity of the assigned bus) for that trip for any trips starting between and including April 1, 2022 to Sept 1, 2022 (just check the starting dates, not the ending dates)
1. List all the data for both the passport and the passenger for any passenger whose passport has expired or will expire within 1 year from the current date. (Google the MySQL command's CURDATE()  and ADDDATE() to help you make this work no matter what date it is today).
1. List the first name, last name and bus trip name for any trips that anyone whose last name starts with S.
1. Count the number of passengers taking the Castles of Germany trip. List that total number of passengers and the trip name and trip id. 
1. List the countries that have trips and total amount of dollars brought in for each country. Each country name should just show up once along with the total.
1. List the passengers first and last names, citizenship country and the trip name  and trip country name of any passengers taking trips in a country that they are NOT a citizen of.
1. List the bus trip id and  bus trip name of all bus trips that do not have any passengers yet. 
1. Figure out which passenger is paying the most amount of money to our company (i.e. spending the most money in total on our trips). If there is a tie for top amount, list all the passengers paying that amount. List the first name, last name, country of citizenship and the total amount of money that passenger is spending.   You might want to write a helper view and then a query on that view. (HARD - without using a view this took me a while (but you can use a view)!)
1. Find the names of any bus trips with bookings but with less than 4 people taking them. (Hint: you will have to use the key words *Group By* and *Having*)
1. We want to make sure that bus trips have enough seats.  Write a query that figures out if any of the bus trips have too many passengers for the size of bus assigned to them.  Display the trip name, the number of passengers booked on it and the capacity and license plate number for the bus.   Write the query so that the columns have the following neat titles "Bus Trip Name", "Current Number of Passengers", "Current Bus Assigned License Plate", "Capacity of Assigned Bus".
- Before each of the above queries, put an MySQL  comment that tells the query number to help figure out which queries are answering each of the questions above. . In MySQL comments start with -- , so do something like:
  --  Query 1
  SELECT \* FROM ...
  - NOTE: when doing comments in script files you MUST put two hyphens and then you MUST put a space, if you put 3 or more hyphens in a row or 2 hyphens with no space, the comment does NOT work. For example:
    - These 2 comment lines will NOT work:
      **-----------
      --Query 1
      SELECT \* FROM ...**
    - These 2 comment lines WILL work:
      **-- ---------
      -- Query 1
      SELECT \* FROM ...**
- Call this script: *last2digitsofyourstudentnumber\_script3.sql*
- After you have the script working, save the output from it using the following command:

`       `**s*udo mysql -nvvf --verbose -pyourpassword < last2digits\_useridscript3.sql  > last2digitis\_outputscript3.txt 2>&*1**
### **File 4 - Deletions/Views**


- Create a view that shows the first name, last name, trip name, trip country and trip price for every passenger who taking a trip. 
- Prove that your view works by selecting all the rows from it.
- Run your view again but this time just select all the columns from the view but only the rows where the trip has a trip name that will take you to a place involving "Castles" . Order the rows in ascending order by the price the passengers paid starting at the lowest price.  
- Show all the bus table information
- Delete any bus whose license plate contains "UWO" in it.
- Show all the bus information again to make sure it was remove
- Show all the data from passport table
- Show all the data from the passenger table
- Delete all the passport from Canada
- Show all the data from passport table
- Show all the data from the passenger table
- Put a comment (-- the reason why ...) in your script file to explain which tables were affected and why
- Show everything in the bustrip table. 
- Delete the California Wines trip
- Show everything in the bustrip table again to make sure it was deleted.
- Try to delete the Arrivaderci Roma trip
- Put a comment ( -- reason why ..) in your script file to explain why this trip could not be deleted.
- Show everything in the passenger table
- Delete anyone with the first name Pam
- Show everything in passenger table again to make sure she was deleted.
- Select everything from the view your created for this fourth script from the passenger table (you cannot delete from views, they just display data but don't actually hold the data)
- Delete anyone with the last name Simpson.
- Select everything from that view again and make sure the bookings for the Simpsons disappeared when they were deleted*.*
- Call this script: *last2digitsofyourstudentnumber\_script4.sql* 
- After you have the script working, save the output from it using the following command:

`    `**s*udo mysql -nvvf --verbose -pyourpassword < last2digits\_script4.sql  > last2digits\_outputscript4.txt 2>&*1**
## Notes:
- Here is a sample script file:  <http://www.csd.uwo.ca/~lreid/cs3319/assignments/assignment2/samplescriptmysql.txt>
- Do the steps (inserts, deletes, etc...) in the order given
- Put MySQL comments (comments start with -- ) anywhere that you think might help the reader figure out what you are doing.
- For any insert, delete or update commands remember to show the table before and after you modified it
- Remember: Best practice is for SQL keywords to be uppercase and the tables and columns to be lowercase (or camel case)
## Handing in the Assignment
You are required to submit the following files via kritik.iol:

- your ER diagram (named last2digitsofyourstudentnumber\_ERDiagram.jpg/.pdf/.gif)
- your 4 script files
- your 4 files containing the output from the scripts.

IF YOU LOOK IN KRITIK.IO YOU CAN SEE THE RUBRIC FOR THIS ASSIGNMENT!
## HINT:
To make your scripts, the easiest way to do it is to create a .sql file on your local machine (in Notepad for example) with the commands in it, test those commands by copying them from the .sql file and then pasting them into your virtual machine window while running mysql on your VM, make any necessary changes for commands that don't work in the Notepad .sql file, then save the .sql file every so often.   When you are ready to do your final version, copy the code from the .sql local file and paste it into the virtual machine window (and occasionally use Push with Bit Bucket). **THIS METHOD WILL AVOID TYPING ERRORS AND LOSING YOUR FILES!!!**

