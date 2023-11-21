select pizza_name, price, p.name
from (select id as menu_id from menu
except
select menu_id from person_order) as t1 inner join menu on t1.menu_id = menu.id
inner join pizzeria p on p.id = menu.pizzeria_id
order by 1,2