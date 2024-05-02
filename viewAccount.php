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
    </div>

<?php

?>