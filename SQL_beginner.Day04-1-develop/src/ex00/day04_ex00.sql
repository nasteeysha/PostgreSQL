create view v_persons_female as
    select *
from person
where gender = 'female';

create view v_persons_male as
    select *
from person
where gender = 'male';

select *
from v_persons_female
order by 1;

select *
from v_persons_male
order by 1;