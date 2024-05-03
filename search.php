<?php
require("db_connect.php");

if (!isset($_COOKIE["userID"])) {
    echo "<p>Please log in from the home page with your user ID.</p>";
    exit();
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Search User</title>
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

    <h2>Search for a User:</h2>

    <form action="viewUser.php" method="get">
        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required/>
        <button type="submit">Search</button>
    </form>
</body>
</html>
