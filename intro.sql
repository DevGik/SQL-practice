create database intro_sql

use intro_sql

create table intro_data (
first_name varchar(20),
last_name varchar (20),
id varchar(20),
age int not null,
city varchar (20),
state varchar(50)
)

alter table intro_data
add state
varchar (30)

select * from intro_data

drop table intro_data

set sql_safe_updates = 0

delete from intro_data

update intro_data
set age = 35, state = 'california'
where first_name = 'Mary' and id = 'ed982'

delete from intro_data
where first_name = 'eric'

delete from intro_data

insert into intro_data values ('Mary','Jones','ed982',25,'Payson','Arizona');



insert into intro_data (first_name, last_name, id, age, city, state) values ('John','Jones','EG980',45,'Payson','Arizona');



insert into intro_data values ('Mary','Jones',99982,25,'Payson','Arizona');
insert into intro_data values ('Eric','Edwards',88232,32,'San Diego','California');
insert into intro_data values ('Mary Ann','Edwards',88233,32,'Phoenix','Arizona');
insert into intro_data values ('Ginger','Howell',98002,42,'Cottonwood','Arizona');
insert into intro_data values ('Sebastian','Smith',92001,23,'Gila Bend','Arizona');
insert into intro_data values ('Gus','Gray',22322,35,'Bagdad','Arizona');
insert into intro_data values ('Mary Ann','May',32326,52,'Tuscan','Arizona');
