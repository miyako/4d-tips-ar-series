//%attributes = {"invisible":true}
C_LONGINT:C283($1;$command)

$command:=$1

C_OBJECT:C1216($0;$options)
$options:=New object:C1471

Case of 
	: ($command=0x0031) | ($command=0x0032)
		
		$options.readTimeout:=6000
		
	: ($command=0x0036) | ($command=0x0039) | ($command=0x003C) | ($command=0x0040)
		
		$options.readTimeout:=1000
		
	: ($command=0x0041)
		
		$options.readTimeout:=3000
		
	: ($command=0x0043)
		
		$options.readTimeout:=1000
		
	: ($command=0x0044)
		
		$options.readTimeout:=2000
		
	: ($command=0x0045)
		
		$options.readTimeout:=1000
		
	: ($command=0x0046) | ($command=0x0047) | ($command=0x0048)
		
		$options.readTimeout:=10000
		
	: ($command=0x0049)
		
		$options.readTimeout:=2000
		
	: ($command=0x004D)
		
		$options.readTimeout:=1000
		
	: ($command=0x004E)
		
		$options.readTimeout:=1000
		
	: ($command=0x0050) | ($command=0x0051)
		
		$options.readTimeout:=2000
		
	: ($command=0x0052)
		
		$options.readTimeout:=60000
		
	: ($command=0x0053)
		
		$options.readTimeout:=2000
		
	: ($command=0x0054) | ($command=0x0055) | ($command=0x0058) | ($command=0x0059) | ($command=0x005A) | ($command=0x005B)
		
		$options.readTimeout:=1000
		
	: ($command=0x005F)
		
		$options.readTimeout:=3000
		
	: ($command=0x0072) | ($command=0x0074) | ($command=0x0076) | ($command=0x0078) | ($command=0x007A) | ($command=0x007C)
		
		$options.readTimeout:=6000
		
	: ($command=0x0090) | ($command=0x0091) | ($command=0x0095) | ($command=0x0096)
		
		$options.readTimeout:=1000
		
End case 

$0:=$options