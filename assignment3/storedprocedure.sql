USE SocialNetwork
GO

-- Lợi ích lớn nhất khi sử dụng SP là tốc độ. SP được tối ưu hoá trong ngay ở lần biên dịch đầu tiên, điều này cho phép chúng có thể thực hiện nhanh hơn nhiều lần so với các câu lệnh T-SQL thông thường.
-- Một khi Stored Procedure được tạo ra nó có thể được sử dụng lại. Ðiều này sẽ làm cho việc bảo trì (maintainability) dễ dàng hơn do việc tách rời giữa business rules (tức là những logic thể hiện bên trong Stored Procedure) và cơ sở dữ liệu. Ví dụ nếu có một sự thay đổi nào đó về mặt logic thì ta chỉ việc thay đổi code bên trong stored procedure mà thôi. Những ứng dụng dùng Stored Procedure này có thể sẽ không cần phải thay đổi mà vẫn tương thích với business rule mới.

-- Chúng ta tạo 1 stored procedure để tạo clips
-- Ở đây chúng ta thấy việc giảm thiểu 1 số trường ở tham số đầu vào giúp việc gọi stored procedure tiện hơn
-- Thay vì phải gọi lệnh ÍNSERT trực tiếp
-- Ngoài ra tăng performance và tính module hoá cho ứng dụng

CREATE PROC Pr_CreateClip(
	@userId INT,
	@categoryId INT,
	@title VARCHAR(255),
	@description VARCHAR(255)
)
AS
BEGIN
	INSERT INTO Clips(userId, categoryId, title, createdAt, description, views) VALUES
	(@userId, @categoryId, @title, GETDATE(), @description, 0)
END
GO

-- testcase minh chứng stored procedure hoạt động tốt
exec Pr_CreateClip @userId=1,@categoryId=1,@title="Stored Procedure tutorial",@description="Hope this example will help you learn Stored Procedure"
