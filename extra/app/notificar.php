<?php
if (isset($_POST["Token"])) {

    $_uv_Token=$_POST["Token"];
    $conn = mysqli_connect("localhost","oooivlbk_appNotificaciones","PI9T-.dL6DZv","oooivlbk_appNotificaciones") or die("Error connecting");
    $q="INSERT INTO users (Token) VALUES ( '$_uv_Token') "
        ." ON DUPLICATE KEY UPDATE Token = '$_uv_Token';";

    mysqli_query($conn,$q) or die(mysqli_error($conn));
    mysqli_close($conn);
}