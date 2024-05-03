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
WHERE t.userID = $userID
ORDER BY t.tweet_time DESC";

$result = mysqli_query($link, $timeline_select);

?>
<!DOCTYPE html>
<html>
<head>
    <title>Timeline</title>
    <link href="style.css?v=2" rel="stylesheet" type="text/css"/>
    <meta charset="URF-8">
</head>
<body>
    <div class="navbar">
        <a href="timeline.php">Timeline</a> 
        <a href="viewAccount.php">View Account</a>
        <a href="favorited.php">Favorited Tweets</a>
        <a href="search.php">Search A User</a>
        <a href="index.php">Log Out</a>
    </div>
        <div class ="tweetTable">
        <?php
        if (mysqli_num_rows($result) > 0) {
        echo "<table>";
        echo "<tr><th>Username</th><th>Content</th><th>Tweet Time</th><th>TweetID</th></tr>";
        while($row = mysqli_fetch_assoc($result)) {
            echo "<tr>";
            echo "<td>".$row['username']."</td>";
            echo "<td>".$row['content']."</td>";
            echo "<td>".$row['tweet_time']."</td>";
            echo "<td>".$row['tweetID']."</td>";
            echo "</tr>";
        }
        echo "</table>";
        }   
        else {
        echo "<p>No tweets found.</p>";
        }
        ?>

    </div>
</body>

</html>

