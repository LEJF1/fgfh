use master
go
drop database if exists ����
go
create database ����
go
use ����
go
/*
Created: 03.12.2023
Modified: 20.12.2023
Model: Logical model
Database: MS SQL Server 2019
*/


-- Create tables section -------------------------------------------------

-- Table �����

CREATE TABLE [�����]
(
 [�������] Bigint NOT NULL,
 [��������] Nvarchar(max) NOT NULL,
 [���������] Nvarchar(max) NOT NULL,
 [��������������] Nvarchar(max) NOT NULL,
 [�������������] Nvarchar(max) NOT NULL,
 [���] Float NOT NULL,
 [�����������] Nvarchar(max) NOT NULL,
 [����������] Bit NOT NULL
)
go

-- Add keys for table �����

ALTER TABLE [�����] ADD CONSTRAINT [Unique_Identifier1] PRIMARY KEY ([�������])
go

-- Table �������

CREATE TABLE [�������]
(
 [���_��������] Bigint NOT NULL,
 [�����] Nvarchar(max) NOT NULL,
 [���_����] Bigint NOT NULL
)
go

-- Create indexes for table �������

CREATE INDEX [IX_�������] ON [�������] ([���_����])
go

-- Add keys for table �������

ALTER TABLE [�������] ADD CONSTRAINT [Unique_Identifier2] PRIMARY KEY ([���_��������])
go

-- Table ������

CREATE TABLE [������]
(
 [ID] Bigint NOT NULL,
 [�������] Nvarchar(max) NOT NULL
)
go

-- Add keys for table ������

ALTER TABLE [������] ADD CONSTRAINT [Unique_Identifier3] PRIMARY KEY ([ID])
go

-- Table �����

CREATE TABLE [�����]
(
 [�������] Bigint NOT NULL,
 [�����] Bigint NOT NULL,
 [�����_������] Nvarchar(500) NOT NULL,
 [����_���������] Datetime NOT NULL,
 [������] Int NOT NULL
)
go

-- Add keys for table �����

ALTER TABLE [�����] ADD CONSTRAINT [PK_�����] PRIMARY KEY ([�������],[�����])
go

-- Table ������

CREATE TABLE [������]
(
 [���������] Float NOT NULL,
 [�������] Bigint NOT NULL,
 [������] Float NOT NULL,
 [���_����] Bigint NOT NULL
)
go

-- Add keys for table ������

ALTER TABLE [������] ADD CONSTRAINT [PK_������] PRIMARY KEY ([�������],[���_����])
go

-- Table ����

CREATE TABLE [����]
(
 [���_����] Bigint NOT NULL,
 [��������] Nvarchar(max) NOT NULL,
 [�����������_����] Nvarchar(max) NOT NULL
)
go

-- Add keys for table ����

ALTER TABLE [����] ADD CONSTRAINT [PK_����] PRIMARY KEY ([���_����])
go

-- Table ������������

CREATE TABLE [������������]
(
 [�������] Bigint NOT NULL,
 [���_��������] Bigint NOT NULL,
 [����������] Int NOT NULL
)
go

-- Add keys for table ������������

ALTER TABLE [������������] ADD CONSTRAINT [PK_������������] PRIMARY KEY ([�������],[���_��������])
go

-- Create foreign keys (relationships) section ------------------------------------------------- 


ALTER TABLE [�����] ADD CONSTRAINT [���������������] FOREIGN KEY ([�������]) REFERENCES [�����] ([�������]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [�����] ADD CONSTRAINT [���������������] FOREIGN KEY ([�����]) REFERENCES [������] ([ID]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [�������] ADD CONSTRAINT [�������] FOREIGN KEY ([���_����]) REFERENCES [����] ([���_����]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [������] ADD CONSTRAINT [���������] FOREIGN KEY ([�������]) REFERENCES [�����] ([�������]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [������] ADD CONSTRAINT [�����] FOREIGN KEY ([���_����]) REFERENCES [����] ([���_����]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [������������] ADD CONSTRAINT [���������] FOREIGN KEY ([�������]) REFERENCES [�����] ([�������]) ON UPDATE NO ACTION ON DELETE NO ACTION
go



ALTER TABLE [������������] ADD CONSTRAINT [��������] FOREIGN KEY ([���_��������]) REFERENCES [�������] ([���_��������]) ON UPDATE NO ACTION ON DELETE NO ACTION
go




