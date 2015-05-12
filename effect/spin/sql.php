<?php
require_once "secret/db.php";

// database connection
$conn = new PDO("mysql:host=$dbhost;dbname=$dbname",$dbuser,$dbpass);

// new data
$ip = get_ip_address();
$name = $_REQUEST['name'];
$tel = $_REQUEST['tel'];
$email = $_REQUEST['email'];
$score = $_REQUEST['score'];
$udid = $_REQUEST['udid'];

// query
$sql = "INSERT INTO event_sum (ip,name,tel,email,score,udid) VALUES (:ip,:name,:tel,:email,:score,:udid)";
$q = $conn->prepare($sql);
$result = $q->execute(
    array(
        ':ip'=>$ip,
        ':name'=>$name,
        ':tel'=>$tel,
        ':email'=>$email,
        ':score'=>$score,
        ':udid'=>$udid
    )
);

if ($result){
    echo "OK";
}

function get_ip_address(){
    foreach (array('HTTP_CLIENT_IP', 'HTTP_X_FORWARDED_FOR', 'HTTP_X_FORWARDED', 'HTTP_X_CLUSTER_CLIENT_IP', 'HTTP_FORWARDED_FOR', 'HTTP_FORWARDED', 'REMOTE_ADDR') as $key){
        if (array_key_exists($key, $_SERVER) === true){
            foreach (explode(',', $_SERVER[$key]) as $ip){
                $ip = trim($ip);

                if (filter_var($ip, FILTER_VALIDATE_IP, FILTER_FLAG_NO_PRIV_RANGE | FILTER_FLAG_NO_RES_RANGE) !== false){
                    return $ip;
                }
            }
        }
    }
    return "0.0.0.0";
}