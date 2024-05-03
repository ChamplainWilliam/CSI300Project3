<?php
require("db_connect.php");

if (!isset($_COOKIE["userID"])) {
    echo "<p>Please log in from the home page with your user ID.</p>";
    exit();
}

$username = $_GET['username'];

if (empty($username)) {
    die("Please provide a valid username.");
}

$user_query = "
    SELECT userID FROM user 
    WHERE username = '$username';
";

$user_result = mysqli_query($link, $user_query);

if (mysqli_num_rows($user_result) == 0) {
    die("User not found.");
}

$user_data = mysqli_fetch_assoc($user_result);
$viewed_userID = $user_data['userID'];

$tweets_query = "
    SELECT t.content, t.tweet_time 
    FROM tweet t 
    WHERE t.userID = $viewed_userID 
    ORDER BY t.tweet_time DESC;
";

$tweets_result = mysqli_query($link, $tweets_query);

?>

<!DOCTYPE html>
<html>
<head>
    <title>User Timeline</title>
    <link href="style.css?v=2" rel="stylesheet" type="text/css"/>
    <meta charset="UTF-8">
</head>
<body>
    <div class="navbar">
        <a href="timeline.php">Timeline</a> 
        <a href="viewAccount.php">View Account</a>
        <a href="favorited.php">Favorited Tweets</a>
        <a href="search.php">Search A User</a>
        <a href="index.php">Log Out</a>
    </div>

    <h2><?php echo htmlspecialchars($username); ?>'s Timeline:</h2>

    <table>
        <tr>
            <th>Content</th>
            <th>Tweet Time</th>
        </tr>
        <?php
        while ($row = mysqli_fetch_assoc($tweets_result)) {
            echo "<tr>";
            echo "<td>" . htmlspecialchars($row['content']) . "</td>";
            echo "<td>" . htmlspecialchars($row['tweet_time']) . "</td>";
            echo "</tr>";
        }
        ?>
    </table>

    <a href="search.php">Search Again</a>
</body>
</html>
