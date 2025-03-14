with cte as(
    select 
        cast(Date as date) as Date,
        HomeTeam,
        AwayTeam,
        Result = HomeGoals + ' - ' + AwayGoals,
        Reg_OT,
        Period,
        Venue,
        Spectators

    from {{source ('shldb', 'gamestats_regularseason2425')}}
)

select 
    * 
from cte t1
