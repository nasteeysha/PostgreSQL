select m1.pizza_name, p1.name as pizzeria_name_1, p2.name as pizzeria_name_2, m1.price
from menu m1 inner join menu m2 on m1.id <> m2.id and m1.price = m2.price and m1.pizzeria_id > m2.pizzeria_id and
                                   m1.pizza_name = m2.pizza_name
inner join pizzeria p1 on m1.pizzeria_id = p1.id
inner join pizzeria p2 on m2.pizzeria_id= p2.id
order by 1