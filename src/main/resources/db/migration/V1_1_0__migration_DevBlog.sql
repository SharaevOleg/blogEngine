drop table if exists captcha_codes;
drop table if exists global_settings;
drop table if exists post;
drop table if exists post_comments;
drop table if exists post_votes;
drop table if exists tag;
drop table if exists tags2post;
drop table if exists user;

create table captcha_codes (id integer not null auto_increment, code tinytext not null, secret_code tinytext not null, time datetime not null, primary key (id)) engine=MyISAM;
create table global_settings (id integer not null auto_increment, code varchar(255) not null, name varchar(255) not null, value varchar(255) not null, primary key (id)) engine=MyISAM;
create table post (id integer not null auto_increment, is_active tinyint(1) not null, moderation_status enum('NEW','ACCEPTED','DECLINED') default 'NEW' not null, text text not null, time timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(), title varchar(255) not null, view_count int not null, moderator_id int, user_id int not null, primary key (id)) engine=MyISAM;
create table post_comments (id integer not null auto_increment, parent_id integer, text text not null, time datetime not null, post_id integer not null, user_id int not null, primary key (id)) engine=MyISAM;
create table post_votes (id integer not null auto_increment, time datetime not null, value tinyint(1) not null, post_id integer not null, user_id int not null, primary key (id)) engine=MyISAM;
create table tag (id integer not null auto_increment, name varchar(255) not null, primary key (id)) engine=MyISAM;
create table tags2post (id integer not null auto_increment, post_id integer not null, tag_id integer not null, primary key (id)) engine=MyISAM;
create table user (id int not null auto_increment, code varchar(255), email varchar(255) not null, is_moderator tinyint not null, name varchar(255) not null, password varchar(255) not null, photo text, reg_time datetime not null, primary key (id)) engine=MyISAM;

insert into user (email, is_moderator, name, password, reg_time) values('tverskoi2@mail.ru', '1', 'Tverskoi', '123456789', '2020-10-10');
insert into post (is_active, moderation_status, text, time, title, view_count, moderator_id, user_id) values('1', 'ACCEPTED', 'Тестовый текст', '2020-10-10 12:12:12', 'Заголовок', '1', '1', '1');
insert into post_comments (text, time, post_id, user_id) values('тест', '2020-10-10 12:12:12', '1', '1');
insert into post_votes (time, value, post_id, user_id) values('2020-09-30 19:30:31', '1', '1', '1');
insert into tag (name) values('Spring Boot');
insert into tags2post (post_id, tag_id) values('1', '2');
