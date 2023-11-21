with d as (select d::date from generate_series('2022-01-01', '2022-01-10', interval '1 day') as d)
select d::date as missing_date
from(select * from person_visits po where person_id in (1,2)) as po right join d as d on po.visit_date =d
where po.id is null
order by 1