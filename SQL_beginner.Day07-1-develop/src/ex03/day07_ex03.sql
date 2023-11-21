with main as ((select pz.name,
                      count(person_id) as count,
                      'visits'         as action_type
               from person_visits pv
                        join pizzeria pz on pz.id = pv.pizzeria_id
               group by 1
               order by 2 desc)
union all
              (select pz.name,
                      count(pz.name) as count,
                      'order'        as action_type
               from person_order po
                        join menu m on m.id = po.menu_id
                        join pizzeria pz on m.pizzeria_id = pz.id
               group by 1
               order by 2 desc))
select name,
       sum(count) as total_count
from main
group by 1
order by 2 desc, 1;