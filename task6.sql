SET serveroutput on;
CREATE OR REPLACE FUNCTION count_available_chargers(p_station_id NUMBER)
RETURN NUMBER
IS
total_number_chargers INTEGER;
total_available_chargers INTEGER;
BEGIN
SELECT COUNT(*) INTO total_number_chargers
FROM charger
WHERE sid = p_station_id;
IF total_number_chargers = 0 THEN
RETURN -1;
END IF;
SELECT COUNT(*) INTO total_available_chargers
FROM charger
WHERE sid = p_station_id
AND status = 1;
RETURN total_available_chargers;
END;
/
SET SERVEROUTPUT ON;
DECLARE 
valid_station_id NUMBER;
invalid_station_id NUMBER;
v_result NUMBER;
BEGIN
v_result := count_available_chargers(1);
IF v_result = -1 THEN 
dbms_output.put_line('Invalid Station ID');
ELSE dbms_output.put_line('Results' || v_result);
END IF; 
v_result := count_available_chargers(1);
IF v_result = -1 THEN
dbms_output.put_line('inalid Station ID:');
ELSE dbms_output.put_line ('Results' || v_result);
END IF;
END;
/
