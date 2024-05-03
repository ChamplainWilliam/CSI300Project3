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

$favorited_query = "select t.content, t.tweet_time, u.username from favorite f
                    join tweet t on f.tweetID = t.tweetID
                    join user u  on t.userId = u.userID
                    where f.userID = $userID";
$favorited_result = mysqli_query($link, $favorited_query);

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

    <h2>Favorited Tweets:</h2>
    <table>
        <tr>
            <th>Username</th>
            <th>Content</th>
            <th>Tweet Time</th>
        </tr>
        <?php
        while ($row = mysqli_fetch_assoc($favorited_result))
        {
            echo "<tr>";
            echo "<td>" . $row['username'] . "</td>";
            echo "<td>" . $row['content'] ."</td>";
            echo "<td>" . $row["tweet_time"] ."</td>";
            echo "</tr>";
        }
        ?>
    </table>

</body>
</html>