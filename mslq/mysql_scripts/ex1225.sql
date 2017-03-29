use mysql;
show status;
show grants;
show errors;
show warnings;
use `sql-learn`;
show tables;
show databases;
use again_sql_learn;
show tables;
describe customers;
show create table customers;
help show;
select prod_id, prod_price, prod_name
from products
order by prod_price desc, prod_name desc
limit 1,1;