UPDATE charger 
SET status = 0
WHERE sid = (SELECT sid FROM charging_station WHERE sname = 'Miller Library');


