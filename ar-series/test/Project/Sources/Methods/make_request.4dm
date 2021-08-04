//%attributes = {"invisible":true}
C_LONGINT:C283($1;$command)
C_VARIANT:C1683(${2})

$command:=$1

C_BLOB:C604($0;$request)

Case of 
	: ($command=0x0074) | ($command=0x0078) | ($command=0x007C)
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.asChar($2))\
			.append(->$request;This:C1470.CONST.COMMA)\
			.append(->$request;This:C1470.asChar($3))\
			.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
		
	: ($command=0x0072) | ($command=0x0076) | ($command=0x007A)
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
		
	: ($command=0x0036) | ($command=0x0039) | ($command=0x003C) | ($command=0x0031) | ($command=0x0032)
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.appendEx(->$request;$2;69)\
			.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
		
	: ($command=0x0040)  //印字展開バッファクリアコマンド
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.CONTROLS.ETX)\
			.append(->$request;This:C1470.CONTROLS.C)
		
	: ($command=0x0049)  //バッファクリアコマンド
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.CONTROLS.ETX)\
			.append(->$request;This:C1470.CONTROLS.J)
		
	: ($command=0x0041)  //印字データ設定コマンド
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)
		
		$countParams:=Count parameters:C259
		
		If ($countParams>4)
			
			This:C1470.append(->$request;This:C1470.asChar($3))\
				.append(->$request;This:C1470.CONST.COMMA)\
				.appendNumeric(->$request;$4)\
				.append(->$request;This:C1470.CONST.COMMA)\
				.appendNumeric(->$request;This:C1470.asChar($5))\
				.append(->$request;This:C1470.CONST.COMMA)
			
		End if 
		
		C_BLOB:C604($data)
		$value:=String:C10($2)
		
		ON ERR CALL:C155("generic_error_method")
		CONVERT FROM TEXT:C1011($value;"windows-31j";$data)
		ON ERR CALL:C155("")
		
		This:C1470.appendText(->$request;$data).append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
		
	: ($command=0x0043)  //外部イメージデータの展開コマンド(ラインモード)
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.appendNumeric(->$request;$2)\
			.append(->$request;This:C1470.CONST.COMMA)\
			.appendNumeric(->$request;$3)\
			.append(->$request;This:C1470.CONST.COMMA)\
			.appendText(->$request;This:C1470.asImage($4))\
			.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
		
	: ($command=0x0044)  //全角外字フォント登録コマンド
		
		  //not implemented
		
	: ($command=0x0045)  //半角外字フォント登録コマンド
		
		  //not implemented
		
	: ($command=0x0046)  //消去+印字→排出コマンド
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)
		
		$countParams:=Count parameters:C259
		
		Case of 
			: ($countParams=1)
				
				This:C1470.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
				
			: ($countParams=2)
				
				This:C1470.append(->$request;This:C1470.asChar($2))\
					.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
				
			: ($countParams=3)
				
				This:C1470.append(->$request;This:C1470.asChar($2))\
					.append(->$request;This:C1470.CONST.COMMA)\
					.append(->$request;This:C1470.asChar($3))\
					.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
				
			Else 
				
				This:C1470.append(->$request;This:C1470.asChar($2))\
					.append(->$request;This:C1470.CONST.COMMA)\
					.append(->$request;This:C1470.asChar($3))\
					.append(->$request;This:C1470.CONST.COMMA)\
					.append(->$request;This:C1470.asChar($4))\
					.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
				
		End case 
		
	: ($command=0x0047) | ($command=0x0048) | ($command=0x0050)
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.asChar($2))\
			.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
		
	: ($command=0x004D)  //外部データ展開コマンド(ブロックモード)
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.appendNumeric(->$request;$2)\
			.append(->$request;This:C1470.CONST.COMMA)\
			.appendNumeric(->$request;$3)\
			.append(->$request;This:C1470.CONST.COMMA)\
			.appendNumeric(->$request;$4)\
			.append(->$request;This:C1470.CONST.COMMA)\
			.appendText(->$request;This:C1470.asImage($5))\
			.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
		
	: ($command=0x004E)  //バーコードデータ設定コマンド
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.appendNumeric(->$request;$2)\
			.append(->$request;This:C1470.CONST.COMMA)\
			.appendNumeric(->$request;$3)\
			.append(->$request;This:C1470.CONST.COMMA)\
			.append(->$request;This:C1470.asChar($4))\
			.append(->$request;This:C1470.CONST.COMMA)\
			.appendText(->$request;$5)\
			.append(->$request;This:C1470.CONST.COMMA)
		
		$barcodeType:=Int:C8($4)
		
		Case of 
			: ($barcodeType=This:C1470.BARCODE.CODE128) | ($barcodeType=This:C1470.BARCODE.CODE128_EX)
				
				This:C1470.appendBarcode(->$request;$6;11)
				
			: ($barcodeType=This:C1470.BARCODE.CODE39) | ($barcodeType=This:C1470.BARCODE.CODE39_EX)
				
				This:C1470.appendText(->$request;$6;10)
				
			: ($barcodeType=This:C1470.BARCODE.ITF) | ($barcodeType=This:C1470.BARCODE.ITF_EX)
				
				This:C1470.appendText(->$request;$6;20)
				
			: ($barcodeType=This:C1470.BARCODE.CODABAR) | ($barcodeType=This:C1470.BARCODE.CODABAR_EX)
				
				This:C1470.appendText(->$request;$6;13)
				
		End case 
		
		  //set barcode data here
		
		This:C1470.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
		
	: ($command=0x0053)  //カード前方待機コマンド
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.CONTROLS.ETX)\
			.append(->$request;This:C1470.CONTROLS.P)
		
	: ($command=0x0051)  //カード後方待機コマンド
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.CONTROLS.ETX)\
			.append(->$request;This:C1470.CONTROLS.R)
		
	: ($command=0x0054)  //カード挿入待ち状態解除コマンド
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.CONTROLS.ETX)\
			.append(->$request;This:C1470.CONTROLS.W)
		
	: ($command=0x0055)  //カード引き抜き待ち状態解除コマンド
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.CONTROLS.ETX)\
			.append(->$request;This:C1470.CONTROLS.V)
		
	: ($command=0x0059)  //ステータス要求コマンド
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.CONTROLS.ETX)\
			.append(->$request;This:C1470.CONTROLS.Z)
		
	: ($command=0x0058)  //ROMバージョン要求コマンド
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.CONTROLS.ETX)\
			.append(->$request;This:C1470.CONTROLS.LEFTSQUAREBRACKET)
		
	: ($command=0x005A)  //LED、ブザー制御コマンド
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.asCode($option))\
			.append(->$request;This:C1470.asChar($2))\
			.append(->$request;This:C1470.asChar($3))\
			.append(->$request;This:C1470.asChar($4))\
			.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
		
	: ($command=0x0095) | ($command=0x0096)
		
		  //デ-タ列は10桁
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.asChar(0))\
			.append(->$request;This:C1470.asChar(0))\
			.append(->$request;This:C1470.asChar(0))\
			.append(->$request;This:C1470.asChar(0))\
			.append(->$request;This:C1470.asChar(0))\
			.append(->$request;This:C1470.asChar(0))\
			.append(->$request;This:C1470.asChar(0))\
			.append(->$request;This:C1470.asChar(0))\
			.append(->$request;This:C1470.asChar(0))\
			.append(->$request;This:C1470.asChar(0))\
			.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
		
	: ($command=0x005B)  //クリーニングボタン有効/無効コマンド
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.asChar($2))\
			.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
		
	: ($command=0x0052)  //クリーニングコマンド
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.CONTROLS.ETX)\
			.append(->$request;This:C1470.CONTROLS.Q)
		
	: ($command=0x005F)  //リセットコマンド
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.CONTROLS.ETX)\
			.append(->$request;This:C1470.CONTROLS.BACKSLASH)
		
	: ($command=0x0090)  //通信設定コマンド
		
		This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
			.append(->$request;$command)\
			.append(->$request;This:C1470.asCode($2))\
			.append(->$request;This:C1470.asChar($3))\
			.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
		
	: ($command=0x0091)  //各種設定コマンド
		
		$option:=String:C10($2)
		
		Case of 
			: ($option="D") | ($option="M") | ($option="E")
				
				This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
					.append(->$request;$command)\
					.append(->$request;This:C1470.asCode($option))
				
				$value:=String:C10($3)
				
				For ($i;1;Length:C16($value))
					This:C1470.append(->$request;This:C1470.asCode($value[[$i]]))
				End for 
				
				This:C1470.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
				
			Else 
				
				This:C1470.append(->$request;This:C1470.CONTROLS.STX)\
					.append(->$request;$command)\
					.append(->$request;This:C1470.asCode($option))\
					.append(->$request;This:C1470.asChar($3))\
					.append(->$request;This:C1470.CONTROLS.ETX).close(->$request)
				
		End case 
		
End case 

$0:=$request