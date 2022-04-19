-- Sample database for the Copenhagen metro system
-- Used for teaching at BE-IT, November 2021, updated February 2022
-- jenr@kea.dk

DROP DATABASE IF EXISTS MetroSystemCPH;
CREATE DATABASE MetroSystemCPH;
USE MetroSystemCPH;

-- -----------------------------------------------------
-- Structure --
-- Table definitions

CREATE TABLE Line (
    Name VARCHAR(2),
    PRIMARY KEY (Name),
    Stretch VARCHAR(80)
);

CREATE TABLE Station (
    ID INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ID),
    Name VARCHAR(80),
    Slogan TEXT,
    QuickFacts TEXT,
    ListOfFacts TEXT
);

CREATE TABLE LineStation (
    ID INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY (ID),
    Line VARCHAR(2),
    StationID INT,
    FOREIGN KEY (Line)
        REFERENCES Line (Name),
    FOREIGN KEY (StationID)
        REFERENCES Station (ID)
);

-- -----------------------------------------------------
-- Data --

-- Insert rows for each metro line
INSERT INTO Line
    (Name, Stretch)
VALUES
    (
    'M1',
    'Vanløse - Vestamager'
    ),
    (
    'M2',
    'Vanløse - Kbh Lufthavn'
    ),
    (
    'M3',
    'Cityringen'
    ),
    (
    'M4',
    'Kbh H. - Orientkaj'
    )
;

-- Insert stations on the M1 and M2 lines
INSERT INTO Station
    (Name, Slogan, QuickFacts)
VALUES
    (
    'Vanløse',
    '',
    'Side om side med S-togstationen ligger Vanløse Station, som er den vestligst beliggende station på metrolinjerne M1 og M2. Midt i Vanløses rolige forstadsmiljø fungerer Vanløse Station også som en travl omstigningsstation mellem metro og S-tog og skaber med sine hyppige afgange hurtige forbindelser til det centrale København. Stiger du af i Vanløse, kan du blandt andet tage en slentretur på Vanløse Torv, se teater eller høre koncert på Vanløse Kulturstation, eller shoppe i Vanløses indkøbscenter Kronen, som du let kommer til via den direkte adgang i den østlige ende af metroperronen.'
    ),
    (
    'Flintholm',
    '',
    ''
    ),
    (
    'Lindevang',
    '',
    ''
    ),
    (
    'Fasanvej',
    '',
    ''
    ),
    (
    'Frederiksberg',
    '',
    ''
    ),
    (
    'Forum',
    '',
    ''
    ),
    (
    'Nørreport',
    '',
    ''
    ),
    (
    'Kongens Nytorv',
    '',
    ''
    ),
    (
    'Christianshavn',
    '',
    ''
    ),
    (
    'Amagerbro',
    '',
    ''
    ),
    (
    'Lergravsparken',
    '',
    ''
    ),
    (
    'Øresund',
    '',
    ''
    ),
    (
    'Amager Strand',
    '',
    ''
    ),
    (
    'Femøren',
    '',
    ''
    ),
    (
    'Kastrup',
    '',
    ''
    ),
    (
    'Københavns Lufthavn',
    '',
    ''
    ),
    (
    'Islands Brygge',
    '',
    ''
    ),
    (
    'DR Byen',
    '',
    ''
    ),
    (
    'Sundby',
    '',
    ''
    ),
    (
    'Bella Center',
    '',
    ''
    ),
    (
    'Ørestad',
    '',
    ''
    ),
    (
    'Vestamager',
    '',
    ''
    )
;



-- Insert stations on the M3 line
INSERT INTO Station
    (Name, Slogan, QuickFacts)
