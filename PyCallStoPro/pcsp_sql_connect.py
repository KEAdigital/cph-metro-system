# PyCallStoPro - connector file
# April 2022, jenr@kea.dk

# sc2sem - Microsoft Azure | Connection strings
# Azure Database for MySQL flexible server
# Connection string for Python:
# cnx = mysql.connector.connect(user="jenr", password="{your_password}", host="sc2sem.mysql.database.azure.com", port=3306, database="{your_database}", ssl_ca="{ca-cert filename}", ssl_disabled=False)

import mysql.connector

def dbconnect():
	# Connect to remote database
	connection = mysql.connector.connect(
		host = 'sc2sem.mysql.database.azure.com',
		port = 3306,
		user = 'stud',
		password = '',
		ssl_ca = 'DigiCertGlobalRootCA.crt.pem',
		ssl_disabled = False
	)
	# The return value is an object: <class 'mysql.connector.connection.MySQLConnection'>
	return connection
