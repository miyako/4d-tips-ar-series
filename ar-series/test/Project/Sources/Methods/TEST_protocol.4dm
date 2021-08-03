//%attributes = {"invisible":true}
$AR:=AR 

$request:=Formula:C1597(make_request (0x0074;1;1)).call($AR)

C_BLOB:C604($response)
SET BLOB SIZE:C606($response;6)
$response{0}:=$AR.CONTROLS.STX
$response{1}:=0x0074
$response{2}:=0x0023
$response{3}:=0x0020
$response{4}:=0x0021
$response{5}:=$AR.CONTROLS.ETX
$AR.close(->$response)

$status:=$AR.parse($request;$response)
$data:=$status.getContent()
