use S22_kslarnoul
go

select * from Awareness
go

select * from PreferredOS
go

select * from AccountMaster
go

select * from SubscriptionMaster
go

--drop and recreate ComputerRepairType table
drop table if exists ComputerRepairType
go

create table ComputerRepairType
(ComputerRepairTypeID int identity(1,1) not null constraint ComputerRepairTypePK Primary Key,
ComputerRepairTypeDesc varchar(30))
go

insert into ComputerRepairType 
(ComputerRepairTypeDesc)
values
('Display'),('Storage'),('Keyboard'),('Other')
go

--drop and recreate spComputerRepairType procedure
drop procedure if exists spComputerRepairType
go

create procedure spComputerRepairType
as
begin
	SELECT ComputerRepairTypeID, ComputerRepairTypeDesc
	from ComputerRepairType
	order by ComputerRepairTypeID asc
end
go

--drop and recreate ComputerCleanType table
drop table if exists ComputerCleanType
go

create table ComputerCleanType
(ComputerCleanTypeID int identity(1,1) not null constraint ComputerCleanTypepkID Primary Key,
ComputerCleanTypeDesc varchar(30))
go

insert into ComputerCleanType 
(ComputerCleanTypeDesc)
values
('Interior'),('OS Updates'),('Anti-bacterial')
go

--drop and recreate spComputerCleanType procedure
drop procedure if exists spComputerCleanType
go

create procedure spComputerCleanType
as
begin
	SELECT ComputerCleanTypeID, ComputerCleanTypeDesc
	from ComputerCleanType
	order by ComputerCleanTypeID asc
end
go

--drop and recreate ComputerCleanType table
drop table if exists OSRepairMaster
go

create table OSRepairMaster
(OSRepairID int identity(1,1) not null constraint OSRepairMasterPK Primary Key,
OSRepairDesc varchar(30) not null)
go

insert into OSRepairMaster 
(OSRepairDesc)
values
('macOS'),('Windows'),('Linux')
go

--drop and recreate spOSRepairMaster procedure
drop procedure if exists spOSRepairMaster
go

create procedure spOSRepairMaster
as
begin
	SELECT OSRepairID, OSRepairDesc
	from OSRepairMaster
	order by OSRepairID asc
end
go

--drop and recreate ComputerPartUpgrade table
drop table if exists ComputerPartUpgrade
go

create table ComputerPartUpgrade
(PartUpgradeID int identity(1,1) not null constraint ComputerPartUpgradeID Primary Key,
PartUpgradeDesc varchar(30) not null)
go

insert into ComputerPartUpgrade 
(PartUpgradeDesc)
values
('RAM'),('GPU'),('CPU'),('Other')
go

--drop and recreate spOSRepairMaster procedure
drop procedure if exists spComputerPartUpgrade
go

create procedure spComputerPartUpgrade
as
begin
	SELECT PartUpgradeID, PartUpgradeDesc
	from ComputerPartUpgrade
	order by PartUpgradeID asc
end
go

--drop and recreate RoleMaster table
drop table if exists AccountMaster
go


--drop and recreate PreferredOS table
drop table if exists PreferredOS
go

create table PreferredOS (
PreferredOSID int identity(1,1) not null constraint pkID Primary Key,
PreferredOSDesc varchar(100) not null)
go

insert into PreferredOS (PreferredOSDesc) values ('Select a value'), ('macOS'),('Linux'),('Windows')
go


-- drop and recreate Awareness table
drop table if exists Awareness
go

create table Awareness (
AwarenessID int Identity(1,1) not null constraint AwarenessPkID Primary Key,
AwarenessDesc varchar(100) not null)
go

insert into Awareness (AwarenessDesc) values ('Select a value'), ('Social Media'),('Web Search'),('Billboard')
go

-- drop and recreate RoleMaster table
drop table if exists RoleMaster
go

create table RoleMaster (
roleID int identity(1,1) not null constraint pkRoleID Primary Key,
RoleDesc varchar(20) not null)

insert into RoleMaster (RoleDesc)
VALUES
('User'),('Admin')

-- create user table

create table AccountMaster (
AccountID int Identity(1,1)  not null constraint pkAccountID Primary Key,
FirstName varchar(40) not null,
LastName varchar(40) not null,
PreferredOS int not null Constraint fkPreferredOS Foreign Key references PreferredOS(PreferredOSID),
Awareness int not null Constraint fkAwarenessOD Foreign Key references Awareness(AwarenessID),
DOB date not null,
Email varchar(50) not null,
PhoneNumber varchar(25),
UserPassword varchar(100) not null,
PasswordSalt varchar(100) not null,
RoleID int not null Constraint fkRoleID Foreign Key references RoleMaster(roleID))

--Add user account
DROP PROCEDURE if exists spAddAccount
go

