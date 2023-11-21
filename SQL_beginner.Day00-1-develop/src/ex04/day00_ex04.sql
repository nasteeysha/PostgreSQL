select concat (name, '(age:',age::varchar,',gender:''', gender,''',address:''', address, ''')') as person_information
from person order by person_information