VALUES
    (
    'Frederiksberg Allé',
    'Frederiksberg Allé - en lille smag af Paris',
    'Fra Frederiksberg Have til Vesterbrogade strækker den lange allé af store lindetræer sig. Mellem træerne finder du hyggelige cafeer og kvalitetsbutikker som Frederiksberg Chokolade eller det nybyggede Madhuset, som placerer sig lige over selve metrostationen.'
    ),
    (
    'Frederiksberg (M3)',
    'Frederiksberg - metroens vestlige knudepunkt',
    'Lige ved siden af Frederiksberg Centeret findes der allerede en metrostation, der indgår som en del af metrolinjerne M1 og M2. Med Cityringens åbning får Frederiksberg endnu en station, som nu forbinder de eksisterende metrolinjer med Cityringen. Frederiksberg er et af de fem knudepunkter på Cityringen, der optræder som "via-station", og som angiver kørselsretningen.'
    ),
    (
    'Aksel Møllers Have',
    'Aksel Møllers Have - caféliv og svømmeture',
    'Tager du Metroen til Aksel Møllers Have, tager rulletrapperne dig hele vejen til det frederiksbergske café- og butiksliv, der udspiller sig på Godthåbsvej, som løber forbi stationen. Aksel Møllers Have er en af Frederiksbergs grønne byoaser, og stationen ligger få minutters gang fra både Frederiksberg Svømmehal, Frederiksberg Hospital og Frederiksberg Campus.'
    ),
    (
    'Nuuks Plads',
    'Nuuks Plads - et nyt byrum nær Nørrebroparken',
    'Metrostationen ligger på Jagtvej nær Rantzausgade, lige ved det gamle Landsarkiv. En kort gåtur fra stationen ligger Nørrebroparken, hvor der er en stor legeplads, fodboldbaner og Stefansgade pulserende cafémiljø løbende langs parken.'
    ),
    (
    'Nørrebros Runddel',
    'Nørrebros Runddel - direkte til byens mest levende kirkegård',
    'Metrostationen ligger lige ved Nørrebrogade og i det ene hjørne af Assistens Kirkegård. Her kan du enten begive dig ud i Nørrebros gader, eller du kan slentre en tur på den historiske kirkegård, hvor kendtes grave ligger side om side med solbadende nørrebroere.'
    ),
    (
    'Nørrebro',
    'Nørrebro station - multikulturelt trafikknudepunkt',
    'På grænsen mellem Nørrebro og Nordvest finder du Nørrebro Station, som indtil 2019 har fungeret som S-togstation, men som nu har fået selskab af en underjordisk metrostation. Stationen ligger lige i nærheden af Den Røde Plads, hvor Nørrebros lokale står på skateboard, spiller musik, afholder loppemarkeder og meget mere. Nørrebro er et af de fem knudepunkter på Cityringen, der optræder som "via-station", og som angiver kørselsretningen.'
    ),
    (
    'Skjolds Plads',
    'Skjolds Plads - smutvejen til videnskab, professionshøjskole og kultur',
    'Mange studerende vil få glæde af stationen på Skjolds Plads. Både Københavns Professionshøjskole og KU\'s Science Park ligger tæt på stationen. Få minutters gang fra stationen finder du det aktive kulturhus Osramhuset, mens du også kan komme hurtigt hen til den hyggelige Balders Plads, hvor der ofte afholdes loppemarkeder og jazz-koncerter.'
    ),
    (
    'Vibenshus Runddel',
    'Vibenshus Runddel - en smutvej til en aktiv livsstil',
    'Stationen er nabo til en af Københavns største parker, Fælledparken, der med sine store, grønne områder danner rammen for et idrætsengageret, farverigt lokalmiljø. Mange løbeglade københavnere jogger rundt i Fælledparken, som også huser flere fodboldbaner og et udendørs træningsanlæg samt det store fodboldstadion, Telia Parken, hvor F.C. København har hjemmebane.'
    ),
    (
    'Poul Henningsens Plads',
    'Poul Henningsens Plads - Østre Gasværk Teater og et hav af spisesteder',
    'Stationen ved Poul Henningsens Plads ligger midt på Østerbro og er placeret midt mellem store, lokale omdrejningspunkter som Svanemøllehallen, Østre Gasværk Teater, Idrætshuset og Østerbro Stadion.'
    ),
    (
    'Trianglen',
    'Trianglen - røde og hvide faner og et anderledes museum',
    'F.C. København spiller kampe i den nærliggende Telia Parken, og 1. maj svajer røde faner, når Arbejdernes Internationale Kampdag afholdes i Fælledparken. Lige ved siden af stationen ligger ENIGMA, det tidligere post og telegrafmuseum, der har en helt særlig tilgang til næsten at være et museum.'
    ),
    (
    'Østerport',
    'Østerport - et knudepunkt med smukke historiske  og grønne oplevelser',
    'Metrostationen ligger på Oslo Plads, som placerer sig uhyre tæt på Østre Anlægs nordlige ende. Stationen befinder sig inden for få minutters gang til smukke københavnske steder som det gamle fæstningsanlæg Kastellet eller de gule militærboligkvarter Nyboder, hvor du støder på maleriske vejnavne som f.eks. "Krokodillegade". Østerport er et af de fem knudepunkter på Cityringen, der optræder som "via-station", og som angiver kørselsretningen'
    ),
    (
    'Marmorkirken',
    'Marmorkirken - gud, konge og kropsdele',
    'Metrostationen Marmorkirken ligger ikke blot ved siden af den smukke gamle kirke – den placerer sig også i midten af et Københavns ældste kvarterer, hvor store københavnske seværdigheder som Amalienborg Slotsplads, Langelinie og Kongens Have ligger inden for få minutters gang. Derudover byder området også på en række museer, deriblandt Designmuseum Danmark, Davids Samling, Amalienborgmuseet og Medicinsk Museion.'
    ),
    (
    'Kongens Nytorv (M3)',
    'Kongens Nytorv - Det Kongelige Teater, Charlottenborg og Magasin',
    'I midten af Kongens Nytorv mellem prominente seværdigheder som Nyhavn, Det Kongelige Teater og Magasin står statuen af Christian d. 5. til hest, og 20 meter under Rytterstatuen kører Cityringen forbi. Den nye metrostation på Kongens Nytorv forbinder de eksisterende metrolinjer M1 og M2 med Cityringen, og stationerne er forbundet af en gangtunnel, så du hurtigt kan skifte mellem de forskellige linjer.  Kongens Nytorv er et af de fem knudepunkter på Cityringen, der optræder som "via-station", og som angiver kørselsretningen.'
    ),
    (
    'Gammel Strand',
    'Gammel Strand - med \'Fiskerkonen\' til forbrugsfest og folkestyre',
    'Skråt over for metrostationen på Gammel Strand ligger Christiansborg, hvor det danske Folketing udøver folkets vilje. Gammel Strand er en gammel havnepromenade, hvor velbesøgte restauranter, cocktailbarer og caféer ligger side om side. Tidligere lå her et fiskemarked, og statuen "Fiskerkonen" af Charles Svejstrup Madsen fra 1939 er rejst som en hyldest til netop dette. Området omkring Gammel Strand bærer også præg af Københavns kommercielle hovedpulsåre Strøget, der også løber forbi den nærliggende Højbro Plads.'
    ),
    (
    'Rådhuspladsen',
    'Rådhuspladsen - byens midtpunkt i neonlysets skær',
    'Tag Metroen direkte til en af Københavns største og mest centrale pladser. Stationen befinder sig naturligvis lige ved siden af Københavns Rådhus, som også er dér, hvor Strøget begynder med butikker så langt øjet rækker. Rådhuspladsen er også samlingsstedet, når store danske sportspræstationer skal hyldes, og når danskerne samles for at skyde nytåret ind ved midnat.'
    ),
    (
    'København H',
    'København H - et kontrastfyldt knudepunkt',
    'Metrostationen ligger kun få minutters gang fra store attraktioner som Tivoli og Ny Carlsberg Glyptotek. Tæt på stationen finder du også en af Vesterbros hovedpulsårer, Istedgade, blandt andet kendetegnet ved et farverigt natteliv, hvor vinbarer og restauranter blander sig med pushere og prostituerede. I samme område finder du også det populære madmekka, Kødbyen, hvor gamle industrihaller i dag bruges som hippe restauranter og natklubber. København H er et af de fem knudepunkter på Cityringen, der optræder som "via-station", og som angiver kørselsretningen.'
    ),
    (
    'Enghave Plads',
    'Enghave Plads - Vesterbros hjerte',
    'For enden af Istedgade ligger Enghave Plads som en smørklat mellem cafeer, barer, restauranter og specialbutikker. Lige ved siden af metrostationen ligger det grønne åndehul med bemandet legeplads, Enghave Park, og spillestedet VEGA, og et par minutters gang derfra skyder det nybyggede Carlsberg Byen op.'
    )
