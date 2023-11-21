select person.name, count(*) as "count_visit"
from person_visits inner join person on person.id = person_visits.person_id
group by person.name
having count(*) > 3