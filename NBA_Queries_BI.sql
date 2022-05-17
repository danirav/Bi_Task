select 
case when PTS >15 and MP >22 then 'Important' else 'Less important' end as player_value,
avg(Age) as avg_age,
count(*) as num_of_players
from dbase.fact
group by 1 
order by 2;


select case when Age>25 then 'Adults' else 'Young' end as Age_group,
avg(MP) as avg_minutes_per_player,
avg(PTS) as avg_points_per_player
from dbase.fact 
group by Age_group 
order by avg_points_per_player desc;

select Age,
MP,
PTS,
avg(FG%) over(partition by Age)
from dbase.fact 
order by PTS desc;

select Age,
PTS,
count(*) over(partition by PTS) as num_of_players,
avg(MP) over (partition by PTS)as avg_minutes_per_player
from dbase.fact
group by 1,2;

select MP,
PTS,
Age,
FG%,
ratio_to_report(PTS) over(partition by Age) as PTS%
from dbase.fact
order by Age;

select 
MP,
avg(age),
avg(PTS) as avg_points_per_minutes
from dbase.fact
group by MP
order by 3; 


