//%attributes = {"invisible":true,"preemptive":"capable"}
C_BLOB:C604($1)
C_LONGINT:C283($0;$value)

ON ERR CALL:C155("generic_error_method")
$ascii:=Convert to text:C1012($1;"us-ascii")
ON ERR CALL:C155("")

If (OK=1)
	
	C_LONGINT:C283($pos;$len)
	
	If (Match regex:C1019("[:Hex_Digit:]+";$ascii;1;$pos;$len))
		
		$value:=Formula from string:C1601("0x"+Substring:C12($ascii;$pos;$len)).call()
		
	End if 
	
End if 

$0:=$value