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

$followers_query = "select u.username from follow f join user u on f.followerID = u.userID where f.followedID = $userID";
$followers_result = mysqli_query($link, $followers_query);

$following_query = "select u.username from follow f join user u on f.followedId = u.userID where f.followerId = $userID";
$following_result = mysqli_query($link, $following_query);

?>

<!DOCTYPE html>
<html>
<head>
    <title>View Account</title>
    <link href="style.css?v=2" rel="stylesheet" type="text/css"/>
    <meta charset="URF-8">
</head>
<body>
    <div class="navbar">
        <a href="timeline.php">Timeline</a> 
        <a href="viewAccount.php">View Account</a>
        <a href="favorited.php">Favorited Tweets</a>
        <a href="index.php">Log Out</a>
    </div>

    <h2>Followers:</h2>
    <ul>
        <?php
        while ($follower = mysqli_fetch_assoc($followers_result))
        {
            echo "<li>" . $follower['username'] . "</li>";
        }
        ?>
    </ul>
    <h2>Following:</h2>
    <ul>
        <?php
        while($following = mysqli_fetch_assoc($following_result))
        {
            echo "<li>" . $following["username"] . "</li>";
        }
        ?>
    </ul>
</body>
</html>
