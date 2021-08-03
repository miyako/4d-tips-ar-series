//%attributes = {"invisible":true,"preemptive":"capable"}
C_LONGINT:C283($1;$int;$2;$digits)
C_TEXT:C284($0;$hex)

$int:=$1
$digits:=Abs:C99($2)

$hex:=("0"*$digits)+Substring:C12(String:C10($int;"&x");3)

$0:=Substring:C12($hex;Length:C16($hex)+1-$digits)