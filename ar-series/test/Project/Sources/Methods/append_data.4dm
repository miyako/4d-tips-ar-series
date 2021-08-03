//%attributes = {"invisible":true,"preemptive":"capable"}
C_POINTER:C301($1)

If (Value type:C1509($1->)=Is BLOB:K8:12)
	
	C_VARIANT:C1683($2)
	$valueType:=Value type:C1509($2)
	
	Case of 
		: ($valueType=Is BLOB:K8:12)
			
			COPY BLOB:C558($2;$1->;0;BLOB size:C605($1->);BLOB size:C605($2))
			
		: ($valueType=Is longint:K8:6) | ($valueType=Is real:K8:4) | ($valueType=Is integer:K8:5) | ($valueType=Is integer 64 bits:K8:25)
			
			C_BLOB:C604($byte)
			SET BLOB SIZE:C606($byte;1)
			$byte{0}:=$2
			
			COPY BLOB:C558($byte;$1->;0;BLOB size:C605($1->);BLOB size:C605($byte))
			
		: ($valueType=Is text:K8:3)
			
			C_BLOB:C604($bytes)
			$bytes:=This:C1470.fromHex($2)
			
			COPY BLOB:C558($bytes;$1->;0;BLOB size:C605($1->);BLOB size:C605($bytes))
			
	End case 
	
End if 

C_OBJECT:C1216($0)

$0:=This:C1470