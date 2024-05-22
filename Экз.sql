/* �������������� �������� ������������� �� ���������� �������� (5 ��������) */
-- �������� ���������� ��� �����
declare @id int = 1;
declare @username NVARCHAR(50);
declare @password NVARCHAR(5);
declare @dbname NVARCHAR(50);

-- ���� ��� �������� �������������
while @id <= 10
begin
	set @username = 'user' + cast(@id as NVARCHAR(10));
	set @password = left(convert(varchar(50), newid()), 5);
	set @dbname = 'db' + cast(@id as nvarchar(10));

	-- �������� ������������
	exec sp_addlogin @loginame = @username, @passwd = @password;

	-- �������� ���� ������
	exec ('create database ' + @dbname);

	-- ������ ���� ������������
	exec ('use ' + @dbname + '; create user ' + @username + ' for login ' + @username + '; ALTER ROLE db_owner ADD MEMBER ' + @username)

	-- ����� ����������
	print 'Created user: ' + @username + ' with password: ' + @password;

	-- ������� � ���������� ������������
	set @id = @id + 1;
end
go

/* �������� ���� ������ */
create database UsersDB;

use UsersDB
create table Users
(userId int identity(1,1) primary key,
userName nvarchar(50) not null,
password nvarchar(5) not null);

/* ���������� ������� */
use UsersDB
declare @id int = 1;
declare @username NVARCHAR(50);
declare @password NVARCHAR(5);

-- ���� ��� �������� �������������
while @id <= 10
begin
	set @username = 'user' + cast(@id as NVARCHAR(10));
	set @password = left(convert(varchar(50), newid()), 5);

	insert into Users (userName, password)
	values (@username, @password);

	set @id = @id + 1;
end
go

/* ���������� ������� */
use UsersDB
alter table Users
add EncryptedPassword varbinary(max);

use UsersDB
update Users
set EncryptedPassword = ENCRYPTBYPASSPHRASE('User''s password: ', password);

use UsersDB
select * from Users