create database spring01;
use spring01;
create table user(
  id varchar(32) primary key not null,
  username varchar(20) not null,
  password varchar(20) not null
)