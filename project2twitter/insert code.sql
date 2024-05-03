use twitter;

delete from comment;
delete from favorite;
delete from follow;
delete from tweet;
delete from user;

-- USER TABLE INSERT CODE
-- UserID, Username, Email Address, Password
insert into user values(1, "William Chen", "williamchen@gmail.com", "password");
insert into user values(2, "Jacky Zhang", "jackyzhang@gmail.com", "password");
insert into user values(3, "Dylan Pallatroni", "dylanpallatroni@gmail.com", "password");
insert into user values(4, "Irvin Vien", "irvinvien@gmail.com", "password");
insert into user values(5, "James Zhang", "jameszhang@gmail.com", "password");
insert into user values(6, "Frank Canovatchel", "frankcanovatchel@gmail.com", "password");
insert into user values(7, "Evan Lee", "evanlee@gmail.com", "password");
insert into user values(8, "John Cha", "johncha@gmail.com", "password");


-- TWEET TABLE INSERT CODE
-- TweetID, UserID, Tweet Content, Tweet Time, isRetweet
insert into tweet values(1, 1, "William tweet 1", "2014-01-31", NULL);
insert into tweet values(2, 1, "William tweet 2", "2015-02-20", NULL);
insert into tweet values(3, 2, "Jacky tweet 1", "2015-10-31", NULL);
insert into tweet values(4, 2, "Jacky tweet 2", "2016-02-25", NULL);
insert into tweet values(5, 3, "Dylan tweet 1", "2012-01-31", NULL);
insert into tweet values(6, 3, "Dylan tweet 2", "2019-01-31", NULL);
insert into tweet values(7, 4, "Irvin tweet 1", "2021-04-21", NULL);
insert into tweet values(8, 4, "Irvin tweet 2", "2023-01-11", NULL);
insert into tweet values(9, 5, "James tweet 1", "2016-01-12", NULL);
insert into tweet values(10, 5, "James tweet 2", "2018-03-07", NULL);
insert into tweet values(11, 6, "Frank tweet 1", "2015-07-18", NULL);
insert into tweet values(12, 6, "Frank tweet 2", "2018-01-21", NULL);
insert into tweet values(13, 7, "Evan tweet 1", "2019-03-25", NULL);
insert into tweet values(14, 7, "Evan tweet 2", "2020-02-15", NULL);
insert into tweet values(15, 8, "John tweet 1", "2020-05-19", NULL);
insert into tweet values(16, 8, "John tweet 2", "2021-07-05", NULL);
insert into tweet values(17, 1, "william retweeting jacky", NOW(), 3);


-- COMMENT TABLE INSERT CODE
-- CommentID, TweetID, UserID, Comment Content, Comment Time
insert into comment values(1, 3, 1, "Hi Jacky, cool tweet!", "2015-11-01");
insert into comment values(2, 1, 2, "Hey William, cool tweet!", "2014-02-01");
insert into comment values(3, 7, 3, "Hello Irvin, cool tweet!", "2021-04-22");
insert into comment values(4, 5, 4, "Hey Dylan, cool tweet!", "2012-02-01");
-- insert into comment values(5, 11, 5, "Hey Frank, cool tweet!", "2021-12-25");
-- insert into comment values(6, 9, 6, "Hi James, cool tweet!", "2016-01-13");
-- insert into comment values(7, 15, 7, "Hey John, cool tweet!", "2020-05-19");
-- insert into comment values(8, 13, 8, "Hello Evan, cool tweet!", "2019-03-26");


-- FOLLOW TABLE INSERT CODE
-- FollowID, Follow Time, FollowerID, FollowedID, 
insert into follow values(1, "2023-01-21", 1, 2);
insert into follow values(2, "2023-01-31", 2, 1);
insert into follow values(3, "2023-02-12", 3, 8);
insert into follow values(4, "2023-02-12", 3, 2);
insert into follow values(5, "2023-03-14", 3, 4);
insert into follow values(6, "2023-03-15", 3, 1);
insert into follow values(7, "2023-04-12", 4, 5);
insert into follow values(8, "2023-04-12", 4, 6);
insert into follow values(9, "2023-05-12", 5, 1);
insert into follow values(10, "2023-05-13", 6, 1);
insert into follow values(11, "2023-06-13", 7, 1);
insert into follow values(12,"2023-06-13", 8, 1);
insert into follow values(13, "2023-06-02", 6, 2);
insert into follow values(14, "2023-07-01", 6, 5);
insert into follow values(15, "2023-07-02", 3, 7);
insert into follow values(16, "2023-08-15", 5, 2);
insert into follow values(17, "2023-09-01", 7, 3);
insert into follow values(18, "2023-10-02", 8, 7);
insert into follow values(19, "2023-10-04", 8, 4);


-- FAVORITE TABLE INSERT CODE
-- FavoriteID, TweetID, UserID, Favorite Time
insert into favorite values(1, 1, 1, "2023-1-1");
insert into favorite values(2, 1, 2, "2023-2-11");
insert into favorite values(3, 1, 3, "2023-2-12");
insert into favorite values(4, 1, 4, "2023-3-17");
insert into favorite values(5, 1, 5, "2023-7-21");
insert into favorite values(6, 1, 6, "2023-7-11");
insert into favorite values(7, 1, 7, "2023-12-21");
insert into favorite values(8, 1, 8, "2024-1-06");

select * from user;
select * from tweet;
select * from comment;
select * from follow;
select * from favorite;