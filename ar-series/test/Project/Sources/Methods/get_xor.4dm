//%attributes = {"invisible":true,"preemptive":"capable"}
C_BLOB:C604($1;$data)

$data:=$1

C_BLOB:C604($BCC)
SET BLOB SIZE:C606($BCC;1)

For ($i;0;BLOB size:C605($data)-1)
	$BCC{0}:=$BCC{0} ^| $data{$i}
End for 

C_LONGINT:C283($0)

$0:=$BCC{0}