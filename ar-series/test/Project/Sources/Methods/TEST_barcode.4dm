//%attributes = {"invisible":true}
$AR:=AR 

C_BLOB:C604($barcode;$request)
SET BLOB SIZE:C606($barcode;5)
$barcode{0}:=0x0011
$barcode{1}:=0x0074
$barcode{2}:=0x0023
$barcode{3}:=0x0020
$barcode{4}:=0x0021

Formula:C1597(append_as_code128 ).call($AR;->$request;$barcode)
