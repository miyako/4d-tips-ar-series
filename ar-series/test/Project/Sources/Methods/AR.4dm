//%attributes = {"invisible":true,"preemptive":"capable"}
C_OBJECT:C1216($0;$EXPORT)

$EXPORT:=New object:C1471

$CONTROLS:=New object:C1471

$EXPORT.CONTROLS:=$CONTROLS

$CONTROLS.STX:=0x0002  //テキスト開始符号
$CONTROLS.ETX:=0x0003  //テキスト終了符号
$CONTROLS.ACK:=0x0006  //正常応答
$CONTROLS.NAK:=0x0015  //再送要求
$CONTROLS.DLE:=0x0010  //拒否応答
$CONTROLS.LF:=0x000A  //印字行の改行
$CONTROLS.ESC:=0x001B  //エスケープシーケンスの開始

$CONTROLS.BACKSLASH:=0x005C
$CONTROLS.Q:=0x0051
$CONTROLS.C:=0x0043
$CONTROLS.J:=0x004A
$CONTROLS.R:=0x0052
$CONTROLS.W:=0x0057
$CONTROLS.V:=0x0056
$CONTROLS.Z:=0x005A
$CONTROLS.P:=0x0050
$CONTROLS.LEFTSQUAREBRACKET:=0x005B

$CONST:=New object:C1471
$CONST.OK:=0x0020
$CONST.COMMA:=Character code:C91(",")

$EXPORT.CONST:=$CONST

If (False:C215)
	
	  //VisualCard constants
	
	  //State
	$CONST.SMJ_S_CLOSED:=1
	$CONST.SMJ_S_IDLE:=2
	$CONST.SMJ_S_BUSY:=3
	$CONST.SMJ_S_ERROR:=4
	$CONST.SMJ_S_CLEAR:=5
	$CONST.SMJ_S_TIMEOUT:=6
	
	  //ResultCode
	$CONST.SMJ_ERROR:=100
	$CONST.SMJ_E_CLOSED:=1+$CONST.SMJ_ERROR
	$CONST.SMJ_E_NOTCLAIMED:=2+$CONST.SMJ_ERROR
	$CONST.SMJ_E_ILLEGAL:=3+$CONST.SMJ_ERROR
	$CONST.SMJ_E_NOCONTROL:=4+$CONST.SMJ_ERROR
	$CONST.SMJ_E_NOHARDWARE:=5+$CONST.SMJ_ERROR
	$CONST.SMJ_E_CLEAR:=6+$CONST.SMJ_ERROR
	$CONST.SMJ_E_TIMEOUT:=7+$CONST.SMJ_ERROR
	$CONST.SMJ_E_BUSY:=8+$CONST.SMJ_ERROR
	$CONST.SMJ_E_NOBUSY:=9+$CONST.SMJ_ERROR
	$CONST.SMJ_E_DSR_BUSY:=10+$CONST.SMJ_ERROR
	
End if 

$ERROR:=New collection:C1472
$ERROR.push(New object:C1471("code";0x0022;"rank";"C";"description";"処理対象カード無し"))
$ERROR.push(New object:C1471("code";0x0023;"rank";"C";"description";"磁気ストライプ無し(逆差し等)または、その他のエラー"))
$ERROR.push(New object:C1471("code";0x0031;"rank";"B";"description";"パリティエラー"))
$ERROR.push(New object:C1471("code";0x0032;"rank";"B";"description";"開始符号/終了符号なし"))
$ERROR.push(New object:C1471("code";0x0033;"rank";"B";"description";"LRCエラー"))
$ERROR.push(New object:C1471("code";0x0034;"rank";"B";"description";"異常キャラクタ"))
$ERROR.push(New object:C1471("code";0x0037;"rank";"B";"description";"磁気ストライプ書込エラー"))
$ERROR.push(New object:C1471("code";0x0038;"rank";"B";"description";"カードジャム"))
$ERROR.push(New object:C1471("code";0x0040;"rank";"B";"description";"カバーOPEN"))
$ERROR.push(New object:C1471("code";0x0041;"rank";"C";"description";"無効コマンド"))
$ERROR.push(New object:C1471("code";0x0042;"rank";"A";"description";"カムモータ異常"))
$ERROR.push(New object:C1471("code";0x0043;"rank";"A";"description";"イレースヘッド温度異常"))
$ERROR.push(New object:C1471("code";0x0045;"rank";"A";"description";"EEPROMエラー"))
$ERROR.push(New object:C1471("code";0x004C;"rank";"C";"description";"不適合BMPファイルデータ"))
$ERROR.push(New object:C1471("code";0x0051;"rank";"C";"description";"展開バッファオーバーフロー"))

