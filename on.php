<html>
<head>
<meta charset="utf-8">
<title>ON</title>
</head>

<body>

<?php
require_once ('template/connectvars.php');

$con = mysqli_connect (DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);

if (!$con) {
  die('Could not connect: ' . mysqli_error());
}

$query = "UPDATE izuTB SET onoff =1";
mysqli_query($query);

mysqli_close($con);
?>

<script type="text/javascript">
<!--
window.onload = function(){
location.href = "http://comelive.net/izu/index.html";
}   
// --></script>

</body>
</html>
