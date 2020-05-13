USE SocialNetwork
GO

-- Views giúp chúng ta đóng gói và che đậy data, ngoài ra còn giúp chúng ta query dễ dàng hơn
-- Do việc đóng gói giúp chúng ta trừu tượng hoá sự truy vấn có ngữ nghĩa nhất định

-- Trong mạng xã hội chúng ta thường có new feeds để hiển thị thông tin nổi bật
-- Trong ví dụ này chúng ta thiết kế 1 view lấy ra tất cả các clip có lượng LIKES và COMMENTS cao nhất
CREATE VIEW View_NewFeeds AS
SELECT c.id, c.title, l.count as likeCount, co.count as commentCount FROM Clips c
INNER JOIN (SELECT clipId, count(*) AS count FROM Likes GROUP BY clipId) l ON c.id = l.clipId
INNER JOIN (SELECT clipId, count(*) AS count FROM Comments GROUP BY clipId) co ON c.id = co.clipId
GO

-- Sau khi tạo view chúng ta có thể sử dụng view và lấy ra clip có lượng LIKES và COMMENTS cao nhất
SELECT * FROM View_NewFeeds
ORDER BY likeCount DESC, commentCount DESC

