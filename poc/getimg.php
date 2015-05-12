<?php
//"http://pic7.qiyipic.com/common/20130924/0359bcba6f914db09759dbed65371282.jpg";
$url = $_GET['url'];
$res = file_get_contents($url);

header('Content-type: image/jpg');
echo $res;