;



-- Insert rows in join table, linking lines to stations
INSERT INTO LineStation
    (Line, StationID)
VALUES
    (
    'M1',
    1
    ),
    (
    'M2',
    1
    ),
    (
    'M1',
    2
    ),
    (
    'M2',
    2
    ),
    (
    'M1',
    3
    ),
    (
    'M2',
    3
    ),
    (
    'M1',
    4
    ),
    (
    'M2',
    4
    ),
    (
    'M1',
    5
    ),
    (
    'M2',
    5
    ),
    (
    'M1',
    6
    ),
    (
    'M2',
    6
    ),
    (
    'M1',
    7
    ),
    (
    'M2',
    7
    ),
    (
    'M1',
    8
    ),
    (
    'M2',
    8
    ),
    (
    'M1',
    9
    ),
    (
    'M2',
    9
    ),
    (
    'M1',
    17
    ),
    (
    'M1',
    18
    ),
    (
    'M1',
    19
    ),
    (
    'M1',
    20
    ),
    (
    'M1',
    21
    ),
    (
    'M1',
    22
    ),
    (
    'M2',
    10
    ),
    (
    'M2',
    11
    ),
    (
    'M2',
    12
    ),
    (
    'M2',
    13
    ),
    (
    'M2',
    14
    ),
    (
    'M2',
    15
    ),
    (
    'M2',
    16
    ),
    (
    'M3',
    23
    ),
    (
    'M3',
    24
    ),
    (
    'M3',
    25
    ),
    (
    'M3',
    26
    ),
    (
    'M3',
    27
    ),
    (
    'M3',
    28
    ),
    (
    'M3',
    29
    ),
    (
    'M3',
    30
    ),
    (
    'M3',
    31
    ),
    (
    'M3',
    32
    ),
    (
    'M3',
    33
    ),
    (
    'M3',
    34
    ),
    (
    'M3',
    35
    ),
    (
    'M3',
    36
    ),
    (
    'M3',
    37
    ),
    (
    'M3',
    38
    ),
    (
    'M3',
    39
    )
;
