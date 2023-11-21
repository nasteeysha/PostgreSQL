(select pizzeria.name, count(*) as "count", 'visits' as action_type
 from person_visits inner join pizzeria on pizzeria.id = person_visits.pizzeria_id
 group by pizzeria.name
 order by 2 desc
 limit 3)
union
(select pizzeria.name, count(*) as "count", 'order' as action_type
 from person_order inner join menu on person_order.menu_id = menu.id
 inner join pizzeria on menu.pizzeria_id = pizzeria.id
 group by pizzeria.name
 order by 2 desc
 limit 3)
order by 3,2 desc