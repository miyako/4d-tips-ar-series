//%attributes = {"invisible":true,"preemptive":"capable"}
C_POINTER:C301($1)
C_VARIANT:C1683($2)
C_LONGINT:C283($3)

$valueType:=Value type:C1509($2)

C_BLOB:C604($value)

Case of 
	: ($valueType=Is text:K8:3)
		$value:=ascii_to_data ($2)
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
			: ($byte=This:C1470.CONTROLS.STX)
			: ($byte=This:C1470.CONTROLS.ETX)
			: ($byte>0x007E)
			: ($byte=0x0000)
			Else 
				This:C1470.append($1;$byte)
		End case 
	End for 
End if 