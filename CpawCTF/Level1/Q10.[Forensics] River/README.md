# 問題文
JPEGという画像ファイルのフォーマットでは、  
撮影時の日時、使われたカメラ、位置情報など様々な情報(Exif情報)が付加されることがあるらしい。  
この情報から、写真に写っている川の名前を特定して欲しい。  
問題ファイル： river.jpg

# 解答
問題文から、与えられたjpeg画像のExif情報を確認します。  
今回はExif情報を確認するために`ImageMagick`というコマンドを使用します。
`ImageMagick`は画像を操作したり、画像の情報を表示したりする機能があります。

### インストール
```
$ apt install imagemagick
```

### Exif情報の表示
```
// -verboseオプションで詳細表示
$ identify -verbose river.jpg
```

すると、exif情報の中にGPS位置情報に関するデータがあることがわかります。  
`GPSLatitude  → 緯度`  
`GPSLongitude → 経度`

```
exif:GPSInfo: 638
exif:GPSLatitude: 31/1, 35/1, 69/25
exif:GPSLatitudeRef: N
exif:GPSLongitude: 130/1, 32/1, 64659/1250
exif:GPSLongitudeRef: E
exif:GPSVersionID: 2, 3, 0, 0
```

この情報を少数に変換してからgoogleMap等、地図アプリで検索します。
```
31°35'2.76"N 130°32'51.7272"E
```

そうすると、鹿児島のとある川に架かる橋の上にピンが置かれます。  
フラグはこの川の名前だったので川の名前をローマ字表記したものがそれになります。