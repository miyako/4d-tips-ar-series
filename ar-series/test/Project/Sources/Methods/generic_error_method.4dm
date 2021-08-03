//%attributes = {"invisible":true,"preemptive":"capable"}
$logsFolder:=Folder:C1567(fk logs folder:K87:17;*)

$errorStack:=New collection:C1472
$error:=New object:C1471("error";ERROR;"errorMethod";ERROR METHOD;"errorFormula";ERROR FORMULA;"errorLine";ERROR LINE;"errorStack";$errorStack)
$error.callChain:=Get call chain:C1662
$error.timestamp:=Timestamp:C1445

ARRAY LONGINT:C221($codes;0)
ARRAY TEXT:C222($components;0)
ARRAY TEXT:C222($messages;0)

GET LAST ERROR STACK:C1015($codes;$components;$messages)

For ($i;1;Size of array:C274($codes))
	$stack:=New object:C1471("code";$codes{$i};"component";$components{$i};"message";$messages{$i})
	$errorStack.push($stack)
End for 

$logsFolder.create()

$logFile:=$logsFolder.file(Current method name:C684+".log")

If (Not:C34($logFile.exists))
	$log:=New collection:C1472("[";JSON Stringify:C1217($error;*);"]").join("\n")
	$logFile.setText($log;"utf-8";Document with LF:K24:22)
Else 
	
	USE CHARACTER SET:C205(*)
	
	If ($logFile.size>1)
		
		$docRef:=Open document:C264($logFile.platformPath)
		
		If (OK=1)
			SET DOCUMENT POSITION:C482($docRef;Get document size:C479($docRef)-2)
			$log:=New collection:C1472(",";JSON Stringify:C1217($error;*);"]").join("\n")
			SEND PACKET:C103($docRef;$log)
			CLOSE DOCUMENT:C267($docRef)
		End if 
		
	End if 
	
End if 