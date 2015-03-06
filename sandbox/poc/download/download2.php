<?php
$file = 'bg.jpg';

    header('Content-type:application/force-download'); //告訴瀏覽器 為下載
    header('Content-Transfer-Encoding: Binary'); //編碼方式
    header('Content-Disposition:attachment;filename=' . $file); //檔名
    readfile($file);