CREATE PROCEDURE spAddAccount
@FirstName varchar(40),
@LastName varchar(40),
@PreferredOS int,
@Awareness int,
@DOB date,
@Email varchar(50),
@PhoneNumber varchar(25),
@UserPassword varchar(100),
@OutputAccountID int output
as
begin
	DECLARE @randomText uniqueidentifier = NewID()
	DECLARE @Salt as Char(100)
	SET @Salt = HASHBYTES('SHA2_256',CONVERT(Char(100), @randomText))
	-- this creates a random text string, inputs it into SHA256 algorithm, and saves it as our salt variable

	DECLARE @PasswordSalt as varbinary(max)
	SET @PasswordSalt = HASHBYTES('SHA2_256',CONCAT(@Salt, @UserPassword))
	-- this combines our salt and user password then inputs it into SHA 256 algorithm

	INSERT INTO AccountMaster
	(FirstName, LastName, PreferredOS, Awareness, DOB, Email, PhoneNumber, UserPassword, PasswordSalt, RoleID)
	VALUES
	(@FirstName, @LastName, @PreferredOS, @Awareness, @DOB, @Email, @PhoneNumber, @PasswordSalt, @Salt, 1)
	-- 1 is our normal user id

	Set @OutputAccountID = SCOPE_IDENTITY()
end
go

-- Create default Professor Strom Login
declare @tempvar int
exec spAddAccount 'Kim', 'Strom', 4,3,'2022-03-07','kim.strom@okstate.edu', '405-999-9999', 'P@$$w0rd!',@OutputAccountID = @tempvar
go

update AccountMaster
set RoleID = 2
where Email = 'kim.strom@okstate.edu'
go

--Validate user login

DROP procedure if exists spValidateAccount
go

create procedure spValidateAccount
@Email varchar(100),
@UserPassword varchar(100)
as 
begin
	select AccountID, FirstName, LastName, PreferredOS, Awareness, DOB, Email, PhoneNumber, UserPassword, RoleID
	from AccountMaster
	where Email = @Email and
		UserPassword = HASHBYTES('SHA2_256', CONCAT(PasswordSalt, @UserPassword))
end
go

-- drop and recreate spPreferredOS procedure
drop procedure if exists spPreferredOS
go

create procedure spPreferredOS
as
begin
	SELECT PreferredOSID, PreferredOSDesc
	from PreferredOS
	order by PreferredOSID asc
end
go

-- drop and recreate spAwareness procedure
drop procedure if exists spAwareness
go

create procedure spAwareness
as
begin
	SELECT AwarenessID, AwarenessDesc
	from Awareness
	order by AwarenessID asc
end
go

-- drop and recreate insert PreferredOS procedure

drop procedure if exists spInsertPreferredOS
go

create procedure spInsertPreferredOS
@PreferredOSDesc varchar(100)
as
begin
	INSERT into PreferredOS
	(PreferredOSDesc)
	VALUES
	(@PreferredOSDesc)
end
go

-- drop and recreate insert Awareness procedure

drop procedure if exists spInsertAwareness
go

create procedure spInsertAwareness
@AwarenessDesc varchar(100)
as
begin
	INSERT into Awareness
	(AwarenessDesc)
	VALUES
	(@AwarenessDesc)
end
go

-- drop and recreate Subscription table
drop table if exists SubscriptionMaster
go

create table SubscriptionMaster (
SubscriptionID int identity(1,1) not null constraint SubscriptionPkID Primary Key,
Email varchar(100),
PhoneNumber varchar(20))
go

-- drop and recreate InsertSubscription procedure
drop procedure if exists spInsertSubscription
go

create procedure spInsertSubscription
@Email varchar(100),
@PhoneNumber varchar(20)
as
begin
	insert into SubscriptionMaster
	(Email, PhoneNumber)
	VALUES
	(@Email, @PhoneNumber)
end
go

-- create unique index for email address to prevent multiple accounts created with same email address
drop index if exists uiEmail on AccountMaster
go

create unique index uiEmail on AccountMaster(Email)
go

-- create unique index for Subscription email addresses and phone numbers to prevent duplicate subscriptions
drop index if exists uiSubEmail on SubscriptionMaster
go

create unique index uiSubEmail on SubscriptionMaster(Email)
go

drop index if exists uiSubPhoneNumber on SubscriptionMaster
go

create unique index uiSubPhoneNumber on SubscriptionMaster(PhoneNumber)
go

-- create unique indexes for Awareness and PreferredOS tables so that admins do not duplicate records
drop index if exists uiAwarenessDesc on Awareness
go

create unique index uiAwarenessDesc on Awareness(AwarenessDesc)
go

drop index if exists uiPreferredOSDesc on PreferredOS
go

create unique index uiPreferredOSDesc on PreferredOS(PreferredOSDesc)
go