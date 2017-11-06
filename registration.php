<?
$form = "
<form action=\"index.php\" method=\"post\">
<input type=\"hidden\" name=\"seenform\" value=\"y\">
Your first name?:<br>
<input type=\"text\" name=\"fname\" value=\"\"><br>
Your email?:<br>
<input type=\"text\" name=\"email\" value=\"\"><br>
<input type=\"submit\" value=\"Register!\">
</form>
";
if ((! isset ($seenform)) && (! isset ($userid))) :
     print $form;
elseif (isset ($seenform) && (! isset ($userid))) :
     $uniq_id = uniqid(rand());
     @mysql_pconnect("localhost", "root", "") or die("Could not connect to MySQL server!");
     @mysql_select_db("user") or die("Could not select user database!");
     $query = "INSERT INTO user_info VALUES('$uniq_id', '$fname', '$email')";
     $result = mysql_query($query) or die("Could not insert user information!");
     setcookie ("userid", $uniq_id, time()+2592000);

     print "Congratulations $fname! You are now registered!.";
elseif (isset($userid)) :
     @mysql_pconnect("localhost", "root", "") or die("Could not connect to MySQL server!");
     @mysql_select_db("user") or die("Could not select user database!");
     $query = "SELECT * FROM user_info WHERE user_id = '$userid'";
     $result = mysql_query($query) or die("Could not extract user information!");

     $row = mysql_fetch_array($result);
     print "Hi ".$row["fname"].",<br>";
     print "Your email address is ".$row["email"];

endif;

?>