select(select name from person p where p.id = pw.person_id) as person_name,
      (select  name from pizzeria p where p.id = pw.pizzeria_id) as pizzeria_name from (select * from person_visits pw where visit_date between '2022-01-07' and '2022-01-09') as pw
order by 1 asc, 2 desc