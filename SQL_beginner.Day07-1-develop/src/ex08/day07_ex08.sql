select address, pizzeria.name, count(*)
from person_order inner join menu m on person_order.menu_id = m.id
inner join pizzeria on m.pizzeria_id = pizzeria.id
inner join person on person.id = person_order.person_id
group by address, pizzeria.name
order by 1,2