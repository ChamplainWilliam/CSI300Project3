<?php
    setcookie('user_id', $_POST['user_id'], time() + 86400);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device_width, initial-scale=1.0">
    <title>Twitter Clone</title>

</head>
<body>
    <h1>LOG IN TO TWITTER USING YOUR USER ID</h1>    
    <form action="timeline.php" method="POST">
        <select name="user_id">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
        </select>  
        <input type="submit" name="submit" value="submit">
    </form>
    <p>1 is William Chen</p>
    <p>2 is Jacky Zhang</p>
    <p>3 is Dylan Pallatroni</p>
    <p>4 is Irvin Vien</p>
    <p>5 is James Zhang</p>
    <p>6 is Frank Canovatchel</p>
    <p>7 is Evan Lee</p>
    <p>8 is John Cha</p>
</body>
</html>