USE SocialNetwork

-- giúp chúng ta search tên clip nhanh hơn khi có nhu cầu tìm kiếm tên clip
CREATE INDEX idx_clips_title ON Clips(title)

-- giúp chúng ta search tên user nhanh hơn khi có nhu cầu tìm kiếm theo tên user
CREATE INDEX idx_users_fname ON Users(fName)
CREATE INDEX idx_users_lname ON Users(lName)
