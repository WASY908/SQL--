create database Sci;

CREATE TABLE Users (
userID INT IDENTITY(1,1) PRIMARY KEY,
name VARCHAR(256) NOT NULL,
email VARCHAR(256) NOT NULL,
password VARCHAR(256) NOT NULL,
address VARCHAR(256) NOT NULL,
phone_number BIGINT NOT NULL,
role VARCHAR(256) NOT NULL,
city VARCHAR(256) NOT NULL,
country VARCHAR(256) NOT NULL
);


CREATE TABLE Posts (
postID INT  IDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
title VARCHAR(256) NOT NULL,
text TEXT NOT NULL,
type VARCHAR(256) NOT NULL,
status VARCHAR(256) NOT NULL,
start_date DATETIME,
end_date DATETIME,
views INT NOT NULL
);

CREATE TABLE Comments (
commentID INT IDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
postID INT FOREIGN KEY REFERENCES Posts(postID),
comment TEXT NOT NULL,
replies INT NOT NULL
);

CREATE TABLE Badges (
badgeID INT Identity(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
name VARCHAR(256) NOT NULL,
description VARCHAR(256) NOT NULL,
date_awarded DATETIME
);

CREATE TABLE Level (
levelID INT IDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
value INT NOT NULL
);

CREATE TABLE Videos (
videoID INT IDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
title VARCHAR(256) NOT NULL,
description TEXT NOT NULL,
video_url VARCHAR(256) NOT NULL,
views INT NOT NULL,
status VARCHAR(256) NOT NULL,
category VARCHAR(256) NOT NULL,
length INT NOT NULL
);

CREATE TABLE Videos_views (
video_viewsID INT IDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
videoID INT FOREIGN KEY REFERENCES Videos(videoID) 
);

CREATE TABLE Visits (
visitID INT Identity(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
date DATETIME NOT NULL
);

CREATE TABLE Transactions (
transactionID INT IDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
amount INT NOT NULL,
date_of_transaction DATETIME NOT NULL,
payment_type VARCHAR(256) NOT NULL
);

CREATE TABLE Advertisements (
advertisementID INT IDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
title VARCHAR(256) NOT NULL,
description VARCHAR(256) NOT NULL,
price INT NOT NULL,
date_of_advertisement DATETIME NOT NULL
);

CREATE TABLE Donations (
donationID INT IDENTITY(1,1) PRIMARY KEY,
from_userID INT FOREIGN KEY REFERENCES Users(userID),
to_userID INT FOREIGN KEY REFERENCES Users(userID),
amount INT NOT NULL,
date_of_donation DATETIME NOT NULL
);

CREATE TABLE Subscriptions (
subscriptionID INT iDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
subscribed_to_userID INT FOREIGN KEY REFERENCES Users(userID),
start_date DATETIME NOT NULL,
end_date DATETIME NOT NULL
);

CREATE TABLE Logs (
logID INT identity(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
request VARCHAR(256) NOT NULL,
action VARCHAR(256) NOT NULL,
date DATETIME NOT NULL
);

CREATE TABLE Rankings (
rankingID INT IDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
value INT NOT NULL
);
CREATE TABLE Queries (
queryID INT IDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
question VARCHAR(256) NOT NULL,
date DATETIME NOT NULL
);

CREATE TABLE Results (
resultID INT IDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
queryID INT FOREIGN KEY REFERENCES Queries(queryID),
answer TEXT NOT NULL,
date DATETIME NOT NULL
);

CREATE TABLE Documents (
documentID INT IDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
title VARCHAR(256) NOT NULL,
description VARCHAR(256) NOT NULL,
url VARCHAR(256) NOT NULL,
views INT NOT NULL
);

CREATE TABLE Offers (
offerID INT IDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
title VARCHAR(256) NOT NULL,
description VARCHAR(256) NOT NULL,
category VARCHAR(256) NOT NULL,
views INT NOT NULL
);

CREATE TABLE Messages (
messageID INT IDENTITY(1,1) PRIMARY KEY,
from_userID INT FOREIGN KEY REFERENCES Users(userID),
to_userID INT FOREIGN KEY REFERENCES Users(userID),
message TEXT NOT NULL,
date DATETIME NOT NULL
);

CREATE TABLE Reports (
reportID INT IDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
title VARCHAR(256) NOT NULL,
description TEXT NOT NULL,
date DATETIME NOT NULL
);

CREATE TABLE Followers (
followerID INT IDENTITY(1,1) PRIMARY KEY,
from_userID INT FOREIGN KEY REFERENCES Users(userID),
to_userID INT FOREIGN KEY REFERENCES Users(userID),
date DATETIME NOT NULL
);

CREATE TABLE Languages (
languageID INT IDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
name VARCHAR(256) NOT NULL
);

CREATE TABLE Suggestions (
suggestionID INT IDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
content TEXT NOT NULL
);

CREATE TABLE Email_subscriptions (
email_subscriptionID INT IDENTITY(1,1) PRIMARY KEY,
userID INT FOREIGN KEY REFERENCES Users(userID),
email_subscription VARCHAR(256) NOT NULL
);

CREATE TABLE Follow_requests (
follow_requestID INT IDENTITY(1,1) PRIMARY KEY,
from_userID INT FOREIGN KEY REFERENCES Users(userID),
to_userID INT FOREIGN KEY REFERENCES Users(userID),
date DATETIME NOT NULL
);

CREATE TABLE Invitations (
invitationID INT IDENTITY(1,1) PRIMARY KEY,
from_userID INT FOREIGN KEY REFERENCES Users(userID),
to_userID INT FOREIGN KEY REFERENCES Users(userID)
);

CREATE TABLE Notifications (
  notificationID INT Identity(1,1) PRIMARY KEY,
  userID INT,
  notification_text TEXT NOT NULL,
  is_read tinyint NOT NULL DEFAULT 0,
  created_at DATETIME NOT NULL,
  FOREIGN KEY (userID) REFERENCES Users(userID)
);

CREATE TABLE Reviews (
  reviewID INT Identity(1,1) PRIMARY KEY,
  userID INT FOREIGN KEY REFERENCES Users(userID),
  postID INT FOREIGN KEY REFERENCES Posts(postID),
  rating INT NOT NULL,
  comment TEXT,
  created_at DATETIME NOT NULL
);

CREATE TABLE Tags (
  tagID INT identity(1,1) PRIMARY KEY,
  name VARCHAR(256) NOT NULL,
  description VARCHAR(256)
);

CREATE TABLE Post_Tags (
  postID INT FOREIGN KEY REFERENCES Posts(postID),
  tagID INT FOREIGN KEY REFERENCES Tags(tagID),
  PRIMARY KEY (postID, tagID)
);

CREATE TABLE Video_Tags (
  videoID INT FOREIGN KEY REFERENCES Videos(videoID),
  tagID INT FOREIGN KEY REFERENCES Tags(tagID),
  PRIMARY KEY (videoID, tagID)
);

CREATE TABLE Post_Likes (
  postID INT FOREIGN KEY REFERENCES Posts(postID),
  userID INT FOREIGN KEY REFERENCES Users(userID),
  PRIMARY KEY (postID, userID)
);

CREATE TABLE Video_Likes (
  videoID INT FOREIGN KEY REFERENCES Videos(videoID),
  userID INT FOREIGN KEY REFERENCES Users(userID),
  PRIMARY KEY (videoID, userID)
);

CREATE TABLE Comment_Likes (
  commentID INT FOREIGN KEY REFERENCES Comments(commentID),
  userID INT FOREIGN KEY REFERENCES Users(userID),
  PRIMARY KEY (commentID, userID)
);

CREATE TABLE Document_Likes (
  documentID INT FOREIGN KEY REFERENCES Documents(documentID),
  userID INT FOREIGN KEY REFERENCES Users(userID),
  PRIMARY KEY (documentID, userID)
);

CREATE TABLE Post_Views (
  postID INT FOREIGN KEY REFERENCES Posts(postID),
  userID INT FOREIGN KEY REFERENCES Users(userID),
  PRIMARY KEY (postID, userID)
);

CREATE TABLE Video_Views (
  videoID INT FOREIGN KEY REFERENCES Videos(videoID),
  userID INT FOREIGN KEY REFERENCES Users(userID),
  PRIMARY KEY (videoID, userID)
);

CREATE TABLE Document_Views (
  documentID INT FOREIGN KEY REFERENCES Documents(documentID),
  userID INT FOREIGN KEY REFERENCES Users(userID),
  PRIMARY KEY (documentID, userID)
);

CREATE TABLE Post_Bookmarks (
  postID INT FOREIGN KEY REFERENCES Posts(postID),
  userID INT FOREIGN KEY REFERENCES Users(userID),
  PRIMARY KEY (postID, userID)
);
CREATE TABLE Video_Bookmarks (
  videoID INT FOREIGN KEY REFERENCES Videos(videoID),
  userID INT FOREIGN KEY REFERENCES Users(userID),
  PRIMARY KEY (videoID, userID)
);



CREATE TABLE Document_Bookmarks (
  documentID INT FOREIGN KEY REFERENCES Documents(documentID),
  userID INT FOREIGN KEY REFERENCES Users(userID),
  PRIMARY KEY (documentID, userID)
);


CREATE TABLE Post_Shares (
  postID INT FOREIGN KEY REFERENCES Posts(postID),
  userID INT FOREIGN KEY REFERENCES Users(userID),
  PRIMARY KEY (postID, userID)
);

CREATE TABLE Video_Shares (
  videoID INT FOREIGN KEY REFERENCES Videos(videoID),
  userID INT FOREIGN KEY REFERENCES Users(userID),
  PRIMARY KEY (videoID, userID)
);

CREATE TABLE Document_Shares (
  documentID INT FOREIGN KEY REFERENCES Documents(documentID),
  userID INT FOREIGN KEY REFERENCES Users(userID),
  PRIMARY KEY (documentID, userID)
);

CREATE TABLE Post_Hashtags (
  postID INT FOREIGN KEY REFERENCES Posts(postID),
  hashtag VARCHAR(256) NOT NULL,
  PRIMARY KEY (postID, hashtag)
);


CREATE TABLE Video_Hashtags (
  videoID INT FOREIGN KEY REFERENCES Videos(videoID),
  hashtag VARCHAR(256) NOT NULL,
  PRIMARY KEY (videoID, hashtag)
);

CREATE TABLE Document_Hashtags (
  documentID INT FOREIGN KEY REFERENCES Documents(documentID),
  hashtag VARCHAR(256) NOT NULL,
  PRIMARY KEY (documentID, hashtag)
);

CREATE TABLE User_Interests (
  userID INT FOREIGN KEY REFERENCES Users(userID),
  interest VARCHAR(256) NOT NULL,
  PRIMARY KEY (userID, interest)
);

CREATE TABLE Notifications_Subscriptions (
  userID INT FOREIGN KEY REFERENCES Users(userID),
  notification_type VARCHAR(256) NOT NULL,
  PRIMARY KEY (userID, notification_type)
);

CREATE TABLE Message_Views (
  messageID INT FOREIGN KEY REFERENCES Messages(messageID),
  userID INT FOREIGN KEY REFERENCES Users(userID),
  PRIMARY KEY (messageID, userID)
);









