USE SocialNetwork

-- select
SELECT * FROM users
SELECT title FROM clips

-- where
-- get users that have birth day year are larger than 1991
SELECT YEAR(bDay), fname FROM users WHERE YEAR(bDay) >= 1991

-- order by
-- get title and views that views is largers than 1000000
SELECT title, views FROM Clips WHERE views > 1000000 ORDER BY title DESC

-- join
-- get clip title and user first name that liked the clip
SELECT c.title, u.fName FROM Likes l
INNER JOIN Clips c ON c.id = l.clipId
INNER JOIN Users u ON u.id = l.userId

-- group by
-- get clip title that have liked
SELECT c.title, count(*) AS countLike FROM Likes l
INNER JOIN Clips c ON c.id = l.clipId
GROUP BY c.title
ORDER BY countLike DESC

-- having
-- get clip tile that have liked > 1
SELECT c.title, count(*) AS countLike FROM Likes l
INNER JOIN Clips c ON c.id = l.clipId
GROUP BY c.title
HAVING count(*) > 1
ORDER BY countLike DESC

-- sub query
-- get clip title that liked by user's first name like "Lyly"
SELECT
	title
FROM
	Clips
WHERE
	id IN(
		SELECT
			clipId FROM Likes
		WHERE
			userId IN(
				SELECT
					id FROM Users
				WHERE
					fName LIKE '%Lyly%'))
