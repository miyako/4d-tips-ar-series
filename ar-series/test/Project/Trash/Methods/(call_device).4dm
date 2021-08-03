//%attributes = {"invisible":true,"preemptive":"capable"}
C_BLOB:C604($1;$request;$2;$response)

$request:=$1
$response:=$2

C_OBJECT:C1216($options)
$options:=New object:C1471
$options.readTimeout:=100  //ms, default=1000
$options.writeTimeout:=100  //ms, default = 0
$options.writeTimeoutExtra:=100  //ms per byte, default = 0

$0:=SMJ Request (This:C1470.deviceName;$request;$response;$options)