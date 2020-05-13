-- user master database
USE Master
GO

-- create database from beginning
CREATE DATABASE SocialNetwork
GO

-- use current database
USE SocialNetwork
GO

-- create table roles
CREATE TABLE Roles (
	id INT PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(255) NOT NULL,
	createdAt DATETIME NOT NULL DEFAULT GETDATE()
)
GO

-- create table permissions
CREATE TABLE Permissions (
	id INT PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(255) NOT NULL,
	createdAt DATETIME NOT NULL DEFAULT GETDATE()
)
GO

-- create table categories
CREATE TABLE Categories (
	id INT PRIMARY KEY IDENTITY(1,1),
	name VARCHAR(255) NOT NULL,
	createdAt DATETIME NOT NULL DEFAULT GETDATE()
)
GO

-- create table permission role
CREATE TABLE PermissionRole (
	roleId INT,
	permissionId INT,
	createdAt DATETIME NOT NULL DEFAULT GETDATE(),
	CONSTRAINT permission_role_pk PRIMARY KEY (roleId, permissionId), -- add primary keys
	CONSTRAINT FK_permission_role_roleId FOREIGN KEY (roleId) REFERENCES Roles(id), -- add foreign keys
	CONSTRAINT FK_permission_role_permissionId FOREIGN KEY (permissionId) REFERENCES Permissions(id)
)
GO

-- create table users
CREATE TABLE Users (
	id INT PRIMARY KEY IDENTITY(1,1),
	roleId INT NOT NULL,
	fName VARCHAR(255) NOT NULL,
	lName VARCHAR(255) NOT NULL,
	bDay DATE NOT NULL,
	createdAt DATETIME NOT NULL DEFAULT GETDATE(),
	sex BIT NOT NULL,
	email VARCHAR(255) NOT NULL,
	CONSTRAINT FK_users_roleId FOREIGN KEY (roleId) REFERENCES Roles(id)
)
GO

-- create table clips
CREATE TABLE Clips (
	id INT PRIMARY KEY IDENTITY(1,1),
	userId INT NOT NULL,
	categoryId INT NOT NULL,
	title VARCHAR(255) NOT NULL,
	data BINARY,
	createdAt DATETIME NOT NULL DEFAULT GETDATE(),
	description VARCHAR(255) NOT NULL,
	views INT NOT NULL,
	CONSTRAINT FK_clips_userId FOREIGN KEY (userId) REFERENCES Users(id),
	CONSTRAINT FK_clips_categoryId FOREIGN KEY (categoryId) REFERENCES Categories(id)
)
GO

-- create table likes
CREATE TABLE Likes (
	userId INT,
	clipId INT,
	createdAt DATETIME NOT NULL DEFAULT GETDATE(),
	CONSTRAINT likes_pk PRIMARY KEY (userId, clipId),
	CONSTRAINT FK_likes_userId FOREIGN KEY (userId) REFERENCES Users(id),
	CONSTRAINT FK_likes_clipId FOREIGN KEY (clipId) REFERENCES Clips(id)
)
GO

-- create table comments
CREATE TABLE Comments (
	id INT PRIMARY KEY IDENTITY(1,1),
	userId INT NOT NULL,
	clipId INT NOT NULL,
  content TEXT NOT NULL,
	createdAt DATETIME NOT NULL DEFAULT GETDATE(),
	CONSTRAINT FK_comments_userId FOREIGN KEY (userId) REFERENCES Users(id),
	CONSTRAINT FK_comments_clipId FOREIGN KEY (clipId) REFERENCES Clips(id)
)
