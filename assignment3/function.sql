USE SocialNetwork
GO

-- Thực tế chúng ta thường thấy các nội dung website hiện thị bị cắt bớt đi khi nội dung quá dài
-- có thể gây tràn layout, giải pháp chúng ta có thể cắt bớt 1 phần, sau đó người dùng có thể chọn hiển thị đầy đủ nội dung
-- khi bấm vào link hoặc xem chi tiết
-- Ở đây chúng ta tạo hàm F_Shorted_Str với tham số là 1 kiểu VARCHAR, Kiểm tra nếu độ dài của tham số lớn hơn 17 ký tự thì cắt chuỗi
-- Ngược lại thì không làm gì cả
CREATE FUNCTION F_ShortedStr(@str VARCHAR(MAX)) RETURNS VARCHAR(20)
AS
BEGIN
	IF LEN(@str) > 17
		SET @str = SUBSTRING(@str, 1, 17) + '...'
	RETURN @str
END
GO

-- testcase chứng minh FUNCTION hoạt động tốt
SELECT dbo.F_ShortedStr(title) as shortedTitle, dbo.F_ShortedStr(description) as shortedDescription FROM Clips

