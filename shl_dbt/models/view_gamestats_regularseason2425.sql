with cte as(
    select 
        cast(Date as date) as Date,
        case 
            when HomeTeam = 'BrynäsBIF' then 'Brynäs IF'
            when HomeTeam = 'FärjestadFBK' then 'Färjestad BK'
            when HomeTeam = 'FrölundaFHC' then 'Frölunda HC'
            when HomeTeam = 'HV71HV71' then 'HV71'
            when HomeTeam = 'LeksandLIF' then 'Leksands IF'
            when HomeTeam = 'LinköpingLHC' then 'Linköping HC'
            when HomeTeam = 'LuleåLHF' then 'Luleå HF'
            when HomeTeam = 'MalmöMIF' then 'Malmö Redhawks'
            when HomeTeam = 'MoDoMoDo' then 'MoDo Hockey'
            when HomeTeam = 'ÖrebroÖRE' then 'Örebro HK'
            when HomeTeam = 'RögleRBK' then 'Rögle BK'
            when HomeTeam = 'SkellefteåSKE' then 'Skellefteå AIK'
            when HomeTeam = 'TimråTIK' then 'Timrå IK'
            when HomeTeam = 'VäxjöVLH' then 'Växjö Lakers HC'
        end as HomeTeam,
        case 
            when AwayTeam = 'BrynäsBIF' then 'Brynäs IF'
            when AwayTeam = 'FärjestadFBK' then 'Färjestad BK'
            when AwayTeam = 'FrölundaFHC' then 'Frölunda HC'
            when AwayTeam = 'HV71HV71' then 'HV71'
            when AwayTeam = 'LeksandLIF' then 'Leksands IF'
            when AwayTeam = 'LinköpingLHC' then 'Linköping HC'
            when AwayTeam = 'LuleåLHF' then 'Luleå HF'
            when AwayTeam = 'MalmöMIF' then 'Malmö Redhawks'
            when AwayTeam = 'MoDoMoDo' then 'MoDo Hockey'
            when AwayTeam = 'ÖrebroÖRE' then 'Örebro HK'
            when AwayTeam = 'RögleRBK' then 'Rögle BK'
            when AwayTeam = 'SkellefteåSKE' then 'Skellefteå AIK'
            when AwayTeam = 'TimråTIK' then 'Timrå IK'
            when AwayTeam = 'VäxjöVLH' then 'Växjö Lakers HC'
        end as AwayTeam,
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
