# Inspration for programming with a extensible menu, using the metro line as an example
# KEA BE-IT, December 2021, jenr@kea.dk

# Import modules
# Built-in os module
import os
import time
# beautifultable 1.0.1 [https://pypi.org/project/beautifultable/]
from beautifultable import BeautifulTable

# Define static text strings
hr = 80*'-'
msgHello = 'Hello, and welcome to this script'
msgGoodbye = 'Goodbye, thanks for using me'
msgClear = 'Oh, how nice with a clear view...'
# - including dictionary to drive menu choices other than clear/quit
menuItems = {
    '1': 'Show number of metro stations',
    '2': 'Fuck off'
}

# ------------------------------------------------------------------------------
# FUNCTION DEFINITIONS

def clearScreen():
    # Clear the terminal window, using the proper operating system commmand
    # Arguments: None
    if os.name == 'nt':
        # Windows system
        os.system('cls')
    else:
        # Mac or other unix-based system
        os.system('clear')

def createFile(name, content):
    # Creates a file, overwrites content!
    # Arguments:
    # - name: string; remember extension, typically .txt
    # - content: string
    file = open(name, "w")
    file.write(content)
    file.close

def drawTable(title, header, data):
    # Display a nice table with specified input
    # Arguments:
    # - title: string
    # - header: list of strings, one for each column
    # - data: list of tuples
    table = BeautifulTable()
    for row in data:
        table.rows.append(row)
    table.columns.alignment = BeautifulTable.ALIGN_LEFT
    table.columns.header = header
    table.set_style(BeautifulTable.STYLE_RST)
    print(title)
    print(table)

def readFile(name = 'CphMetroM3.txt'):
    # Reads a file
    # Arguments:
    # - name: string
    file = open(name, "r")
    content = file.read(22)
    file.close
    print(content)

    # for i in content:
    #     print(i)
# HERE
# HERE
# HERE
    # content = list(content)
    # stuff = len(content[0])
    #
    # return stuff
# HERE
# HERE
# HERE

def showMenu(options = {42: 'Do absolutely nothing'}):
    # Define and display a menu with options to clear or quit, plus the items given in a dictionary
    # Arguments:
    # - options: dictionary of menu options
    # Return values:
    # - validOptions: list of valid menu options
    print(hr)
    print('Please select from the menu')
    print('---MENU---')
    validOptions = list()
    for choice,text in options.items():
        print(f"{choice}: {text}")
        validOptions.append(choice)
    print('- type C to clear the screen')
    print('- or type Q to quit')
    print(hr)
    msg = input('Please enter menu option:\n')
    if msg in validOptions:
        return msg
    elif msg.upper() == 'C':
        return 'clearScreen'
    elif msg.upper() == 'Q':
        return 'quitApp'
    else:
        return 'invalid'
# ------------------------------------------------------------------------------
# MAIN LOGIC

print(hr)
print(msgHello)

print('Reading a file results in:')
contents = readFile()
print(contents)

# while True:
#     # Call the showMenu function and assign return value to choice
#     choice = showMenu(menuItems)
#     time.sleep(1)
#     if choice == 'quitApp':
#         break
#     elif choice == 'clearScreen':
#         clearScreen()
#         print(msgClear)
#     elif choice == 'invalid':
#         print("invalid choice, please try again!")
#     else:
#         print(f"Menu {choice} has not yet been implemented, sorry!")

print(msgGoodbye)
print(hr)
# ------------------------------------------------------------------------------
# end of script
