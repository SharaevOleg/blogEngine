drop table if exists captcha_codes;

create table captcha_codes(
id integer not null auto_increment,
code tinytext not null,
secret_code tinytext not null,
time datetime not null,
primary key (id));

