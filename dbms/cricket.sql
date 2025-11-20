-- 2. CREATE TABLES
CREATE TABLE Formats (
format_id INT IDENTITY(1,1) PRIMARY KEY,
format_name VARCHAR(20) NOT NULL UNIQUE,
overs_per_innings INT,
descripƟon VARCHAR(200)
);
GO

CREATE TABLE Players (
player_id INT IDENTITY(1,1) PRIMARY KEY,
player_name VARCHAR(100) NOT NULL,
country VARCHAR(50) NOT NULL,
date_of_birth DATE,
role VARCHAR(50) NOT NULL,
baƫng_style VARCHAR(50),
bowling_style VARCHAR(50),
debut_year INT,

CONSTRAINT CHK_PlayerRole CHECK (role IN
('Batsman', 'Bowler', 'All-rounder', 'Wicket-keeper')
)
);
GO

CREATE TABLE Baƫng_StaƟsƟcs (
baƫng_staƟsƟcs_id INT IDENTITY(1,1) PRIMARY KEY,
player_id INT NOT NULL,
format_id INT NOT NULL,
innings INT DEFAULT 0,
runs_scored INT DEFAULT 0,
centuries INT DEFAULT 0,
baƫng_average DECIMAL(6, 2),
strike_rate DECIMAL(6, 2),

FOREIGN KEY (player_id) REFERENCES Players(player_id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (format_id) REFERENCES Formats(format_id)
ON DELETE NO ACTION ON UPDATE NO ACTION,

UNIQUE(player_id, format_id)
);
GO

CREATE TABLE Bowling_StaƟsƟcs (
bowling_staƟsƟcs_id INT IDENTITY(1,1) PRIMARY KEY,
player_id INT NOT NULL,
format_id INT NOT NULL,
matches_played INT DEFAULT 0,
wickets_taken INT DEFAULT 0,
best_bowling VARCHAR(10),
five_wicket_hauls INT DEFAULT 0,
economy_rate DECIMAL(5, 2),
FOREIGN KEY (player_id) REFERENCES Players(player_id)
ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (format_id) REFERENCES Formats(format_id)
ON DELETE NO ACTION ON UPDATE NO ACTION,
UNIQUE(player_id, format_id)
);
GO

-- 3. POPULATE DATA
INSERT INTO Formats (format_name, overs_per_innings, descripƟon) VALUES
('Test', NULL, 'MulƟ-day format with unlimited overs'),
('ODI', 50, 'One Day InternaƟonal - 50 overs per side'),
('T20', 20, 'Twenty20 - 20 overs per side'),
('T10', 10, 'Ten10 - 10 overs per side'),
('The Hundred', NULL, '100 balls per side format'),
('List A', 50, 'Limited overs domesƟc cricket'),
('First Class', NULL, 'MulƟ-day domesƟc cricket format');
GO

INSERT INTO Players (player_name, country, date_of_birth, role, baƫng_style, bowling_style, debut_year) VALUES
('Virat Kohli', 'India', '1988-11-05', 'Batsman', 'Right-hand bat', 'Right-arm medium', 2008),
('Jasprit Bumrah', 'India', '1993-12-06', 'Bowler', 'Right-hand bat', 'Right-arm fast', 2016),
('Steve Smith', 'Australia', '1989-06-02', 'Batsman', 'Right-hand bat', 'Leg break', 2010),
('Pat Cummins', 'Australia', '1993-05-08', 'All-rounder', 'Right-hand bat', 'Right-arm fast', 2011),
('Joe Root', 'England', '1990-12-30', 'Batsman', 'Right-hand bat', 'Right-arm off break', 2012),
('Shaheen Afridi', 'Pakistan', '2000-04-06', 'Bowler', 'LeŌ-hand bat', 'LeŌ-arm fast', 2018),
('Babar Azam', 'Pakistan', '1994-10-15', 'Batsman', 'Right-hand bat', 'Right-arm off break', 2015);
GO

INSERT INTO Baƫng_StaƟsƟcs (player_id, format_id, innings, runs_scored, centuries, baƫng_average, strike_rate) VALUES
((SELECT player_id FROM Players WHERE player_name = 'Virat Kohli'), (SELECT format_id FROM Formats WHERE
format_name = 'Test'), 196, 8848, 29, 47.55, 58.07),
((SELECT player_id FROM Players WHERE player_name = 'Virat Kohli'), (SELECT format_id FROM Formats WHERE
format_name = 'ODI'), 283, 13906, 50, 59.18, 93.42),
((SELECT player_id FROM Players WHERE player_name = 'Steve Smith'), (SELECT format_id FROM Formats WHERE
format_name = 'Test'), 196, 9685, 32, 56.97, 54.26),
((SELECT player_id FROM Players WHERE player_name = 'Joe Root'), (SELECT format_id FROM Formats WHERE
format_name = 'Test'), 272, 12377, 34, 50.10, 51.82),
((SELECT player_id FROM Players WHERE player_name = 'Babar Azam'), (SELECT format_id FROM Formats WHERE
format_name = 'ODI'), 125, 5729, 19, 56.72, 89.23),
((SELECT player_id FROM Players WHERE player_name = 'Pat Cummins'), (SELECT format_id FROM Formats WHERE
format_name = 'ODI'), 89, 1747, 1, 29.78, 88.56),
((SELECT player_id FROM Players WHERE player_name = 'Virat Kohli'), (SELECT format_id FROM Formats WHERE
format_name = 'T20'), 117, 4188, 1, 52.73, 138.43);
GO

INSERT INTO Bowling_StaƟsƟcs (player_id, format_id, matches_played, wickets_taken, best_bowling, five_wicket_hauls,
economy_rate) VALUES
((SELECT player_id FROM Players WHERE player_name = 'Jasprit Bumrah'), (SELECT format_id FROM Formats WHERE
format_name = 'Test'), 36, 159, '6/27', 11, 2.42),
((SELECT player_id FROM Players WHERE player_name = 'Jasprit Bumrah'), (SELECT format_id FROM Formats WHERE
format_name = 'ODI'), 89, 149, '6/19', 5, 5.08),
((SELECT player_id FROM Players WHERE player_name = 'Jasprit Bumrah'), (SELECT format_id FROM Formats WHERE
format_name = 'T20'), 70, 89, '3/7', 0, 7.36),
((SELECT player_id FROM Players WHERE player_name = 'Pat Cummins'), (SELECT format_id FROM Formats WHERE
format_name = 'Test'), 60, 269, '6/23', 14, 2.56),
((SELECT player_id FROM Players WHERE player_name = 'Pat Cummins'), (SELECT format_id FROM Formats WHERE
format_name = 'ODI'), 95, 171, '5/70', 2, 5.17),
((SELECT player_id FROM Players WHERE player_name = 'Shaheen Afridi'), (SELECT format_id FROM Formats WHERE
format_name = 'Test'), 31, 122, '6/51', 6, 2.71),
((SELECT player_id FROM Players WHERE player_name = 'Shaheen Afridi'), (SELECT format_id FROM Formats WHERE
format_name = 'ODI'), 57, 97, '6/35', 3, 5.73);
GO

--Queries

--1. Get bowling staƟsƟcs of Pat Cummins in all formats
select *, f.format_id
from Bowling_StaƟsƟcs bo
inner join Formats f
on bo.format_id = f.format_id
where player_id in(
select player_id from Players
where player_name = 'Pat Cummins')


--2. Count how many players belong to each country
select country, count(player_id)
from Players p
group by p.country

--3. Show top 5 highest strike rates in T20 format
select top 5 ba.strike_rate, p.player_name
from Baƫng_StaƟsƟcs ba
inner join Players p
on ba.player_id = p.player_id
where ba.format_id in (select format_id from Formats where format_name = 'T20'  )
ORDER BY strike_rate DESC

select top 5 (bs.strike_rate) 
from Baƫng_StaƟsƟcs bs
join Formats f
on bs.format_id = f.format_id
where f.format_name = 'T20'
order by bs.strike_rate DESC

--4. Show bowlers with economy < 3 in Test format
select p.player_name, bo.economy_rate
from Bowling_StaƟsƟcs bo
inner join Players p
on bo.player_id = p.player_id
where bo.economy_rate < 3 AND bo.format_id = (select format_id from Formats
where format_name = 'Test')

--5. List players who play as All-rounders and have both >1000 runs and >50 wickets
select distinct p.player_name
from Players p
inner join Baƫng_StaƟsƟcs ba
on p.player_id = ba.player_id
inner join Bowling_StaƟsƟcs bo
ON p.player_id = bo.player_id
where p.role = 'All-rounder' and bo.wickets_taken > 50 and ba.runs_scored > 1000


--6. Show average baƫng strike rate for each format

select avg(b.strike_rate)[AvgStrikeRate],f.format_name
from Baƫng_StaƟsƟcs b
inner join
Formats f
on f.format_id = b.format_id
group by f.format_name


--7. List top 3 bowlers with most 5-wicket hauls
select top 3 (p.player_name)
from Bowling_StaƟsƟcs bo
inner join Players p
on p.player_id = bo.player_id
order by bo.five_wicket_hauls desc


--8. Find the youngest player in the database
select top 1(p.player_name)
from Players p
where p.date_of_birth in (select max(p.date_of_birth) from Players p )

--9. Show players who have never scored a century in any format
select p.player_name
from Players p
Left join
Baƫng_StaƟsƟcs b
on p.player_id=b.player_id
where b.centuries is null


--10. Display the player name who has the lowest bowling economy in ODI.
select top 1 (p.player_name)
from Players p
inner join Bowling_StaƟsƟcs bo
on p.player_id = bo.player_id
where format_id in (select format_id from Formats
where format_name = 'ODI')
order by bo.economy_rate asc

--11. Find players from India with their total runs across all formats
select p.player_name, ba.runs_scored , format_name
from Players p
inner join Baƫng_StaƟsƟcs ba
on p.player_id = ba.player_id
inner join Formats f
on f.format_id = ba.format_id
where country = 'India' 

--12. Find the player who has scored the highest runs in ODI format (using subquery).
select Players.player_name
from Players
where player_id in (
select top 1 player_id from Baƫng_StaƟsƟcs 
where format_id in (
select format_id from Formats
where format_name = 'ODI'
) 
order by runs_scored desc
)


--13. List all players whose baƫng average is above the overall average of all players.
select p.player_name
from Players p
inner join Baƫng_StaƟsƟcs ba
on p.player_id = ba.player_id
where ba.baƫng_average > (select avg(baƫng_average) from Baƫng_StaƟsƟcs)


select *
from Players
where player_id in (
select player_id from Baƫng_StaƟsƟcs
where baƫng_average > (
select avg(baƫng_average) from Baƫng_StaƟsƟcs)
)

--14. Find formats where more than 1 player has scored 5000+ runs.
select f.format_name 
from Baƫng_StaƟsƟcs b
inner join
Formats f
on b.format_id = f.format_id
where b.runs_scored > 5000
group by f.format_name
having count(b.player_id) > 1

--15. Show players who have NEVER scored a century in ANY format (only subqueries). 
select * from Players
where player_id not in 
(select player_id from Baƫng_StaƟsƟcs
where centuries > 0)