//%attributes = {"invisible":true,"preemptive":"capable"}
C_BLOB:C604($1)
C_TEXT:C284($0;$value)

ON ERR CALL:C155("generic_error_method")
$value:=Convert to text:C1012($1;"us-ascii")
ON ERR CALL:C155("")

$0:=$value