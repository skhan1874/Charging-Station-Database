SELECT sname, count(c.cid) AS number_of_chargers
FROM charger c, charging_station cs, charger_type ct
WHERE cs.sid = c.sid
AND ct.ctid = c.ctid
AND c.status = 1
GROUP BY cs.sname;
