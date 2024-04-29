<?php
require("db_connect.php");

if (!isset($_COOKIE["userID"]))
{
    echo "<p>Please log in from the home page with your user ID.</p>";
    exit();
}
else {
    echo "<p>Logged in as User ID: {$_COOKIE["userID"]}</p>";
}

$userID = $_COOKIE["userID"];

$timeline_select = "select u.username, t.content, t.tweet_time, t.tweetID
FROM tweet t
JOIN user u ON t.userID = u.userID
WHERE t.userID = 1
ORDER BY t.tweet_time DESC";

$result = mysqli_query($link, $timeline_select);

while($row = mysqli_fetch_assoc($result))
{
    echo "<tr><td class='labels'>Username </td><td class='data'>".$row['username']."</td></tr><br>";
    echo "<tr><td class='labels'>Content:</td><td class='data'>".$row['content']."</td></tr><br>";
    echo "<tr><td class='labels'>Tweet Time:</td><td class='data'>".$row['tweet_time']."</td></tr><br>";
    echo "<tr><td class='labels'>TweetID:</td><td class='data'>".$row['tweetID']."</td></tr><br>";
}
?>


<!DOCTYPE html>
<html>
<head>
    <title>Timeline</title>
    <link href="style.css"/>
    <meta charset="URF-8">
</head>
<body>
    
</body>

</html>