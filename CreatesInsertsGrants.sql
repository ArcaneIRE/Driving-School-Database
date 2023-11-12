/*drop table bookingtimeslot;
drop table booking;
drop table car;
drop table lessonstatus;
drop table lessontopic;
drop table staff;
drop table student;
*/

/*CREATES*/

CREATE TABLE booking (
    id                 INTEGER primary KEY,
    cost               INTEGER,
    student_id         INTEGER NOT NULL,
    car_registrationno INTEGER NOT NULL,
    lessonstatus_id    INTEGER NOT NULL,
    lessontopic_id     INTEGER NOT null
);

CREATE TABLE bookingtimeslot (
    id         INTEGER primary KEY,
    starttime  TIME NOT NULL,
    endtime    TIME NOT NULL,
    booking_id INTEGER,
    staff_id   INTEGER NOT null,
    UNIQUE(booking_id)
);

CREATE TABLE car (
    registrationno INTEGER primary key,
    validnct       BOOL
);

CREATE TABLE lessonstatus (
    id          INTEGER primary key,
    status      VARCHAR(100) NOT NULL,
    description VARCHAR(500)
);

CREATE TABLE lessontopic (
    id    INTEGER primary key,
    topic VARCHAR(300) NOT NULL
);

CREATE TABLE staff (
    id   INTEGER primary key,
    name VARCHAR(100) NOT NULL,
    role VARCHAR(100)
);

CREATE TABLE student (
    id              SERIAL primary key,
    name            VARCHAR(100) NOT NULL,
    phonenumber     VARCHAR(15),
    lessonsrequired INTEGER
);

ALTER TABLE booking
    ADD CONSTRAINT booking_car_fk FOREIGN KEY ( car_registrationno )
        REFERENCES car ( registrationno );

ALTER TABLE booking
    ADD CONSTRAINT booking_lessonstatus_fk FOREIGN KEY ( lessonstatus_id )
        REFERENCES lessonstatus ( id );

ALTER TABLE booking
    ADD CONSTRAINT booking_lessontopic_fk FOREIGN KEY ( lessontopic_id )
        REFERENCES lessontopic ( id );

ALTER TABLE booking
    ADD CONSTRAINT booking_student_fk FOREIGN KEY ( student_id )
        REFERENCES student ( id );

ALTER TABLE bookingtimeslot
    ADD CONSTRAINT bookingtimeslot_booking_fk FOREIGN KEY ( booking_id )
        REFERENCES booking ( id );

ALTER TABLE bookingtimeslot
    ADD CONSTRAINT bookingtimeslot_staff_fk FOREIGN KEY ( staff_id )
        REFERENCES staff ( id );

/*INSERTS*/
       
INSERT into staff VALUES (1, 'Cobra John', 'Role');
INSERT into staff VALUES (2, 'Unicorn Holly', 'Role');
INSERT into staff VALUES (3, 'Elephant June', 'Role');
INSERT into staff VALUES (4, 'Tiger Lira', 'Role');

INSERT INTO student(name, phonenumber, lessonsrequired) VALUES ('Crane Smith', '0811234567', 0);
INSERT INTO student(name, phonenumber, lessonsrequired) VALUES ('Dove Knight', '0811234567', 0);
INSERT INTO student(name, phonenumber, lessonsrequired) VALUES ('Sparrow Gibson', '0811234567', 1);
INSERT INTO student(name, phonenumber, lessonsrequired) VALUES ('Thrush Walken', '0811234567', 0);

insert into car VALUES (1, true);
insert into car VALUES (2, false);
insert into car VALUES (3, false);
insert into car VALUES (4, true);

INSERT INTO lessonstatus VALUES ('1', '', '');
INSERT INTO lessonstatus VALUES ('2', '', '');
INSERT INTO lessonstatus VALUES ('3', '', '');
INSERT INTO lessonstatus VALUES ('4', '', '');

INSERT INTO lessontopic VALUES ('1', 'Turning on the car');
INSERT INTO lessontopic VALUES ('2', 'Not crashing');
INSERT INTO lessontopic VALUES ('3', 'Stopping the car');
INSERT INTO lessontopic VALUES ('4', 'Formula 1 Qualifying');

INSERT INTO booking VALUES (1, 1,  1,  1, 1, 1);
INSERT INTO booking VALUES (2, 1000000, 2,  2, 2, 2);
INSERT INTO booking VALUES (3, 5, 3,  3, 3, 3);
INSERT INTO booking VALUES (4, 0, 4,  4, 4, 4);

INSERT INTO bookingtimeslot VALUES (1, '00:00:00', '00:00:01', 1,  1);
INSERT INTO bookingtimeslot VALUES (2, '01:00:00', '01:00:01', 2,  2);
INSERT INTO bookingtimeslot VALUES (3, '02:00:00', '02:00:01', 3,  3);
INSERT INTO bookingtimeslot VALUES (4, '03:00:00', '03:00:01', 4,  4);

/*Drive856A*/
Grant usage on schema "Drive856A" to "D18124733";
grant all on table student to "D18124733";
grant update on sequence student_id_seq to "D18124733";

