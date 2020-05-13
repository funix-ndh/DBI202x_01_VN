USE SocialNetwork
GO

-- Trong thực tế chúng ta thường hay truy vấn dữ liệu theo thời gian
-- Cụ thể trong trường hợp này là ngày mà user bấm nút like 1 clip
-- Để giảm thiểu việc insert data cho trường này chúng ta xử dụng trigger
-- Sau mỗi lần insert chúng ta sẽ cập nhật biến ngày tạo tự động theo thời gian hiện tại
-- Như vậy chúng ta giảm thiểu được việc thêm trường dữ liệu này mỗi khi insert
CREATE TRIGGER Trigger_createdAt
ON Likes AFTER INSERT AS
BEGIN
	DECLARE @userId INT
	DECLARE @clipId INT
	SELECT @userId = userId, @clipId = clipId from INSERTED
	UPDATE Likes SET createdAt = GETDATE() WHERE userId = @userId AND clipId = @clipId
END
GO

-- testcase chứng minh trigger hoạt động tốt mà không cần truyền vào trường createdAt
INSERT INTO Likes(userId, clipId) VALUES (1, 4)
INSERT INTO Likes(userId, clipId) VALUES (1, 5)
INSERT INTO Likes(userId, clipId) VALUES (1, 6)
INSERT INTO Likes(userId, clipId) VALUES (1, 7)

