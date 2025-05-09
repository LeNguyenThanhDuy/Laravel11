create database bke;
use bke;
-- drop database bke;
create table users (
    user_id int identity(1,1) primary key,
    user_name varchar(25) not null,
    user_pass varchar(255) not null,
    updated_at datetime,
    created_at datetime
);

create table user_emails (
    email_id int identity(1,1) primary key,
    user_id int not null,
    email_address varchar(255) not null,
    is_primary bit default 0,  
    updated_at datetime,
    created_at datetime,
    foreign key (user_id) references users(user_id)
);

create table products (
    product_id int identity(1,1) primary key,
    product_name varchar(255) not null,
    product_price float not null, 
    product_description text not null,
    category varchar(100),
    brand varchar(100),
    updated_at datetime,
    created_at datetime
);

create table orders (
    order_id int identity(1,1) primary key,
    user_id int not null,
    updated_at datetime,
    created_at datetime,
    foreign key (user_id) references users(user_id)
);

create table order_details (
    order_detail_id int identity(1,1) primary key,
    order_id int not null,
    product_id int not null,
    quantity int not null,
    updated_at datetime,
    created_at datetime,
    foreign key (order_id) references orders(order_id),
    foreign key (product_id) references products(product_id)
);
