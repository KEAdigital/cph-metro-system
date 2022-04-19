UPDATE linestation 
SET 
    StationID = 5
WHERE
    StationID = 24;

UPDATE linestation 
SET 
    StationID = 8
WHERE
    StationID = 35;

DELETE FROM station 
WHERE
    ID IN (24 , 35);