create table name_nodes
(point1 varchar, point2 varchar, cost numeric);

insert into name_nodes values('a', 'b', 10);
insert into name_nodes values('b', 'a', 10);

insert into name_nodes values('a', 'c', 15);
insert into name_nodes values('c', 'a', 15);

insert into name_nodes values('a', 'd', 20);
insert into name_nodes values('d', 'a', 20);

insert into name_nodes values('b', 'c', 35);
insert into name_nodes values('c', 'b', 35);

insert into name_nodes values('c', 'd', 30);
insert into name_nodes values('d', 'c', 30);

insert into name_nodes values('d', 'b', 25);
insert into name_nodes values('b', 'd', 25);

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
from t where total_cost = (select min(total_cost) from t)
order by 1,2;