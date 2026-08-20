CREATE OR REPLACE PROCEDURE find_charger_station(p_model_name VARCHAR2) IS
v_model NUMBER;
BEGIN
SELECT COUNT(*)
INTO v_model
FROM ev_model
WHERE mname = p_model_name;
IF v_model = 0 THEN
dbms_output.put_line('Invalid Model');
RETURN;
END IF;

FOR rec IN (
SELECT cs.sname, cs.saddress, AVG(ci.review_score) AS avg_review_score
FROM charging_station cs, charger c, charger_type ct, model_charger_type mct, check_in ci
WHERE cs.sid = c.sid
AND c.ctid = ct.ctid
AND c.status = 1
AND ct.ctid = mct.ctid
AND cs.sid = ci.sid (+)
AND mct.mid = (SELECT mid FROM ev_model WHERE mname = p_model_name)
GROUP BY cs.sname, cs.saddress
)
LOOP
dbms_output.put_line('Charging Station: ' || rec.sname);
dbms_output.put_line('Address: ' || rec.saddress);
dbms_output.put_line('Average Score: ' || NVL(TO_CHAR(rec.avg_review_score), 'No reviews yet'));
END LOOP;
END;
/
SET SERVEROUTPUT ON;
EXEC find_charger_station('Invalid Model Name');
EXEC find_charger_station('Tesla Model Y');
