//%attributes = {"invisible":true,"preemptive":"capable"}
C_BLOB:C604($1)
C_TEXT:C284($0;$bits)

For ($i;1;BLOB size:C605($1))
	
	$byte:=$1{$i-1}
	
	For ($j;7;0;-1)
		
		$bits:=$bits+Choose:C955($byte ?? $j;"1";"0")
		
	End for 
	
End for 

$0:=$bits