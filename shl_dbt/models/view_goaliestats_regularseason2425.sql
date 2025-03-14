with cte as(
	select 
		Player,
		Team,
		GamesPlayed = CAST(ROUND(GamesPlayed, 0) AS INT),
		GAA,
		SVProcent,
		Wins = CAST(Wins as int),
		Losses = CAST(Losses as int),
		Ties = CAST(Ties as int),
		Shootouts = CAST(ShootOuts as int),
		TOI,
		SVS,
		GoalAgainst = CAST(GoalAgainst as int)
	from {{source ('shldb', 'goaliestats_regularseason2425')}}
),cte2 as (
	select 
		Player,
		Team,
		GamesPlayed,
		GAA,
		SVProcent,
		Wins,
		Losses,
		Ties,
		Shootouts,
		TOI,
		SVS,
		GoalAgainst
	from cte
	where len(Player) > 1
		and len(Team) > 1
)
select * 
from cte2


