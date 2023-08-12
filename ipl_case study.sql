create database ipl_case;
use ipl_case;

select * from 2018_batsmen; 
select * from 2019_batsmen; 
select * from 2018_bowlers;
select * from 2019_bowlers;  

/*1. Which bowler took the most wickets in the 2018 season?*/

SELECT Player, Wkts
FROM 2018_bowlers
ORDER BY wkts DESC
LIMIT 1;

/*2. Which batsmen scored the most runs in the 2018 season while maintaining an average strike rate of at least 130?*/
SELECT Player, `S/R` Runs
FROM 2018_batsmen
where `S/R` >= 130
ORDER BY Runs DESC
LIMIT 1;

/*3. Which bowlers took the most wickets in the 2018 season while maintaining an economy rate of less than 7 runs per over?*/

SELECT Player, wkts
FROM 2018_bowlers
where `E/R` < 7
ORDER BY wkts DESC
LIMIT 1;

/*4. Which batsmen scored the most runs across both 2018 and 2019 seasons?*/
select b1.player, greatest(b1.runs , b2.runs) as Max_run
from 2019_batsmen b1 inner join 2018_batsmen b2 using(player)
limit 1;

/*5. Which batsmen has hit the maximum number of boundaries in 2018, combining 4s and 6s?*/
SELECT Player, (4s+6s) as total_bound
FROM 2018_batsmen
ORDER BY total_bound DESC
LIMIT 1;

/*6. Name the bowlers who have got 4 wickets haul in 2019.*/

select player, 4w
from 2019_bowlers
where 4w >0;

/*7. Name 5 such bowlers who bowled the least number of overs in 2018.*/
select player, Overs
from 2018_bowlers
order by overs asc
limit 5;

/*8. Which team scored the maximum number of runs in 2019?*/

SELECT team, sum(runs) as highest_run
FROM 2019_batsmen
group by team
ORDER BY highest_run DESC
LIMIT 1;

/*9. Name the Batsmen who has hit maximum half centuries, both the years combined*/

select b1.player, (b1.`50s`+ b2.`50s`) as half_centuries
from 2019_batsmen b1 inner join 2018_batsmen b2 using(player)
order by half_centuries desc
limit 1;

