# 問題文
このファイルを開きたいが拡張子がないので、どのような種類のファイルで、どのアプリケーションで開けば良いかわからない。  
どうにかして、この拡張子がないこのファイルの種類を特定し、どのアプリケーションで開くか調べてくれ。  
問題ファイル： open_me

# 解答
拡張子がないファイルが与えられ、それを実行できればフラグが取得できそうです。
まず、`file`コマンドでファイルの種類を見てみます。

```
$ file open_me
```

結果はこのようになります。
```
open_me: Composite Document File V2 Document, Little Endian, Os: Windows, Version 10.0, Code page: 932, Author: v, Template: Normal.dotm, Last Saved By: v, Revision Number: 1, Name of Creating Application: Microsoft Office Word, Total Editing Time: 28:00, Create Time/Date: Mon Oct 12 04:27:00 2015, Last Saved Time/Date: Mon Oct 12 04:55:00 2015, Number of Pages: 1, Number of Words: 3, Number of Characters: 23, Security: 0
```

この文字列の中に
```
Name of Creating Application: Microsoft Office Word,
```
とありますのでWordでこのファイルが作成されたことが分かりました。  
Wordでこのファイルを開いてみるとフラグが記載してあります。

