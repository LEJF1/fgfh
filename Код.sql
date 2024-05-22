use master
go
drop database if exists Таня
go
create database Таня
go
use Таня
go
/*
Created: 03.12.2023
Modified: 20.12.2023
Model: Logical model
Database: MS SQL Server 2019
*/


-- Create tables section -------------------------------------------------

-- Table Товар

CREATE TABLE [Товар]
(
 [Артикул] Bigint NOT NULL,
 [Название] Nvarchar(max) NOT NULL,
 [Категория] Nvarchar(max) NOT NULL,
 [Характеристики] Nvarchar(max) NOT NULL,
 [Производитель] Nvarchar(max) NOT NULL,
 [Вес] Float NOT NULL,
 [Изображение] Nvarchar(max) NOT NULL,
 [Партнёрский] Bit NOT NULL
)
go

-- Add keys for table Товар

ALTER TABLE [Товар] ADD CONSTRAINT [Unique_Identifier1] PRIMARY KEY ([Артикул])
go

-- Table Магазин

CREATE TABLE [Магазин]
(
 [Код_магазина] Bigint NOT NULL,
 [Адрес] Nvarchar(max) NOT NULL,
 [Код_сети] Bigint NOT NULL
)
go

-- Create indexes for table Магазин

CREATE INDEX [IX_Относит] ON [Магазин] ([Код_сети])
go

-- Add keys for table Магазин

ALTER TABLE [Магазин] ADD CONSTRAINT [Unique_Identifier2] PRIMARY KEY ([Код_магазина])
go

-- Table Клиент

CREATE TABLE [Клиент]
(
 [ID] Bigint NOT NULL,
 [Никнейм] Nvarchar(max) NOT NULL
)
go

-- Add keys for table Клиент

ALTER TABLE [Клиент] ADD CONSTRAINT [Unique_Identifier3] PRIMARY KEY ([ID])
go

-- Table Отзыв

CREATE TABLE [Отзыв]
(
 [Артикул] Bigint NOT NULL,
 [Логин] Bigint NOT NULL,
 [Текст_отзыва] Nvarchar(500) NOT NULL,
 [Дата_написания] Datetime NOT NULL,
 [Оценка] Int NOT NULL
)
go

-- Add keys for table Отзыв

ALTER TABLE [Отзыв] ADD CONSTRAINT [PK_Отзыв] PRIMARY KEY ([Артикул],[Логин])
go

-- Table Ценник

CREATE TABLE [Ценник]
(
 [Стоимость] Float NOT NULL,
 [Артикул] Bigint NOT NULL,
 [Скидка] Float NOT NULL,
 [Код_сети] Bigint NOT NULL
)
go

-- Add keys for table Ценник

ALTER TABLE [Ценник] ADD CONSTRAINT [PK_Ценник] PRIMARY KEY ([Артикул],[Код_сети])
go

-- Table Сеть

CREATE TABLE [Сеть]
(
 [Код_сети] Bigint NOT NULL,
 [Название] Nvarchar(max) NOT NULL,
 [Изображение_сети] Nvarchar(max) NOT NULL
)
go

-- Add keys for table Сеть

ALTER TABLE [Сеть] ADD CONSTRAINT [PK_Сеть] PRIMARY KEY ([Код_сети])
go

-- Table Расположение

CREATE TABLE [Расположение]
(
 [Артикул] Bigint NOT NULL,
 [Код_магазина] Bigint NOT NULL,
 [Количество] Int NOT NULL
)
go

-- Add keys for table Расположение

ALTER TABLE [Расположение] ADD CONSTRAINT [PK_Расположение] PRIMARY KEY ([Артикул],[Код_магазина])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [Отзыв] ADD CONSTRAINT [Предоставляется] FOREIGN KEY ([Артикул]) REFERENCES [Товар] ([Артикул]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Отзыв] ADD CONSTRAINT [Взаимодействует] FOREIGN KEY ([Логин]) REFERENCES [Клиент] ([ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Магазин] ADD CONSTRAINT [Относит] FOREIGN KEY ([Код_сети]) REFERENCES [Сеть] ([Код_сети]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Ценник] ADD CONSTRAINT [Относится] FOREIGN KEY ([Артикул]) REFERENCES [Товар] ([Артикул]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Ценник] ADD CONSTRAINT [Имеет] FOREIGN KEY ([Код_сети]) REFERENCES [Сеть] ([Код_сети]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Расположение] ADD CONSTRAINT [Находится] FOREIGN KEY ([Артикул]) REFERENCES [Товар] ([Артикул]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [Расположение] ADD CONSTRAINT [Содержит] FOREIGN KEY ([Код_магазина]) REFERENCES [Магазин] ([Код_магазина]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




