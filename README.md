# 4d-tips-pnp
株式会社ムーブ社製AR100およびAR200を制御するには

### ドライバーをインストールする

[ARシリーズダウンロードサイト | 株式会社ムーブ](https://www.move-p.jp/support/ardl.html)から**USBドライバー**をダウンロードします。

* USBドライバーを使用する理由

OCX (VisualCardOCX V1.9.0) は32-bit版しか提供されていません。4Dの32-bit版はv17を最後にサポートが終了しています。対応プラットフォームに64-bitも挙げられていますが，それはWOW64で32-bit版のアプリケーションが実行できるという意味に過ぎません。アプリケーションのウィンドウにActiveXコントロールを埋め込んで32-bit版のOCXを使用できるのは，飽くまで32-bit版のアプリケーションに限られます。64-bit版のOCXが提供されていない場合，4DのウインドウからOCXを制御することはできません。

コマンドプロンプトを**管理者として実行**して下記のコマンドを入力します。

```
cd {USBVendorClassDriver/のパス}
pnputil  /add-driver SMJUSBCOM.inf /install
````

### 実機（プラグイン＆プレイ）なしで新しいデバイスを追加する

コマンドプロンプトを**管理者として実行**して下記のコマンドを入力します。

```
hdwwiz.exe
````

<img width="292" alt="1" src="https://user-images.githubusercontent.com/1725068/127724920-db81af2b-185a-4e4c-9388-3c6a32f7455e.png">
<img width="292" alt="2" src="https://user-images.githubusercontent.com/1725068/127724921-f51ddd3c-4a9c-4e54-bf67-5e127566d7e2.png">
<img width="292" alt="3" src="https://user-images.githubusercontent.com/1725068/127724931-1f80df6a-40a9-4116-b9bf-6f2baa3af675.png">
<img width="292" alt="4" src="https://user-images.githubusercontent.com/1725068/127724933-4482f885-925d-4da8-b30b-4b08cc94359c.png">
<img width="292" alt="5" src="https://user-images.githubusercontent.com/1725068/127724941-02d319cf-bd92-4e9e-9159-edf597e81388.png">
<img width="292" alt="6" src="https://user-images.githubusercontent.com/1725068/127724944-d400301c-00e6-4895-8ba5-7c811a365a73.png">
