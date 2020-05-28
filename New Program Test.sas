/* Testing branches */
proc sql;
CREATE TABLE NEW AS
SELECT * 
FROM FINAL
WHERE LOB = "WC";
QUIT;