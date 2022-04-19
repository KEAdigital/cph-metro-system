USE MetroSystemCPH;
SELECT 
    CONCAT(Name, ': ', Stretch) AS 'Linjeoversigt'
FROM
    line
WHERE
    Name = 'M2'
UNION SELECT '--------------------------------------------------'
UNION SELECT
    Name
FROM
    linestation,
    station
WHERE
    StationID = station.ID AND Line = 'M2';