with t as (
    with recursive nn as
        (select point1, point2, cost, 1 as level, array[point1] as path, false as cycle, array[cost] as costs
         from name_nodes
         where point1 = 'a'
         union all
         select name_nodes.point1, name_nodes.point2,name_nodes.cost + nn.cost as cost, nn.level +1 as level, nn.path || name_nodes.point1 as path,
    name_nodes.point1 = any(nn.path) as cycle, nn.costs || name_nodes.cost as costs
    from name_nodes inner join nn on nn.point2 = name_nodes.point1 and not cycle)
select
    cost -costs[5] as total_cost, path as tour
from nn
where level = 5 and
'a' = any(path) and
'b' = any(path) and
'c' = any(path) and
'd' = any(path) and
path[1] = path[5]
order by cost,path)
select distinct *
from t where total_cost = (select min(total_cost) from t) or total_cost = (select max(total_cost) from t)
order by 1,2;