ALTER TABLE station DROP COLUMN ListOfFacts;
ALTER TABLE station ADD COLUMN Latitude decimal(7,5);
ALTER TABLE station ADD COLUMN Longitude decimal(7,5);