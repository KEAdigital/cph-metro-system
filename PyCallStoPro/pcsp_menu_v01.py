# PyCallStoPro
# - Python calling a stored procedure
# - https://www.mysqltutorial.org/calling-mysql-stored-procedures-python/
# April 2022, jenr@kea.dk

##########
# Import modules
import os, time
# Own connector file
from pcsp_sql_connect import dbconnect
# beautifultable 1.0.1 [https://pypi.org/project/beautifultable/]
from beautifultable import BeautifulTable

##########
# Define static text strings
hr = 55*'-'
filename = os.path.basename(__file__)
msgHello = f'Hello, and welcome to {filename}'
msgGoodbye = f'Quit - thanks for using {filename}'
# Dictionary of menu options
options = {
    1: 'Show databases',
    2: 'Show classicmodels product lines',
    3: 'Show classicmodels employee listing',
    4: 'Show gubicommerce sales report',
    'C': 'Clear screen',
    'Q': 'Quit'
}

##########
# Define functions
def clearScreen():
    # Clear the terminal window, using the proper operating system commmand
    # Arguments: None
    if os.name == 'nt':
        # Windows system
        os.system('cls')
    else:
        # Mac or other unix-based system
        os.system('clear')
def showMenu():
    # Display the menu with options from dictionary
    print(9*'-'+'Menu'+9*'-')
    for key in options.keys():
        print(key, '\t', options[key])
    print(22*'-')
def tableprint(titleStr, headerList, rowList):
    # Prints a title, a table with header and rows, and the number of rows returned/displayed
    table = BeautifulTable()
    table.columns.header = headerList
    table.set_style(BeautifulTable.STYLE_RST)
    for row in rowList:
        table.rows.append(row)
    print(hr)
    print(titleStr)
    print(table)
    print(len(rowList), 'row(s) returned')
    print(hr)
def menu01():
    # Print table of available databases
    q = """
    SHOW DATABASES;
    """
    myCursor.execute(q)
    myRecords = myCursor.fetchall()
    tableprint('Database listing', ['Database name'], myRecords)
def menu02():
    # Switch to classicmodels database
    q = """
    USE classicmodels;
    """
    myCursor.execute(q)
    # Print table of product lines
    q = f"""
    SELECT DISTINCT
        productLine, COUNT(productCode) AS 'Number of products'
    FROM
        products
    GROUP BY productLine;
    """
    myCursor.execute(q)
    products = myCursor.fetchall()
    tableprint('Product lines available in the classicmodels shop', ['Product line', 'Number of products'], products)
def menu03():
    # Switch to classicmodels database
    q = """
    USE classicmodels;
    """
    myCursor.execute(q)
    # Print table of employees
    q = f"""
    SELECT
        territory,
        city,
        CONCAT(firstName, ' ', lastName) AS Name,
        jobTitle
    FROM
        employees,
        offices
    WHERE
        employees.officeCode = offices.officeCode
    ORDER BY territory , city;
    """
    myCursor.execute(q)
    emps = myCursor.fetchall()
    tableprint('Employees in classicmodels sales org.', ['Territory', 'City', 'Name', 'Title'], emps)
def menu04():
    # Switch to gubicommerce database
    q = """
    USE gubicommerce;
    """
    myCursor.execute(q)
    # Print sales report
    q = f"""
    SELECT
        DATE_FORMAT(OrderDate, '%Y-%m-%d') AS Order_Date,
        ProductName AS Product_Name,
        QuantityOrdered AS Quantity,
        FORMAT(QuantityOrdered * QuotedPrice,
            2,
            'da_DK') AS Product_Total_Price
    FROM
        salesorder
            INNER JOIN
        customer ON customer.Id = salesorder.CustomerId
            INNER JOIN
        item ON salesorder.ItemNo = item.ItemNo
    ORDER BY OrderDate;
    """
    myCursor.execute(q)
    orders = myCursor.fetchall()
    tableprint('Sales report for gubicommerce', ['Order date', 'Product', 'Qty', 'Total price'], orders)
def menu05():
    pass

##########
# Logic/code begins here
print(hr)
print(msgHello)
# Create database connection object
thisConn = dbconnect()
# Create cursor object, execute, fetch records
myCursor = thisConn.cursor()




# Switch to metrosystemcph database
q = """
USE metrosystemcph;
"""
myCursor.execute(q)
# Call procedure with args

# This works...
# spName = 'piSomTal'
# myCursor.callproc(spName)
# for n in myCursor.stored_results():
#     print(n.fetchall())

spName = 'lineinfo'
argString = ['M1']
myCursor.callproc(spName, argString)
# result = myCursor.stored_results()
# for line in result:
#     print(line)
for n in myCursor.stored_results():
    print(n.fetchall())
# for result in myCursor.stored_results():
#     print(result.fetchall())
# print(result)
# tableprint('Sales report for gubicommerce', ['Order date', 'Product', 'Qty', 'Total price'], orders)

# for line in result:
#     print(line.fetchall())

# plan = result.fetchall()
# for n in plan:
#     print(n,'\n')

while False:
    # Loop to show menu
    showMenu()
    userChoice = input('Please select option: ')
    if userChoice.upper() == 'Q':
        time.sleep(1)
        break
    elif userChoice.upper() == 'C':
        clearScreen()
    elif userChoice == '1':
        menu01()
    elif userChoice == '2':
        menu02()
    elif userChoice == '3':
        menu03()
    elif userChoice == '4':
        menu04()
    elif userChoice == '5':
        menu05()
    else:
        print('Please try again with a valid menu option!')
# Close database connection
thisConn.close()

# Say goodbye
print(msgGoodbye)

##########
# Script ends here
