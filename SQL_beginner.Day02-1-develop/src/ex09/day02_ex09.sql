select person.name
from person inner join person_order po on person.id = po.person_id
inner join menu m on m.id = po.menu_id
where m.pizza_name = 'pepperoni pizza' and person.gender = 'female'
intersect
select person.name
from person inner join person_order po on person.id = po.person_id
inner join menu m on m.id = po.menu_id
where m.pizza_name = 'cheese pizza' and person.gender = 'female'
order by 1