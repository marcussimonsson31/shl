with cte as(
SELECT 
    Player = CASE 
                WHEN CHARINDEX('(', Player) > 0 
                THEN LEFT(Player, CHARINDEX('(', Player) - 1) 
                ELSE Player 
             END,
    Position = CASE 
                WHEN CHARINDEX('(', Player) > 0 AND CHARINDEX(')', Player) > CHARINDEX('(', Player) 
                THEN SUBSTRING(Player, CHARINDEX('(', Player) + 1, CHARINDEX(')', Player) - CHARINDEX('(', Player) - 1)
                ELSE NULL 
               END,
    Team,
    GamesPlayed = CAST(GamesPlayed as int),
    Goals = CAST(Goals as int),
    Assists = CAST(Assists as int),
    TotalPoints = CAST(TotalPoints as int),
    PPG,
    PIM = CAST(PIM as int),
    PlusMinus = CAST(PlusMinus as int)
FROM {{source ('shldb', 'playerstats_regularseason2425')}}
), cte2 as (
select 
    Rank =  ROW_NUMBER() OVER (ORDER BY TotalPoints DESC),
    Player,
    Position,
    Team,
    GamesPlayed,
    Goals,
    Assists,
    TotalPoints,
    PPG,
    PIM,
    PlusMinus
from cte
where len(Player) > 1
)

select *
from cte2
