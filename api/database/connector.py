import mysql.connector
from mysql.connector import Error
from fastapi import HTTPException, status
import api.database.config


class DatabaseConnector:
    def __init__(self, host=api.database.config.DATABASE_HOST, database=api.database.config.DATABASE,
                 user=api.database.config.DATABASE_USERNAME, password=api.database.config.DATABASE_PASSWORD,
                 port=api.database.config.DATABASE_PORT):
        self.__host = host
        self.__user = user
        self.__password = password
        self.__database = database
        self.__port = port
        if not self.__host:
            raise EnvironmentError("DATABASE_HOST environment variable not found")
        if not self.__user:
            raise EnvironmentError("DATABASE_USERNAME environment variable not found")
        if not self.__password:
            raise EnvironmentError("DATABASE_PASSWORD environment variable not found")
        if not self.__database:
            raise EnvironmentError("DATABASE environment variable not found")
        if not self.__port:
            raise EnvironmentError("DATABASE port variable not found")

    def __connection(self):
        try:
            conn = mysql.connector.connect(user=self.__user,
                                           host=self.__host,
                                           database=self.__database,
                                           password=self.__password,
                                           port=self.__port)
            return conn
        except Error as e:
            raise EnvironmentError("Connect to MySQL failed: " + str(e))

    def action(self, query):
        try:
            conn = self.__connection()
            my_cursor = conn.cursor()
            my_cursor.execute(query)
            conn.commit()
            conn.close()
        except Exception as e:
            raise HTTPException(
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                detail="Database error: " + str(e),
            )

    def query_get(self, query):
        try:
            conn = self.__connection()
            my_cursor = conn.cursor()
            my_cursor.execute(query)
            my_result = my_cursor.fetchall()
            conn.close()
            return my_result
        except Exception as e:
            raise HTTPException(
                status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
                detail="Database error: " + str(e),
            )
