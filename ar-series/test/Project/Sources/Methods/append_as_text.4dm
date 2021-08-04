//%attributes = {"invisible":true,"preemptive":"capable"}
C_POINTER:C301($1)
C_VARIANT:C1683($2)
C_LONGINT:C283($3)

$value:=String:C10($2)

If (Count parameters:C259>2)
	$maxLength:=$3
	If (Length:C16($value)>$maxLength)
		$value:=Substring:C12($value;1;$maxLength)
	End if 
End if 

For ($i;1;Length:C16($value))
	$byte:=Character code:C91($value[[$i]])
	Case of 
		: ($byte=This:C1470.CONTROLS.STX)
		: ($byte=This:C1470.CONTROLS.ETX)
		: ($byte>0x007E)
		: ($byte=0x0000)
		Else 
			This:C1470.append($1;$byte)
	End case 
	
End for 

C_OBJECT:C1216($0)

$0:=This:C1470