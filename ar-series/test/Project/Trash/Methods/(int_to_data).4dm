//%attributes = {"invisible":true,"preemptive":"capable"}
C_LONGINT:C283($1;$int;$2;$digits)
C_TEXT:C284($hex)
C_BLOB:C604($0;$bytes)

$int:=$1
$digits:=Abs:C99($2)

$hex:=int_to_hex ($int;$digits)

$data:=hex_to_data ($hex)

  //下位バイトから送信

SET BLOB SIZE:C606($bytes;BLOB size:C605($data))

For ($i;1;BLOB size:C605($data))
	
	$bytes{$i-1}:=$data{BLOB size:C605($data)-$i}
	
End for 

$0:=$bytes