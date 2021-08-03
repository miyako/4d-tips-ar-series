//%attributes = {"invisible":true,"preemptive":"capable"}
C_BLOB:C604($1)
C_TEXT:C284($0;$hex)

For ($i;1;BLOB size:C605($1))
	
	$byte:=$1{$i-1}
	
	$value:=Substring:C12(String:C10($byte;"&x");3)
	$hex:=$hex+Substring:C12($value;Length:C16($value)-1)
	
End for 

$0:=$hex