<?php
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    if (isset($_POST["userID"])) {
        setcookie("userID", $_POST["userID"], time() + 86400, "/");
        header("Location: timeline.php");
    }
}
?>