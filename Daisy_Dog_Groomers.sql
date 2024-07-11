create table owner(
owner_id int not null auto_increment primary key,
owner_name varchar(256) not null,
owner_email varchar(256) not null,
owner_phone_number varchar(256) not null

);
CREATE TABLE dog (
    dog_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    dog_owner_id INT NOT NULL,
    dog_name VARCHAR(256) NOT NULL,
    dog_breed VARCHAR(256) NOT NULL,
    dog_notes VARCHAR(256),
    FOREIGN KEY (dog_owner_id)
        REFERENCES owner (owner_id)
);
CREATE TABLE groomer (
    groomer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    groomer_name VARCHAR(256) NOT NULL,
    gromer_email VARCHAR(256) NOT NULL,
    groomer_phone_number VARCHAR(256) NOT NULL
);

CREATE TABLE appointment (
    appointment_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    groomer_id INT NOT NULL,
    dog_id INT NOT NULL,
    appointment_date_time DATETIME,
    appointment_bath BOOLEAN,
    appointment_haircut BOOLEAN,
    appointment_the_works BOOLEAN,
    appointment_status ENUM('pending', 'complete'),
    FOREIGN KEY (groomer_id)
        REFERENCES groomer (groomer_id),
    FOREIGN KEY (dog_id)
        REFERENCES dog (dog_id)
);

CREATE TABLE billing (
    billing_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    billing_date DATE,
    appointment_id INT NOT NULL,
    billing_amount DECIMAL(10 , 2 ),
    FOREIGN KEY (appointment_id)
        REFERENCES appointment (appointment_id)
);

select * from appointment;

# Assignment One
#Create all the necessary tables according to the requirements and ER Diagram above


#Assignment Three
#Daisy's asked if we could create a table that will show all the appointments, sorted by appointment date and time,
# where it would show the appointment date, the dog owner name and the dog name.

CREATE VIEW allAppointments AS
    SELECT 
        appointment.appointment_date_time,
        owner.owner_name,
        dog.dog_name
    FROM
        appointment
            INNER JOIN
        appointment ON appointment.dog_id = dog.dog_id
            INNER JOIN
        dog ON dog.dog_owner_id = owner.owner_id
    ORDER BY appointment_date_time;

CREATE VIEW allAppointments AS
     SELECT 
         appointment.appointment_date_time,
         owner.owner_name,
         dog.dog_name
     FROM
         appointment
             INNER JOIN
        dog ON appointment.dog_id = dog.dog_id
             INNER JOIN
         owner ON dog.dog_owner_id = owner.owner_id
     ORDER BY appointment.appointment_date_time;
     
select * from allappointments;

#Assignment Four
#Daisy's liked the table that you made for the previous assignment. 
#They now are asking if you could make one where it would still show each appointment, sorted by appointment date and time, 
#but this time with the dog groomer's name and dog's name associated with each appointment.
     	
CREATE VIEW allgroomerappointments AS
    SELECT 
        groomer.groomer_name,
        dog.dog_name,
        appointment.appointment_date_time
    FROM
        dog,
        appointment,
        groomer
    WHERE
        dog.dog_id = appointment.groomer_id
            AND groomer.groomer_id = appointment.groomer_id
    ORDER BY appointment_date_time;

select * from allgroomerappointments;

# Assignment Five
#The groomers saw the table that you've made and asked to make another table similar to that. But this time a list of appointments, 
#sorted by the appointment date and time, but with the groomer name and owner name for each appointment.

CREATE VIEW groomerownerappointments AS
    SELECT 
        groomer.groomer_name,
        owner.owner_name,
        appointment.appointment_date_time
    FROM
        owner,
        appointment,
        groomer,
        dog
    WHERE
        owner.owner_id = dog.dog_owner_id
            AND dog.dog_id = appointment.dog_id
            AND groomer.groomer_id = appointment.groomer_id
    ORDER BY appointment_date_time ASC;
    
    select * from allgroomerappointments;
    
#Assignment Six
#Daisy's asked if you could create a ranking of the most popular dog breeds that are in their database of dogs.

SELECT 
    dog_breed, COUNT(dog_breed) as breed_count
FROM
    dog
GROUP BY dog_breed
ORDER BY breed_count DESC;

#Assignment Seven
#This time, they asked if you could create a ranking of dog breeds in the appointment table that are most frequently occurring.

SELECT 
    dog_breed, COUNT(dog_breed) AS breed_count
FROM
    dog
        INNER JOIN
    appointment ON dog.dog_id = appointment.dog_id
GROUP BY dog_breed
ORDER BY breed_count DESC;

#Assignment Eight
#The manager of Daisy asked if we could create a ranking of groomers that have the most hair cut appointments.

select * from groomer;

SELECT 
    groomer_name,
    COUNT(appointment_haircut) AS haircut_appointment
FROM
    groomer
        INNER JOIN
    appointment ON groomer.groomer_id = appointment.groomer_id
WHERE
    appointment_haircut = 1
GROUP BY groomer_name
ORDER BY haircut_appointment DESC;


#Assignment Nine
#The groomers asked if we could now create a ranking of the dog breeds that have the most dog notes on them.

SELECT 
    dog_breed, COUNT(dog_notes) AS total_notes
FROM
    dog
GROUP BY dog_breed
ORDER BY total_notes DESC;


#Assignment Ten
#This time they asked if we could create a ranking for the dog breeds that get the most dog baths.

SELECT 
    dog_breed, COUNT(appointment_bath) AS bath_count
FROM
    dog
        INNER JOIN
    appointment ON dog.dog_id = appointment.dog_id
WHERE
    appointment_bath = 1
GROUP BY dog_breed
ORDER BY bath_count DESC;





