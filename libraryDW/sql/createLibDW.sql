
create table libdata
(bibno int,
 title varchar(200), 
 material varchar(30), 
 lang char(3),
 place varchar(40), 
 copyno char(8), 
 copyloc char(3),
 bid int, 
 bname varchar(60),
 sex char(1), 
 depcode int, 
 depname varchar(30), 
 lid int,
 loandate date
 );


CREATE TABLE Members 
( 
  bid INT PRIMARY KEY,
  bname VARCHAR(60),
  sex CHAR(1),
  depcode INT,
  depname VARCHAR(30)
);

CREATE TABLE Books
( 
  bibno INT PRIMARY KEY, 
  title VARCHAR(200),
  material VARCHAR(30),
  lang CHAR(3),
  place VARCHAR(40)
);

CREATE TABLE Copy 
( 
  copyno CHAR(8) PRIMARY KEY,
  copyloc CHAR(3)
);

CREATE TABLE Dates
( 
  loandate DATE PRIMARY KEY,
  [year] INT, 
  [month] INT, 
  [quarter] INT,
  weekDayWeekend VARCHAR(10)
);

CREATE TABLE Loans
( 
  lid INT PRIMARY KEY, 
  loandate DATE FOREIGN KEY REFERENCES Dates(loandate), 
  bid INT FOREIGN KEY REFERENCES Members(bid), 
  bibno INT FOREIGN KEY REFERENCES Books(bibno), 
  copyno CHAR(8) FOREIGN KEY REFERENCES Copy(copyno)
);

INSERT INTO Members (bid, bname, sex, depcode, depname)
SELECT DISTINCT
  bid, bname, sex, depcode, depname
FROM libdata
WHERE bid IS NOT NULL;


INSERT INTO Books (bibno, title, material, lang, place)
SELECT DISTINCT
  bibno, title, material, lang, place
FROM libdata
WHERE bibno IS NOT NULL;


INSERT INTO Copy (copyno, copyloc)
SELECT DISTINCT
  copyno, copyloc
FROM libdata
WHERE copyno IS NOT NULL;


INSERT INTO Dates (loandate, [year], [month], [quarter], weekDayWeekend)
SELECT DISTINCT
  loandate,
  YEAR(loandate),
  MONTH(loandate),
  DATEPART(QUARTER, loandate),
  CASE
    WHEN DATENAME(WEEKDAY, loandate) IN ('Saturday','Sunday','Σάββατο','Κυριακή')
      THEN 'Weekend' ELSE 'Weekday'
  END
FROM libdata
WHERE loandate IS NOT NULL;


INSERT INTO Loans (lid, loandate, bid, bibno, copyno)
SELECT
  lid, loandate, bid, bibno, copyno
FROM libdata
WHERE lid IS NOT NULL
  AND loandate IS NOT NULL
  AND bid IS NOT NULL
  AND bibno IS NOT NULL
  AND copyno IS NOT NULL;
