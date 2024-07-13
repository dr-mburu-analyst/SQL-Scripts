
# Daisy's Dog Groomers Database Project

### Overview

- This project involves designing and implementing a comprehensive database for Daisy's Dog Groomers to efficiently manage their business operations.
- The database includes tables for owners, dogs, groomers, appointments, and billing.
- It also includes views and queries to answer specific client requirements and generate valuable business insights.

#### Objectives

- Design and implement a relational database based on the provided ER diagram.
- Import data from CSV files into the database.
- Create detailed tables, views, and rankings to meet specific client requirements.
- Answer specific questions about the database to ensure it meets all client requirements.

#### Database Components

##### Tables

- **Owners**: Stores information about the dog owners (clients) including name, email, and phone number.
- **Dogs**: Stores information about the dogs including name, breed, and notes about specific characteristics.
- **Groomers**: Stores information about the groomers including phone number and email.
- **Appointments**: Stores information about the appointments including date, time, services offered, and status.
- **Billing**: Stores billing information associated with each appointment including the date and price.

**Daisy's Dog Groomers ER Diagram**
- The ER diagram shows how the tables are related.

  
##### Views

- **All Appointments**: Lists all appointments sorted by appointment date and time, showing the appointment date, dog owner name, and dog name.
- **Appointments with Groomers and Dogs**: Lists appointments with the groomer’s name and dog's name associated with each appointment.
- **Appointments with Groomers and Owners**: Lists appointments with the groomer name and owner name for each appointment.

##### Rankings

- **Most Popular Dog Breeds**: Ranks dog breeds based on their occurrence in the database.
- **Most Frequently Occurring Dog Breeds in Appointments**: Ranks dog breeds based on their occurrence in the appointment table.
- **Groomers with Most Hair Cut Appointments**: Ranks groomers based on the number of hair cut appointments.
- **Dog Breeds with Most Notes**: Ranks dog breeds based on the number of notes.
- **Dog Breeds with Most Baths**: Ranks dog breeds based on the number of baths.

#### Project Structure

- **SQL Scripts**: Contains SQL scripts for creating tables, views, and performing various queries.
- **CSV Files**: Contains CSV files used for importing initial data into the database.
- **Screenshots**: Contains screenshots of SQL code and query results used for presentation.

### Conclusion
- This project successfully implements a comprehensive database for Daisy's Dog Groomers, streamlining their business operations and 
providing valuable insights through data analysis.
- Future work can include further optimization and additional features based on evolving business needs




