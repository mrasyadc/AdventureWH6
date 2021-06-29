CREATE OR ALTER FUNCTION getUmur(@birthDate date, @nowDate date)
RETURNS int
AS
BEGIN
RETURN (CONVERT(int,CONVERT(char(8),@nowDate,112))-CONVERT(char(8),@birthDate,112))/10000
END