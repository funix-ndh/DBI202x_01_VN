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
	createdAt DATETIME,
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
GO

INSERT INTO Roles(name) Values
('admin'),
('operator'),
('user')

INSERT INTO Permissions(name) VALUES
('edit clip'),
('delete clip'),
('edit comment'),
('delete comment')

INSERT INTO PermissionRole(roleId, permissionId) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 3),
(2, 4)

INSERT INTO Categories(name) VALUES
('game'),
('music'),
('sport')

INSERT INTO Users(roleId, fName, lName, bDay, sex, email) VALUES
(1, 'Scott', 'Dang', '1991-04-26', 1, 'namdhFX03393@funix.edu.vn'),
(2, 'John', 'Wick', '1992-08-11', 1, 'johnwickFX0001@funix.edu.vn'),
(3, 'Anne', 'Helena', '1993-02-16', 0, 'annehelenaFX0002@funix.edu.vn'),
(3, 'Lyly', 'Marick', '1990-04-26', 0, 'lylymarickFX0003@funix.edu.vn'),
(3, 'Robin', 'Shebasky', '1992-12-04', 0, 'robinshebaskyFX0004@funix.edu.vn')

INSERT INTO Clips(userId, categoryId, title, description, views) VALUES
(1, 1, 'Introduction to programming', 'references to stackoverflow.com', 1000000),
(1, 2, 'Introduction to HTML', 'references to w3school.com', 2000000),
(1, 3, 'Introduction to CSS', 'references to w3school.com', 2500000),
(2, 1, 'Cracking the coding interview', 'references to leetcode.com', 5000000),
(3, 2, 'Java tutorial', 'references to oracle.com', 1500000),
(4, 3, 'Spring tutorial', 'references to google.com', 500000),
(5, 1, 'Introduction to database', 'references to google.com', 250000)

INSERT INTO Likes(userId, clipId, createdAt) VALUES
(1, 1, GETDATE()),
(1, 2, GETDATE()),
(1, 3, GETDATE()),
(2, 4, GETDATE()),
(3, 5, GETDATE()),
(3, 6, GETDATE()),
(4, 1, GETDATE()),
(4, 3, GETDATE()),
(4, 5, GETDATE()),
(4, 7, GETDATE()),
(5, 2, GETDATE()),
(5, 4, GETDATE()),
(5, 6, GETDATE())

INSERT INTO Comments(userId, clipId, content) VALUES
(1, 1, 'Thanks for watching'),
(2, 1, 'not good'),
(3, 1, 'thanks'),
(4, 1, 'very good'),
(1, 2, 'not bad'),
(2, 2, 'good'),
(3, 2, 'funny'),
(1, 2, 'stupid'),
(3, 3, 'lollll'),
(4, 3, 'lmao'),
(1, 3, 'hahaha'),
(2, 4, 'stupid'),
(4, 4, 'hihi'),
(1, 4, 'waooo'),
(1, 5, 'whatttt'),
(1, 5, 'ewwwww'),
(2, 5, '?????'),
(3, 6, 'hmmmm'),
(2, 6, 'weird')

-- giúp chúng ta search tên clip nhanh hơn khi có nhu cầu tìm kiếm tên clip
CREATE INDEX idx_clips_title ON Clips(title)

-- giúp chúng ta search tên user nhanh hơn khi có nhu cầu tìm kiếm theo tên user
CREATE INDEX idx_users_fname ON Users(fName)
CREATE INDEX idx_users_lname ON Users(lName)

