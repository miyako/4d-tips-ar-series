//%attributes = {"invisible":true}
C_LONGINT:C283($1;$command)
C_VARIANT:C1683(${2})

$command:=$1

$options:=get_option ($command)

C_BLOB:C604($request;$response)

Case of 
	: ($command=0x0072) | ($command=0x0076) | ($command=0x007A) | ($command=0x005F) | ($command=0x0052) | ($command=0x0040) | ($command=0x0049) | ($command=0x0053) | ($command=0x0051) | ($command=0x0054) | ($command=0x0055) | ($command=0x0059) | ($command=0x0058) | ($command=0x0095) | ($command=0x0096)
		
		$request:=make_request ($command)
		
	: ($command=0x005B) | ($command=0x0036) | ($command=0x0039) | ($command=0x003C) | ($command=0x0031) | ($command=0x0032) | ($command=0x0047) | ($command=0x0048) | ($command=0x0050) | ($command=0x0041) | ($command=0x0096) | ($command=0x0095) | ($command=0x005A)
		
		$request:=make_request ($command;$2)
		
	: ($command=0x0090) | ($command=0x0091) | ($command=0x0074) | ($command=0x0078) | ($command=0x007C) | ($command=0x004E)
		
		$request:=make_request ($command;$2;$3)
		
	: ($command=0x0043) | ($command=0x0044) | ($command=0x0045) | ($command=0x005A) | ($command=0x0043)
		
		$request:=make_request ($command;$2;$3;$4)
		
	: ($command=0x004D) | ($command=0x0041)
		
		$request:=make_request ($command;$2;$3;$4;$5)
		
	: ($command=0x004E)
		
		$request:=make_request ($command;$2;$3;$4;$5;$6)
		
	: ($command=0x0046)
		
		$countParams:=Count parameters:C259
		
		Case of 
			: ($countParams=1)
				
				$request:=make_request ($command)
				
			: ($countParams=2)
				
				$request:=make_request ($command;$2)
				
			: ($countParams=3)
				
				$request:=make_request ($command;$2;$3)
				
			: ($countParams=4)
				
				$request:=make_request ($command;$2;$3;$4)
				
		End case 
		
End case 

$status:=New object:C1471("success";False:C215)

If ((SMJ Request (This:C1470.deviceName;$request;$response;$options)).success)
	
	$status:=This:C1470.parse($request;$response)
	
End if 

$0:=$status