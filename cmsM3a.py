# Inspration for programming with a extensible menu, using the metro line as an example
# KEA BE-IT, December 2021, jenr@kea.dk

# Import modules
# Built-in os module
import os
# beautifultable 1.0.1 [https://pypi.org/project/beautifultable/]
from beautifultable import BeautifulTable

# Define static text strings
hr = 80*'-'
msgHello = 'Hello, and welcome to this script'
msgGoodbye = 'Goodbye, thanks for using me'

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

def showMenu(options = {42: 'Do absolutely nothing'}):
    # Define menu items in a dictionary, then display the menu
    # Arguments:
    # - options: dictionary of menu options
    # Return values:
    # - validOptions: list of valid menu options
    print(hr)
    print('Please select from the menu')
    print('- type C to clear the screen')
    print('- or type Q to quit')
    print('---MENU---')
    for choice,text in options.items():
        print(f"{choice}: {text}")
    print('----------')
    validOptions = list(options.keys())
    return validOptions

# ------------------------------------------------------------------------------
# MAIN LOGIC
menuItems = {
    1: 'Show number of metro stations',
    2: 'Fuck off'
}

showMenu()
