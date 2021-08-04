//%attributes = {"invisible":true,"preemptive":"capable"}
C_POINTER:C301($1)

$value:=String:C10(Int:C8($2))

For ($i;1;Length:C16($value))
	This:C1470.append($1;This:C1470.asChar($value[[$i]]))
End for 

C_OBJECT:C1216($0)

$0:=This:C1470