# 4d-tips-ar-series
株式会社ムーブ社製AR100およびAR200を制御するには

## ドライバーをインストールする

* [ARシリーズダウンロードサイト | 株式会社ムーブ](https://www.move-p.jp/support/ardl.html)からスター精密株式会社の**USBドライバー**をダウンロードします。

使用したバージョン: `5.0.0.0` April 19, 2019

* USBドライバーを使用する理由

> OCX (VisualCardOCX V1.9.0) は32-bit版しか提供されていません。4Dの32-bit版はv17を最後にサポートが終了しています。VisualCardOCXの対応プラットフォームには64-bitも挙げられていますが，それはWOW64で32-bit版のアプリケーションが実行できるという意味に過ぎません。アプリケーションのウィンドウに[ActiveXコントロール](https://ja.wikipedia.org/wiki/ActiveX)を埋め込んで32-bit版のOCXを使用できるのは，飽くまで32-bit版のアプリケーションに限られます。64-bit版のOCXがベンダーから提供されていない場合，4DのウインドウからOCXを制御することはできません。ActiveXはInternet Explorerを想定したテクノロジーなので，今後，ベンダーが64-bit版のOCXを開発することは基本的にないものと思われます。

* コマンドプロンプトを**管理者として実行**して下記のコマンドを入力します。

```
cd {USBVendorClassDriver/のパス}
pnputil  /add-driver SMJUSBCOM.inf /install
````

## 実機（プラグイン＆プレイ）なしで新しいデバイスを追加する

* コマンドプロンプトを**管理者として実行**して下記のコマンドを入力します。

```
hdwwiz.exe
````

<img width="292" alt="1" src="https://user-images.githubusercontent.com/1725068/127724920-db81af2b-185a-4e4c-9388-3c6a32f7455e.png">
<img width="292" alt="2" src="https://user-images.githubusercontent.com/1725068/127724921-f51ddd3c-4a9c-4e54-bf67-5e127566d7e2.png">
<img width="292" alt="3" src="https://user-images.githubusercontent.com/1725068/127724931-1f80df6a-40a9-4116-b9bf-6f2baa3af675.png">
<img width="292" alt="4" src="https://user-images.githubusercontent.com/1725068/127724933-4482f885-925d-4da8-b30b-4b08cc94359c.png">
<img width="292" alt="5" src="https://user-images.githubusercontent.com/1725068/127724941-02d319cf-bd92-4e9e-9159-edf597e81388.png">
<img width="292" alt="6" src="https://user-images.githubusercontent.com/1725068/127724944-d400301c-00e6-4895-8ba5-7c811a365a73.png">

**デバイスマネージャー**に**SMJ USB Device**が追加されるはずです。

<img width="213" alt="7" src="https://user-images.githubusercontent.com/1725068/127725954-f722a44b-4e78-46a5-9b49-49f854df5dae.png">

デバイスを追加することにより，下記のWin32 APIをサポートする**仮想COMポート**が作られます。

* [CreateFile](https://docs.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-createfilew)  
* [GetCommTimeouts](https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-getcommtimeouts)  
* [SetCommTimeouts](https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-setcommtimeouts)  
* [WriteFile](https://docs.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-writefile)  
* [ReadFile](https://docs.microsoft.com/en-us/windows/win32/api/fileapi/nf-fileapi-readfile)  

## 仮想COMポートのポート番号を特定する

[仮想COMポートの情報を名称から検索する方法](https://stackoverflow.com/questions/1388871/how-do-i-get-a-list-of-available-serial-ports-in-win32)は少なくとも`9`あると言われています。

1. `CreateFile`で`1`から`255`を総当たりする
1. `QueryDosDevice`
1. `GetDefaultCommConfig`で`1`から`255`を総当たりする
1. `SetupDiGetClassDevs`
1. `EnumPorts`
1. `IWbemLocator`
1. `ComDBGetCurrentPortUsage` 
1. `GetCommPorts`
1. レジストリキー `HKEY_LOCAL_MACHINE\HARDWARE\DEVICEMAP\SERIALCOMM`

いくつかのAPIは，実際に接続されていないデバイスの仮想ポートは返さないかもしれません。

`SetupDiGetClassDevs`にフラグ`DIGCF_PRESENT`を**渡さなければ**デバイスマネージャーに登録されているだけの仮想ポートの情報も取得することができます。インタフェース情報は，デバイス名（たとえば"SMJ USB Device"）ポート番号（たとえば`COM3*）を特定するために必要です。
