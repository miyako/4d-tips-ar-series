//%attributes = {"invisible":true,"preemptive":"capable"}
C_POINTER:C301($1)

If (Value type:C1509($1->)=Is BLOB:K8:12)
	
	This:C1470.append($1;get_xor ($1->))
	
End if 

C_OBJECT:C1216($0)

$0:=This:C1470