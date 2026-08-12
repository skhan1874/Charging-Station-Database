CREATE TABLE ruser (
ruid int,
runame varchar(30),
ruemail varchar(30),
primary key (ruid)
);
INSERT INTO ruser VALUES(1223, 'Saif', 'skhan18@umbc.edu');
INSERT INTO ruser VALUES(4344, 'Alex', 'aw12@umbc.edu');
INSERT INTO user VALUES(9183, 'Sean', 'sc45@umbc.edu');

CREATE TABLE charging_station (
sid int,
sname varchar(30),
saddress varchar(30),
szip int,
primary key (sid)
);
INSERT INTO charging_station VALUES(888, 'bills station', '2nd street', 20381);
INSERT INTO charging_station VALUES(777, 'ravens station', '3rd street', 20281);
INSERT INTO charging_station VALUES(222, 'jets station', '4th street', 20866);


CREATE TABLE charger_type (
ctid int,
ctname varchar,
charger_level int, 
output int,
primary key (ctid)
);
INSERT INTO charger_type VALUES(198, 'charger M', 1, 1.2);
INSERT INTO charger_type VALUES(123, 'charger Q', 3, 7.2);
INSERT INTO charger_type VALUES(927, 'charger T', 2, 3.4);

CREATE TABLE ev_model (
mid int,
mname varchar(30),
ctid int,
model_charger_type int,
primary key (mid),
foreign key (ctid) references charger_type(ctid)
);
INSERT INTO ev_model VALUES(234, 'model w', 198, 5);
INSERT INTO ev_model VALUES(663, 'model u', 123, 8);
INSERT INTO ev_model VALUES(023, 'model z', 927, 2);


CREATE TABLE charger (
cid int,
ctid int,
sid int,
status int CHECK (status IN(0,1,2)), 
primary key (cid),
foreign key (ctid) references charger_type(ctid),
foreign key (sid) references charging_station(sid)
);
INSERT INTO charger VALUES(1996, 198, 888, 0);
INSERT INTO charger VALUES(1993, 123, 777, 2);
INSERT INTO charger VALUES(2001, 927, 222, 1);

CREATE TABLE check_in (
    ckid INT,
    ruid INT,
    sid INT,
    ckdate DATE,
    review_score INT 
    CHECK (review_score IN (1, 2, 3, 4, 5)),
    rcomment VARCHAR(300),
    PRIMARY KEY (ckid),  
    FOREIGN KEY (sid) REFERENCES charging_station(sid),
    FOREIGN KEY (ruid) REFERENCES ruser(ruid)
);

INSERT INTO check_in VALUES(89, 1223, 888, TO_DATE('2023-01-23'), 4, 'Great service');
INSERT INTO check_in VALUES(54, 4344, 777, TO_DATE('2023-08-09), 2, 'Poor service');
INSERT INTO check_in VALUES(37, 9183, 222, TO_DATE('2023-03-09'), 3, 'Improvement needed');
