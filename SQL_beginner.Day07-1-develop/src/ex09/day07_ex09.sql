with max as (select address,
                    max(age) as age_max
             from person
             group by 1),
     min as (select address,
                    min(age) as age_min
             from person
             group by 1),
     avg as (select address,
                    avg(age) as age_avg
             from person
             group by 1)
select distinct address,
                round(age_max - age_min / cast(age_max as numeric ), 2)   as formula,
                round(age_avg, 2)                                        as average,
                (age_max - age_min / cast(age_max as numeric )) > age_avg as comparison
from person
         natural join max
         natural join min
         natural join avg
order by 1;