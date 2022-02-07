# Web scraping - Metro
# 07-02-2022

# Import
from requests import get
import requests
from bs4 import BeautifulSoup
import pandas as pd

# URL
url = 'https://m.dk/stationer/'
response = requests.get(url)
#response.content
main_page = response.content

soup = BeautifulSoup(main_page, 'html.parser')
# Find alle links på forsiden
get_all_attrib=soup.find_all("a", attrs={"class":'quick-access-item quick-access-item--station'}, href=True)
all_rows=[]

# Loop over alle links
for a in get_all_attrib:
    data=[]
    text_data=''
    linjer=types=indviet=elevatorer=''
    #print(a['href'])  # Kan aktiveres for at se info
    # Find side links og opret ny request
    url2='https://m.dk/'+a['href']
    response2 = requests.get(url2)
    main_content = response2.content

    soup2 = BeautifulSoup(main_content, 'html.parser')
    heading_name = soup2.find("h1", attrs={"class":'page-header__title'})

    # Tilføj overskrift
    data.append(str(heading_name.text))
    get_para=soup2.find("div", attrs={"class":'content-block__text'}).findAll('p')

    for p in get_para:
        if p.find("span", attrs={"class":'headline--large'}) == None:
            desc = str(p.text)
            desc = desc.replace(u'\xa0', u' ')
            text_data+=desc
            inside_link = p.find('a')

            # Hvis afsnittet er et link, opret ny request
            if inside_link is not None:

                url3='https://m.dk/'+inside_link['href']
                response3 = requests.get(url3)
                newpage_content = response3.content
                soup3 = BeautifulSoup(newpage_content, 'html.parser')
                get_list=soup3.find_all("div", attrs={"class":'content-block__text'})
                ul =get_list[1].findAll('li')
                for li in ul:
                    m = li.text
                    if ':' in m:
                        key,val=m.split(':')

                        if key in ['Linjer','Indviet','Type','Elevatorer']:
                            result = {} 
                            val=val.strip()
                            val=val.replace(u'\xa0', u' ')
            
                            if str(key) in 'Linjer':
                                linjer=val
                            elif str(key) in 'Indviet':
                                indviet=val
                            elif str(key) in 'Type':
                                types=val
                            elif str(key) in 'Elevatorer':
                                elevatorer=val  
                    else:
                        #print("-------------" + m)  # Kan aktiveres for at se info
                        for i in  ['Linjer','Indviet','Type','Elevatorer']:
                            if 'Blev indviet' in m:
                                m = m.replace('Blev indviet', 'Indviet')
                            if i in m or i.lower() in m:

                                split_strings = m.split()
                                split_strings.insert(1, ':')
                                final_string = ' '.join(split_strings)

                                key,val=final_string.split(':')

                                result = {} 
                                val=val.strip()
                                val=val.replace(u'\xa0', u' ')
                                key=key.strip()

                                if str(key) in 'Linjer':
                                    linjer=val
                                elif str(key) in 'Indviet':
                                    indviet=val
                                elif str(key) in 'Type':
                                    types=val
                                elif str(key) in 'Elevatorer':
                                    elevatorer=val

    # Tilføj beskrivelse
    data.append(text_data)
    get_list=soup2.find_all("div", attrs={"class":'content-block__text'})
    ul =get_list[1].findAll('li')
    
    # Gennemløb af listen og hent info
    for li in ul:
        #print(li.text)
        m = li.text
        if ':' in m:
            key,val=m.split(':')

            if key in ['Linjer','Indviet','Type','Elevatorer']:
                result = {} 
                val=val.strip()
                val=val.replace(u'\xa0', u' ')
          
                if str(key) in 'Linjer':
                    linjer=val
                elif str(key) in 'Indviet':
                    indviet=val                 
                elif str(key) in 'Type':
                    types=val                 
                elif str(key) in 'Elevatorer':
                    elevatorer=val 
        else:
            
            for i in  ['Linjer','Indviet','Type','Elevatorer']:
                if 'Blev indviet' in m:
                    m = m.replace('Blev indviet', 'Indviet')
                if i in m or i.lower() in m:

                    split_strings = m.split()
                    split_strings.insert(1, ':')
                    final_string = ' '.join(split_strings)

                    key,val=final_string.split(':')

                    result = {} 
                    val=val.strip()
                    val=val.replace(u'\xa0', u' ')
                    key=key.strip()

                    if str(key) in 'Linjer':
                        linjer=val
                    elif str(key) in 'Indviet':
                        indviet=val
                    elif str(key) in 'Type':
                        types=val
                    elif str(key) in 'Elevatorer':
                        elevatorer=val

    # Tilføj resterende information
    data.append(linjer)
    data.append(indviet)
    data.append(types)
    data.append(elevatorer)
    #print(data) # Kan aktiveres for at se info
    #print(len(data)) # Kan aktiveres for at se info
    all_rows.append(tuple(data))
    #print() # Kan aktiveres for at se info
        
# Gem dataframe som Excel fil
df = pd.DataFrame(all_rows, columns=['Navn',  'Beskrivelse', 'Linjer', 'Indvidet', 'Type', 'Elevator'])
df.to_excel('metro.xlsx', index=False)

# Gen dataframe som CSV fil
df.to_csv('metro.csv', index=False)