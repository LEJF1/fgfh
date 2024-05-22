CREATE TABLE Пользователи
(
	Логин nvarchar(20) NOT NULL PRIMARY KEY,
	Пароль nvarchar(20) NOT NULL)


CREATE TABLE Товары(
	Товар nvarchar(20) PRIMARY KEY,
	Цена numeric(10, 2) NOT NULL,
	Фото nvarchar(max) NOT NULL)


insert into Пользователи
values
('Первый','123.jpg'),
('Второй','321'),
('Третий','322')


insert into Пользователи
values
('Кротовуха',500,'Крот.jpg'),
('Ковёр',700,'Ковёр.jpg')