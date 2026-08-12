SELECT runame
FROM ruser r, check_in ci
WHERE r.ruid = ci.ruid
GROUP BY runame
HAVING count(*) >= 2;
