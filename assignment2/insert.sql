USE SocialNetwork
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

INSERT INTO Likes(userId, clipId) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(3, 5),
(3, 6),
(4, 1),
(4, 3),
(4, 5),
(4, 7),
(5, 2),
(5, 4),
(5, 6)

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

UPDATE Users
SET email = 'namdh@funix.edu.vn'
WHERE id = 1

DELETE Likes WHERE userId = 1 and clipId = 1

