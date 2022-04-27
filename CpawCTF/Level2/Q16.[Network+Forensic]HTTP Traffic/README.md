# 問題文
HTTPはWebページを閲覧する時に使われるネットワークプロトコルである。  
ここに、とあるWebページを見た時のパケットキャプチャファイルがある。  
このファイルから、見ていたページを復元して欲しい。  
http_traffic.pcap

# 解答
与えられたpcapファイルのHTTPストリームからHTMLオブジェクトを復元します。

pcapをwiresharkで開いて『ファイル』→『オブジェクトをエクスポート』→『HTTP…』を選択
![](https://github.com/riko-teki/pictures/blob/main/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202021-10-26%20221003.png?raw=true)

『すべて保存』を選択して保存するディレクトリを選択するとオブジェクトがエクスポートされる。
![](https://github.com/riko-teki/pictures/blob/main/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202021-10-26%20221154.png?raw=true)

![](https://github.com/riko-teki/pictures/blob/main/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202021-10-26%20221415.png?raw=true)

今回なぜかhtmlファイルの拡張子が付与されなかったので自分で変更しました。

network100(1).htmlをブラウザで開いてみると一部表示が壊れたページが表示されました。
![](https://github.com/riko-teki/pictures/blob/main/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202021-10-26%20221647.png?raw=true)

表示される文章からボタンを押せればフラグが取得できるのでしょう。　　
ChromeDevToolでHTMLソースを見てみました。
![](https://github.com/riko-teki/pictures/blob/main/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202021-10-26%20221727.png?raw=true)

このソースから  
- imgの読み込み先 → ./img直下
- jsの読み込み先  → ./js直下
- cssの読み込み先 → ./css直下

ということが分かったのでその通りにjpg・js・cssファイルを配置します。　　
最終的なディレクトリ構成は下記の通りです。
![](https://github.com/riko-teki/pictures/blob/main/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202021-10-26%20223056.png?raw=true)

この状態で先ほどのHTMLをブラウザで開くと、ボタンと画像が表示され、ボタンを押すとフラグが表示されました。

