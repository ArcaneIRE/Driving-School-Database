# Driving School Database

### Description

The digitisation of a driving school record system to a PostgreSQL database. Involves accessing the database through python.

### Collaborators

| Name  | Github Username |
| ------------- | ------------- |
| David Corcoran  | @ArcaneIRE |
| Sadhbh Gowran | @SGowran |
| Daniel Fegan | @D18124733 |

## Marking Scheme

### Group Section - 2 Marks

1. ERD in Oracle Data Modeller
    - [x] Logical and Relational Model
    - [x] Columns hidden
        > view details -> columns only
    - [x] Accessible reading format
        > right click -> select all -> change format (?)
    - [x] `CREATE` statements generated from the model
2. Tables created in group schema on uni DB
    - [x] Single SQL file
    - [x] Commented
    - [ ] Appropriate privileges granted to each role
      - Not too much, not too little
    - [x] At least 4 rows created in each table
3. Word Doc
    - [x] Screenshots of logical and relation model
    - [x] Short descriptions of each
    - [x] Each member needs to submit this

### Individual Section - 4 Marks

1. Role Definition - 1 mark
    - [x] Each person takes on a unique role in the system based on the case study
    - [ ] Explanation of this role in your personal word document
    - [ ] *Use your own student schema to work on the tables in the group schema when needed*
2. Programmed Transaction and Trigger - 3 marks
    - [x] PLpgSQL function or procedure with parameters to run a transaction to change data in the DB
      - [x] Separate SQL file
      - [x] Commented
      - [ ] Must include decision making
      - [x] Must include error checking
    - [x] Constraint Trigger
        - [x] Separate SQL file
        - [x] Commented
    - [ ] Python Program
      - [ ] Call function
      - [ ] Handle output

## Case Study Summary (Summarized by ChatGPT)

- Current offline system for student bookings and instructor schedules with data stored in a computer system.
- The Managing Director aims to digitize the system.
- Students must register with a unique number and book an assessment lesson.
- Booking staff handle registrations, contact students with assessment results, and schedule lessons.
- Students can book lessons with registered instructors, choose to use company cars (with an extra fee), or bring their own vehicles.
- Instructors manage schedules through paper diaries.
