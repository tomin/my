awk -F"[]/:[]" '
BEGIN {
  m2n["Jan"] =  1;  m2n["Feb"] =  2; m2n["Mar"] =  3; m2n["Apr"] =  4;
  m2n["May"] =  5;  m2n["Jun"] =  6; m2n["Jul"] =  7; m2n["Aug"] =  8;
  m2n["Sep"] =  9;  m2n["Oct"] = 10; m2n["Nov"] = 11; m2n["Dec"] = 12;
}
{
  if($4 != pyear || $3 != pmonth || $2 != pday) {
    pyear  = $4
    pmonth = $3
    pday   = $2

    if(fname != "")
      close(fname)

    fname  = sprintf("access_%04d_%02d_%02d.log", $4, m2n[$3], $2)
  }
  print > fname
}' access.log
