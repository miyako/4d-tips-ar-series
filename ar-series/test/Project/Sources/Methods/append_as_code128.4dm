//%attributes = {"invisible":true,"preemptive":"capable"}
C_POINTER:C301($1)
C_VARIANT:C1683($2)

$valueType:=Value type:C1509($2)

C_BLOB:C604($value)

Case of 
	: ($valueType=Is text:K8:3)
		ON ERR CALL:C155("generic_error_method")
		CONVERT FROM TEXT:C1011($2;"us-ascii";$value)
		ON ERR CALL:C155("")
	: ($valueType=Is BLOB:K8:12)
		$value:=$2
End case 

If (Count parameters:C259>2)
	$maxLength:=$3
	If (BLOB size:C605($value)>$maxLength)
		SET BLOB SIZE:C606($value;$maxLength)
	End if 
End if 

$len:=BLOB size:C605($value)

If ($len>0)
	For ($i;0;$len-1)
		$byte:=$value{$i}
		Case of 
			: ($byte>0x0066)
			: ($byte<0x0010)
			Else 
				This:C1470.appendText($1;int_to_hex ($byte;2))
		End case 
	End for 
End if 

C_OBJECT:C1216($0)

$0:=This:C1470