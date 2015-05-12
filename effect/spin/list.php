<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0" />

<?php
require_once "secret/db.php";

// database connection
$conn = new PDO("mysql:host=$dbhost;dbname=$dbname",$dbuser,$dbpass);


$sql = 'SELECT name, score FROM event_sum ORDER BY score desc limit 50';

?>

<table border="1">
    <tr>
        <th>排名</th>
        <th>姓名</th>
        <th>分數</th>
    </tr>

<?php

foreach ($conn->query($sql) as $count=>$row) {
    if ($count == 49){

    } else if ($count >= 10){
        break;
    }

    $rank = $count+1;
    $name = $row['name'];
    $score = $row['score'];

    echo <<<END
<tr>
    <td>$rank</td>
    <td>$name</td>
    <td>$score</td>
</tr>
END;
}
?>
</table>

<a href="./">再玩一次</a>