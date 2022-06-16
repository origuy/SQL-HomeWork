create database ogstore;
use ogstore;
create table categories (
	id int auto_increment not null,
    categorie_name varchar(25),
    primary key (id)
);
create table products_laptop (
	id int auto_increment not null,
    products_laptop_name varchar(25),
    products_laptop_price int,
    categories int,
    onStock boolean,
    primary key (id),
    constraint  products_laptop_con foreign key (categories) references categories(id)
);
create table products_kitchen (
	id int auto_increment not null,
    products_kitchen_name varchar(25),
    products_kitchen_price int,
     categories int,
    onStock boolean,
    primary key (id),
    constraint   products_kitchen_con foreign key (categories) references categories(id)
);
create table customers (
	id int auto_increment not null,
    Customers_name varchar(25),
    Customers_tel int,
    favorite_categorie int,
     gender  varchar(25),
    primary key (id),
    constraint   customers_con foreign key (favorite_categorie) references categories(id)
);
create table orders (
	id int auto_increment not null,
   product_kitchen int,
   product_laptop int,
   customer int,
   order_date timestamp,
    primary key (id),
	foreign key (product_kitchen) references products_kitchen(id),
	foreign key (product_laptop) references products_laptop(id),
    foreign key (customer) references customers(id)
);
insert into  categories (id, categorie_name) values
(0,"Laptop"),
(0,"Kitchen");

insert into  products_laptop (id, products_laptop_name,products_laptop_price,categories,onStock) values
(0,"Lenovo Legion 5 Pro 16",10790,1,true),
(0,"Apple MacBook Pro 16 Apple M1",12189,1,true),
(0,"Asus ROG Zephyrus G14",10190,1,false),
(0,"מסך מגע Dell XPS 13 2-in-1",10990,1,false),
(0," Apple MacBook Pro 14 Apple M1 Max",12189,1,true);
 insert into products_kitchen (id, products_kitchen_name,products_kitchen_price,categories,onStock) values
(0,"Nespresso Delonghi Lattissima",764,2,true),
(0,"Nespresso Delonghi Essenza",341,2,true),
(0,"Ninja Foodi 7-in-1 Multi-",511,2,false),
(0,"Kai Michel Bras",1423,2,false),
(0," Ninja 2-In-1 Blender With Auto-",315,2,true);

insert into  customers (id, customers_name,customers_tel,favorite_categorie,gender) values
(0,"Ori Guy",547520899,1,"Male"),
(0,"Lee Malka",542282824,2,"Female"),
(0,"Omer Goder",545875465,1,"Male"),
(0,"Edna Guy Lippl",544597005,2,"Female"),
(0," Michael Mor",0542589655,1,"Male");

insert into  orders (id, product_kitchen,product_laptop, customer,order_date) values
(0,null,1,1,"2022-06-10"),
(0,1,5,2,"2022-06-14"),
(0,null,5,3,"2022-06-13"),
(0,5,null,4,"2022-06-12"),
(0,null,2,5,"2022-06-8");

select * from categories;
select * from customers;
select * from orders;
select * from products_kitchen;
select * from products_laptop;

select * from orders;
SELECT  customers.Customers_name, products_laptop.products_laptop_name
FROM ((orders
INNER JOIN customers ON orders.customer = customers.id)
INNER JOIN products_laptop ON orders.product_laptop = products_laptop.id);