select person_id, count(*) as "count_visits"
from person_visits
group by person_id
order by 2 desc, 1 asc