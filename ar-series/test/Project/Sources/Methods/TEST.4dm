//%attributes = {}
C_BLOB:C604($request;$response)
C_OBJECT:C1216($options)
$options:=New object:C1471
$options.readTimeout:=100  //ms, default=1000
$options.writeTimeout:=100  //ms, default = 0
$options.writeTimeoutExtra:=100  //ms per byte, default = 0

$status:=SMJ Request ("通信ポート";$request;$response;$options)

$status:=SMJ Request ("SMJ USB Device")