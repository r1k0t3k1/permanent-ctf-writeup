# 問題文
拡張子がないファイルを貰ってこのファイルを実行しろと言われたが、どうしたら実行出来るのだろうか。
この場合、UnixやLinuxのとあるコマンドを使ってファイルの種類を調べて、適切なOSで実行するのが一般的らしいが…
問題ファイル： exec_me

# 解答
問題文にある`UnixやLinuxのとあるコマンドを使ってファイルの種類を調べて、`  
という文が表しているのは恐らく`file`コマンドかと思います。
`file`はファイルタイプを判定するためのコマンドで表層解析に用いられます。

ターミナルで
```
$ file exec_me
```

とすると
```
exec_me: ELF 64-bit LSB executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.24, BuildID[sha1]=663a3e0e5a079fddd0de92474688cd6812d3b550, not stripped
```

と表示されます。
`ELF`とあることからUnixやLinuxの実行可能形式のファイルだということが分かりましたので
Linux環境で実行してみます。

```
$ ./exec_me
```

とするとフラグが表示されます。