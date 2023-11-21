select action_date, person.name
from (select order_date as action_date, person_id from person_order intersect all
                                                                    select visit_date,person_id from person_visits) as r1
inner join person on r1.person_id = person.id
order by 1,2 desc