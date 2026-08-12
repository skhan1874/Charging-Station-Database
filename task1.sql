SELECT sname, saddress
FROM charging_station cs, charger_type ct, charger c
WHERE cs.sid = c.sid
AND ct.ctid = c.ctid
AND ct.ctname = 'Tesla supercharger';
