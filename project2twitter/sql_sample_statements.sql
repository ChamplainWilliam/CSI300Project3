use twitter;
-- query to show a user's timeline, in this example it is userID 1 which is username william chen.
-- so user william chen has two tweets and one retweet 
-- it is sorted in descending order so it shows the most recent ones first
select u.username, t.content, t.tweet_time, t.tweetID
FROM tweet t
JOIN user u ON t.userID = u.userID
WHERE t.userID = 1

ORDER BY t.tweet_time DESC;

-- query to show who follows who and when.
-- followerID is the follower and followedID is who follower is following.
select * from follow;

-- if i want to see specifically who follows userID 1, we see users 2, 3, 5, 6, 7, and 8 follow user 1
select * from follow
where followedID = 1;

-- to see all users and all their information including email and password:
select * from user;

-- to see who favorited what tweet
select * from favorite; -- everyone favorited the first tweet by William Chen

-- to see all comments ever
select * from comment; -- to see comments on a specific tweet, just add where tweetID = tweet ID u want to see