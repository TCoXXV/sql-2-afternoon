select *
from InvoiceLine il
join Invoice i
on il.InvoiceId = i.InvoiceId
where il.UnitPrice > 0.99

---------

select i.InvoiceDate, c.FirstName, c.LastName, i.Total
from Invoice i
join Customer c
on i.CustomerId = c.CustomerId

----------

select c.FirstName, c.LastName, e.FirstName, e.LastName
from Customer c
join Employee e
on c.SupportRepid = e.EmployeeId

----------

select c.FirstName, c.LastName, e.FirstName, e.LastName
from Customer c
join Employee e
on c.SupportRepid = e.EmployeeId

----------

select pt.TrackId
from PlaylistTrack pt
join Playlist p
on pt.PlaylistId = p.PlaylistId
where p.Name is "Music"

----------

SELECT t.Name
FROM Track t
JOIN PlaylistTrack pt 
ON pt.TrackId = t.TrackId
WHERE pt.PlaylistId = 5;

----------

select t.name, p.Name
from Playlist p
join PlaylistTrack pt
on p.PlaylistId = pt.PlaylistId
join Track t
on pt.TrackId = t.TrackId

----------

select t.Name, al.Title
from Track t
join Album al
on t.AlbumId = al.AlbumId
join Genre g
on t.GenreId = g.GenreId
where g.Name is "Alternative"

-----------

select *
from Invoice i
where i.InvoiceId in (select il.InvoiceId from InvoiceLine il where UnitPrice > 0.99);

-----------

select *
from PlaylistTrack pt
where pt.PlaylistId in ( select p.PlaylistId from Playlist p where Name is "Music")

-----------

select t.Name
from Track t
where t.TrackId in ( select pl.TrackId from PlaylistTrack pl where pl.PlaylistId = 5)

-----------

select *
from Track
where GenreId in (select GenreId from Genre where Name = "Comedy")

-----------

select *
from Track
where AlbumId in (select AlbumId from Album where Title = "Fireball")

-----------

select *
from Track
where AlbumId in 
(select AlbumId from Album where ArtistId in 
 (select ArtistId from Artist where Name = "Queen"));

 ------------

 update Customer
set Fax = null
where Fax is not null;

------------

update Customer
set Company = "Self"
where Company is null;

------------

update Customer
set LastName = "Thompson"
where FirstName = "Julia" and LastName = "Barnett";

------------

update Customer
set SupportRepId = 4
where Email = "luisrojas@yahoo.cl";

------------

update Track
set Composer = "The darkness around us"
where GenreId in (select GenreId from Genre where Name = "Metal")
and Composer is null;

--------------

select count(*), g.Name
from Genre g
join Track t
on g.GenreId = t.GenreId
group by g.Name

--------------

select count(*), g.Name
from Genre g
join Track t
on g.GenreId = t.GenreId
where g.Name = "Rock" or g.Name = "Pop"
group by g.Name

--------------

select count(*), ar.Name
from Artist ar
join Album al
on ar.ArtistId = al.ArtistId
group by ar.ArtistId

----------------

select distinct Composer
from Track

----------------

select distinct BillingPostalCode
from Invoice

----------------

select distinct Company
from Customer

----------------

delete from practice_delete where Type = "bronze"

----------------

delete from practice_delete where Type = "silver"

-----------------

delete from practice_delete where Value = 150;

----------------

create table Users
(users_id integer not null primary key autoincrement,
 name string,
 email string);
 
create table Products 
(products_id integer not null primary key autoincrement,
 name string,
 price integer);
 
create table Orders
(orders_id integer not null primary key autoincrement,
 users_id references Users (users_id),
 products_id references Products (products_id));

 insert into Users (name, email)
values 
("Matt", "matts@mail"),
("Jt", "Jts@mail"),
("Kyle", "Kyle@mail");
 
 insert into Products
(name,price)
values
("tv", 200),
("chair", 100),
("table", 50);

insert into Orders
(users_id, products_id)
values
(1,2),
(2,3),
(3,1);

select p.Name
from Products p
where p.products_id in (select o.products_id from Orders o where o.orders_id = 1)

select * from Orders

select sum(p.price)
from Orders o
join Products p
on o.products_id = p.products_id
where o.orders_id = 1

alter table Orders add column users_id integer references Users (users_id)

update Orders
set users_id = 1
where users_id = 2

update Orders
set users_id = 2
where users_id = 3

update Orders
set users_id = 3
where users_id = 1

select *
from Orders
where users_id = 3

select count(orders_id), users_id
from Orders
group by users_id