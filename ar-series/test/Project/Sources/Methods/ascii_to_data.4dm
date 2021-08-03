//%attributes = {"invisible":true,"preemptive":"capable"}
C_TEXT:C284($1;$ascii)
C_BLOB:C604($0;$byte;$data)

$ascii:=$1

C_LONGINT:C283($pos;$len)

SET BLOB SIZE:C606($byte;1)

$i:=1

While (Match regex:C1019("[:ascii:]";$ascii;$i;$pos;$len))
	
	$byte{0}:=Character code:C91(Substring:C12($ascii;$pos;$len))
	
	COPY BLOB:C558($byte;$data;0;BLOB size:C605($data);1)
	
	$i:=$pos+$len
	
End while 

$0:=$data