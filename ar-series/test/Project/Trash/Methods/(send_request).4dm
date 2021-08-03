//%attributes = {"invisible":true}
C_BLOB:C604($1;$request)

$request:=$1

C_BLOB:C604($response)

C_OBJECT:C1216($0;$status)

$status:=New object:C1471("success";False:C215)

If (This:C1470.call($request;$response).success)
	
	$status:=This:C1470.parse($request;$response)
	
End if 

$0:=$status