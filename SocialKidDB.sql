-- Tạo database
CREATE DATABASE SocialKidsDB;
GO

USE SocialKidsDB;
GO
ALTER DATABASE SocialKidsDB
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;
GO
DROP DATABASE SocialKidsDB;
GO
-- 1. Bảng Users (Tài khoản người dùng)
CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL,
    FullName NVARCHAR(100),
    Dob DATE,
    Role NVARCHAR(20) DEFAULT 'child' CHECK (Role IN ('child', 'parent', 'admin')),
    CreatedAt DATETIME DEFAULT GETDATE()
);
ALTER TABLE Users ADD Avatar NVARCHAR(255);
-- 2. Bảng UserProfiles (Thông tin hồ sơ người dùng)
CREATE TABLE UserProfiles (
    UserID INT PRIMARY KEY,
    AvatarUrl NVARCHAR(255),
    Bio NVARCHAR(255),
    FavoriteSubject NVARCHAR(50),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- 3. Bảng ParentChild (Quan hệ cha mẹ - con cái)
CREATE TABLE ParentChild (
    ParentID INT,
    ChildID INT,
    PRIMARY KEY (ParentID, ChildID),
    FOREIGN KEY (ParentID) REFERENCES Users(UserID),
    FOREIGN KEY (ChildID) REFERENCES Users(UserID)
);

-- 4. Bảng Posts (Bài viết)
CREATE TABLE Posts (
    PostID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    Content NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE(),
    IsApproved BIT DEFAULT 1,
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
ALTER TABLE Posts
ADD ImageUrl NVARCHAR(255) NULL;

-- 5. Bảng Comments (Bình luận)
CREATE TABLE Comments (
    CommentID INT PRIMARY KEY IDENTITY(1,1),
    PostID INT NOT NULL,
    UserID INT NOT NULL,
    CommentText NVARCHAR(MAX),
    CreatedAt DATETIME DEFAULT GETDATE(),
    IsApproved BIT DEFAULT 1,
    FOREIGN KEY (PostID) REFERENCES Posts(PostID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);
ALTER TABLE Comments
ADD Visible BIT NOT NULL DEFAULT 1;

-- 6. Bảng Reactions (Phản ứng: like, love, funny)
CREATE TABLE Reactions (
    ReactionID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    PostID INT NOT NULL,
    ReactionType NVARCHAR(20) CHECK (ReactionType IN ('like', 'love', 'funny')),
    ReactedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (PostID) REFERENCES Posts(PostID)
);

-- 7. Bảng Messages (Tin nhắn giữa người dùng)
CREATE TABLE Messages (
    MessageID INT PRIMARY KEY IDENTITY(1,1),
    SenderID INT NOT NULL,
    ReceiverID INT NOT NULL,
    MessageText NVARCHAR(MAX),
    SentAt DATETIME DEFAULT GETDATE(),
    IsRead BIT DEFAULT 0,
    FOREIGN KEY (SenderID) REFERENCES Users(UserID),
    FOREIGN KEY (ReceiverID) REFERENCES Users(UserID)
);

-- 8. Bảng Achievements (Thành tựu)
CREATE TABLE Achievements (
    AchievementID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50),
    Description NVARCHAR(255),
    IconUrl NVARCHAR(255)
);

-- 9. Bảng UserAchievements (Người dùng đạt thành tựu)
CREATE TABLE UserAchievements (
    UserID INT,
    AchievementID INT,
    EarnedAt DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (UserID, AchievementID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (AchievementID) REFERENCES Achievements(AchievementID)
);

-- 10. Bảng Notifications (Thông báo)
CREATE TABLE Notifications (
    NotificationID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT NOT NULL,
    Message NVARCHAR(255),
    IsRead BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- 11. Bảng ModerationLogs (Lịch sử kiểm duyệt nội dung)
CREATE TABLE ModerationLogs (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    ContentType NVARCHAR(10) CHECK (ContentType IN ('image', 'video')),
    ContentURL NVARCHAR(255),
    UserID INT NOT NULL,
    DetectedLabels NVARCHAR(255),
    Moderator NVARCHAR(50), -- 'AI' hoặc tên admin
    ActionTaken NVARCHAR(50) CHECK (ActionTaken IN ('approved', 'rejected', 'flagged')),
    CheckedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

INSERT INTO Users (Username, Email, Password, FullName, Dob, Role)
VALUES
('admin2', 'admin2@gmail.com', '$2a$10$mOq2OY.DMuRE1rjAOJUIBeptRi3C0amwBOZB7LAD9MIw.oJexR3PS', N'Trần Thanh Bình', '2002-11-25', 'admin');--zxcv
('child01', 'child01@example.com', '12345', N'Nguyễn Văn A', '2015-06-15', 'child'),
('parent01', 'parent01@example.com', 'abcd', N'Trần Thị B', '1985-03-20', 'parent'),
('admin01', 'admin01@example.com', 'xinchao', N'Lê Văn C', '1990-01-10', 'admin'),
('admin1', 'admin1@gmail.com', 'zxcv', N'Trần Thanh An', '2002-11-15', 'admin'),
('child02', 'child02@example.com', 'hello', N'Phạm Thị D', '2014-09-05', 'child');

-- 2. Insert UserProfiles
INSERT INTO UserProfiles (UserID, AvatarUrl, Bio, FavoriteSubject)
VALUES
(1, 'https://example.com/avatars/child01.png', N'Yêu thích học Toán', 'Math'),
(2, 'https://example.com/avatars/parent01.png', N'Cha mẹ của child01', NULL),
(3, 'https://example.com/avatars/admin01.png', N'Quản trị hệ thống', NULL),
(4, 'https://example.com/avatars/child02.png', N'Thích vẽ và đọc sách', 'Art');

-- 3. Insert ParentChild relationships
INSERT INTO ParentChild (ParentID, ChildID)
VALUES
(2, 1),
(2, 4);

-- 4. Insert Posts
INSERT INTO Posts (UserID, Content)
VALUES
(1, N'Bài viết đầu tiên của mình!'),
(4, N'Mình thích học và chơi thể thao.'),
(3, N'Chào mừng các bạn đến với mạng xã hội dành cho trẻ em.');

-- 5. Insert Comments
INSERT INTO Comments (PostID, UserID, CommentText)
VALUES
(1, 2, N'Con làm tốt lắm!'),
(1, 3, N'Chào mừng bạn đến với SocialKidsDB!'),
(2, 1, N'Mình cũng thích thể thao.');

-- 6. Insert Reactions
INSERT INTO Reactions (UserID, PostID, ReactionType)
VALUES
(2, 1, 'like'),
(3, 1, 'love'),
(1, 3, 'funny');

-- 7. Insert Messages
INSERT INTO Messages (SenderID, ReceiverID, MessageText)
VALUES
(2, 1, N'Con có cần giúp đỡ bài tập không?'),
(1, 2, N'Dạ, con cần giúp với toán.'),
(3, 2, N'Xin chào, bạn cần hỗ trợ gì không?');

-- 8. Insert Achievements
INSERT INTO Achievements (Name, Description, IconUrl)
VALUES
('First Post', N'Đăng bài viết đầu tiên', 'https://example.com/icons/first_post.png'),
('Helpful Parent', N'Hỗ trợ con cái tích cực', 'https://example.com/icons/helpful_parent.png'),
('Active User', N'Tham gia mạng xã hội thường xuyên', 'https://example.com/icons/active_user.png');

-- 9. Insert UserAchievements
INSERT INTO UserAchievements (UserID, AchievementID)
VALUES
(1, 1),
(2, 2),
(1, 3),
(4, 3);

-- 10. Insert Notifications
INSERT INTO Notifications (UserID, Message)
VALUES
(1, N'Bạn đã nhận được huy hiệu First Post!'),
(2, N'Có tin nhắn mới từ con bạn.'),
(3, N'Có bài viết mới cần phê duyệt.');

-- 11. Insert ModerationLogs
INSERT INTO ModerationLogs (ContentType, ContentURL, UserID, DetectedLabels, Moderator, ActionTaken)
VALUES
('image', 'https://example.com/content/image1.png', 1, 'safe', 'AI', 'approved'),
('video', 'https://example.com/content/video1.mp4', 4, 'inappropriate', 'admin01', 'rejected');