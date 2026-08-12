SELECT runame 
FROM ruser r, check_in ci
WHERE r.ruid = ci.ruid
AND ci.sid IN (
SELECT sid 
FROM check_in 
WHERE ruid = (SELECT ruid FROM ruser r WHERE runame = 'Ella')
) AND r.runame != 'Ella';
