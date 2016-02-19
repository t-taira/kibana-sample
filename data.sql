create database mysites;
use mysites;
create table search_test(id int auto_increment, text text, updated_at datetime, PRIMARY KEY (id));
insert into search_test(text, updated_at) values('aaa', now());
update search_test set text='bbb' where text = 'aaa';
delete from search_test where text='bbb';