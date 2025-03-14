with cte as(
    select 
        Rank = ROW_NUMBER() OVER (ORDER BY TotalPoints DESC),
        RankOverall = Rank,
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
    from{{ ref('view_playerstats_regularseason2425') }}
    where Position = 'C' or Position like '%C%'
)

select * from cte