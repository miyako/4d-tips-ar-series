//%attributes = {"invisible":true,"preemptive":"capable"}
C_LONGINT:C283($1;$int;$2;$digits)
C_TEXT:C284($ascii)
C_BLOB:C604($0)

$int:=$1
$digits:=Abs:C99($2)

$ascii:=("0"*$digits)+String:C10($int)

$ascii:=Substring:C12($ascii;Length:C16($ascii)+1-$digits)

$0:=ascii_to_data ($ascii)