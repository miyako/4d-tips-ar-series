//%attributes = {"invisible":true,"preemptive":"capable"}
C_TEXT:C284($1;$bits)
C_TEXT:C284($0;$ascii)

$bits:=$1

C_LONGINT:C283($pos;$len)

$i:=1

While (Match regex:C1019("[01]{4}";$bits;$i;$pos;$len))
	
	$value:=Substring:C12($bits;$pos;$len)
	$char:=0x0000
	
	For ($j;3;0;-1)
		
		$char:=$char+(Num:C11($value[[4-$j]]) << $j)
		
	End for 
	
	$ascii:=$ascii+String:C10($char)
	
	$i:=$pos+$len
	
End while 

$0:=$ascii