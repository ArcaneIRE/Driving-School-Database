import psycopg2
import getpass
import pandas as pd
from psycopg2 import Error
from datetime import datetime
try:
    connection = psycopg2.connect(
        host="147.252.250.51",
        user="D22126022",
        password=getpass.getpass(prompt='Password: '),
        port="5432",
        database="postgres")
    cursor = connection.cursor()
    postgreSQL_select_Query = 'select * from "Drive856A".timetableslots;'
    cursor.execute(postgreSQL_select_Query)
    df = pd.DataFrame(
        cursor.fetchall(),
        columns=['', '', '', '', '', '', '', ''])
    print(df)

    cursor.execute(
        """ call "REM856A".add_timeslot(11, '14:30', '15:30', NULL, 4); """)
    connection.commit()
    print("Result = ", cursor.fetchall())
except (Exception, Error) as error:
    print("Error while connecting to PostgreSQL", error)
finally:
    if (connection):
        cursor.close()
        connection.close()
        print("PostgreSQL connection is closed")
    else:
        print("Terminating")
