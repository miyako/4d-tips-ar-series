//%attributes = {"invisible":true,"preemptive":"capable"}
C_TEXT:C284($1;$bits)
C_BLOB:C604($0;$byte;$data)

$bits:=$1

C_LONGINT:C283($pos;$len)

SET BLOB SIZE:C606($byte;1)

$i:=1

While (Match regex:C1019("[01]{8}";$bits;$i;$pos;$len))
	
	$value:=Substring:C12($bits;$pos;$len)
	$byte{0}:=0x0000
	
	For ($j;7;0;-1)
		
		$byte{0}:=$byte{0}+(Num:C11($value[[8-$j]]) << $j)
		
	End for 
	
	COPY BLOB:C558($byte;$data;0;BLOB size:C605($data);1)
	
	$i:=$pos+$len
	
End while 

$0:=$data