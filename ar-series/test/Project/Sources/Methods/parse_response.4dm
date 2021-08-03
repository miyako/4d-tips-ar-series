//%attributes = {"invisible":true,"preemptive":"capable"}
C_BLOB:C604($1;$request;$2;$response;$void)

C_OBJECT:C1216($0;$status)

$status:=New object:C1471("isValid";False:C215;"success";False:C215;"getContent";Formula:C1597($void))

$request:=$1
$response:=$2

$responseLength:=BLOB size:C605($response)

If ($responseLength>1)
	C_BLOB:C604($BCC)
	SET BLOB SIZE:C606($BCC;1)
	For ($i;0;$responseLength-2)
		$BCC{0}:=$BCC{0} ^| $response{$i}
	End for 
	If ($response{$responseLength-1}=$BCC{0})
		$status.isValid:=True:C214
	End if 
End if 

$requestLength:=BLOB size:C605($request)

If ($status.isValid)
	If ($requestLength>1) & ($responseLength>1)
		If ($response{1}=$request{1})
			$status.command:=int_to_hex ($request{1};2)
		End if 
	End if 
	
	If ($responseLength>2)
		$status.status:=$response{2}
		
		If ($status.status=This:C1470.CONST.OK)
			$status.success:=True:C214
		Else 
			$error:=This:C1470.ERROR.query("code === :1";$status.status)
			If ($error.length#0)
				$status.error:=$error[0]
			End if 
		End if 
		
		If ($responseLength>3)
			If ($response{0}=This:C1470.CONTROLS.STX) & ($response{$responseLength-2}=This:C1470.CONTROLS.ETX)
				C_BLOB:C604($data)
				COPY BLOB:C558($response;$data;3;0;$responseLength-5)
				$status.data:=data_to_hex ($data)
				$status.getContent:=Formula:C1597(hex_to_data (This:C1470.data))
			End if 
		End if 
	End if 
End if 

$0:=$status