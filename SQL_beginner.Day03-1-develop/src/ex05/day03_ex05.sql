select p2.name
from person_visits inner join person p on p.id = person_visits.person_id
inner join pizzeria p2 on p2.id = person_visits.pizzeria_id
where p.name = 'Andrey'
except
select p2.name
from person_order inner join person p on p.id = person_order.person_id
inner join menu m on m.id = person_order.menu_id
inner join pizzeria p2 on p2.id = m.pizzeria_id
where p.name = 'Andrey'
order by 1