$EXPORT.ERROR:=$ERROR

$EXPORT.asChar:=Formula:C1597(Character code:C91(String:C10(Int:C8($1))))
$EXPORT.asCode:=Formula:C1597(Character code:C91(String:C10($1)))

$EXPORT.read:=Formula:C1597(exec (0x0074;$1;$2))
$EXPORT.readEx:=Formula:C1597(exec (0x0078;$1;$2))
$EXPORT.readBuffer:=Formula:C1597(exec (0x007C;$1;$2))

$EXPORT.readAuto:=Formula:C1597(exec (0x0072))
$EXPORT.readAutoEx:=Formula:C1597(exec (0x0076))
$EXPORT.readAutoBuffer:=Formula:C1597(exec (0x007A))


$EXPORT.disableCleaning:=Formula:C1597(exec (0x005B;0))
$EXPORT.enableCleaning:=Formula:C1597(exec (0x005B;1))

$EXPORT.startCleaning:=Formula:C1597(exec (0x0052))
$EXPORT.resetDevice:=Formula:C1597(exec (0x005F))

$EXPORT.setMode:=Formula:C1597(exec (0x0090;$1;$2))
$EXPORT.setSerialNumber:=Formula:C1597(exec (0x0090;"U";$1))

$EXPORT.setOption:=Formula:C1597(exec (0x0091;$1;$2))

If (True:C214)
	
	$EXPORT.setFullWidth:=Formula:C1597(exec (0x0091;"J";0))
	$EXPORT.setHalfWidth:=Formula:C1597(exec (0x0091;"J";1))
	$EXPORT.setNarrow:=Formula:C1597(exec (0x0091;"B";0))
	$EXPORT.setBold:=Formula:C1597(exec (0x0091;"B";1))
	$EXPORT.setTrack:=Formula:C1597(exec (0x0091;"C";$1))
	$EXPORT.setPortrait:=Formula:C1597(exec (0x0091;"P";1))
	$EXPORT.setLandscape:=Formula:C1597(exec (0x0091;"P";0))
	$EXPORT.setReadingRetry:=Formula:C1597(exec (0x0091;"R";$1))
	$EXPORT.setWritingRetry:=Formula:C1597(exec (0x0091;"W";$1))
	$EXPORT.setCleaning:=Formula:C1597(exec (0x0091;"U";$1))
	$EXPORT.setFullWidthPitch:=Formula:C1597(exec (0x0091;"D";$1))
	$EXPORT.setHalfWidthPitch:=Formula:C1597(exec (0x0091;"d";$1))
	$EXPORT.setLineSpacing:=Formula:C1597(exec (0x0091;"M";$1))
	$EXPORT.setInterfaceMode:=Formula:C1597(exec (0x0091;"L";$1))
	$EXPORT.restoreFactorySettings:=Formula:C1597(exec (0x0091;"Z";0))
	$EXPORT.setReadingDirection:=Formula:C1597(exec (0x0091;"K";$1))
	$EXPORT.setWritingFormat:=Formula:C1597(exec (0x0091;"E";$1))
	
End if 

If (False:C215)
	
	$EXPORT.writeRL:=Formula:C1597(make_request (0x0036;$1))
	$EXPORT.writeLR:=Formula:C1597(make_request (0x0039;$1))
	$EXPORT.write:=Formula:C1597(make_request (0x003C;$1))
	$EXPORT.waitAndWrite:=Formula:C1597(make_request (0x0031;$1))
	$EXPORT.waitAndWriteEx:=Formula:C1597(make_request (0x0032;$1))
	
	$EXPORT.clearPrintBuffer:=Formula:C1597(make_request (0x0040))
	$EXPORT.clearBuffer:=Formula:C1597(make_request (0x0049))
	
	$EXPORT.setBuffer:=Formula:C1597(make_request (0x0041;$1))
	$EXPORT.setImageBuffer:=Formula:C1597(make_request (0x0043;$1;$2;$3))
	
End if 

  //member methods

$EXPORT.append:=Formula:C1597(append_data )
$EXPORT.appendEx:=Formula:C1597(append_data_with_size )
$EXPORT.close:=Formula:C1597(close_data )
$EXPORT.parse:=Formula:C1597(parse_response )

  //properties 

$EXPORT.deviceName:="SMJ USB Device"

$0:=$EXPORT