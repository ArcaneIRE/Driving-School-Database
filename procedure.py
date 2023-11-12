import psycopg2
import getpass
import pandas as pd
from psycopg2 import Error
from datetime import datetime
try:
    print("=== Please log in to database ===")
    connection = psycopg2.connect(
        host="147.252.250.51",
        user="D22126022",
        password=getpass.getpass(prompt='Password: '),
        port="5432",
        database="postgres")
    cursor = connection.cursor()
    select_query = 'select * from "Drive856A".bookingtimeslot;'
    cursor.execute(select_query)
    df = pd.DataFrame(
        cursor.fetchall(),
        columns=['ID', 'Start Time', 'End Time', 'Booking ID', 'Staff ID'])
    print("=== Timeslot Table (Initial) ===")
    print(df)

    print("=== Add a New Timeslot ===")
    print("Enter the timeslot details: ")
    id = input("ID: ")
    start_time = input("Start Time: ")
    end_time = input("End Time: ")
    booking_id = input("Booking ID (can be empty): ")
    staff_id = input("Staff ID: ")

    if id == "":
        raise Exception("ID cannot be empty")
    if start_time == "":
        raise Exception("Start time cannot be empty")
    if end_time == "":
        raise Exception("End time cannot be empty")
    if booking_id == "":
        booking_id = "NULL"
    else:
        booking_id = f"\'{booking_id}\'"
    if staff_id == "":
        raise Exception("Staff ID cannot be empty")

    cursor.execute(
        f"""call "Drive856A".add_timeslot('{id}', '{start_time}', '{end_time}', {booking_id}, '{staff_id}');""")
    connection.commit()

    select_query = 'select * from "Drive856A".bookingtimeslot;'
    cursor.execute(select_query)
    df = pd.DataFrame(
        cursor.fetchall(),
        columns=['ID', 'Start Time', 'End Time', 'Booking ID', 'Staff ID'])
    print("=== Timeslot Table (Post Query) ===")
    print(df)

    select_query = 'select * from "Drive856A".timeslot_log;'
    cursor.execute(select_query)
    df = pd.DataFrame(
        cursor.fetchall(),
        columns=['ID', 'Username', 'Staff ID', 'Date'])
    print("\n\n")
    print("=== Log Table (Post Query) ===")
    print(df)
except (Exception, Error) as error:
    print("Error while connecting to PostgreSQL", error)
finally:
    if (connection):
        cursor.close()
        connection.close()
        print("\n\nPostgreSQL connection is closed")
    else:
        print("Terminating")