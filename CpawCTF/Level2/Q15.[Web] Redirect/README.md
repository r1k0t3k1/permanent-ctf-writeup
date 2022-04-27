# 問題文
このURLにアクセスすると、他のページにリダイレクトされてしまうらしい。
果たしてリダイレクトはどのようにされているのだろうか…
http://q15.ctf.cpaw.site

※この問題のサーバへの攻撃はお止め下さい

# 解答
問題文にあるURLにアクセスするとQ9の問題WEBページが表示されます。  
ChromeDevToolでhttp通信を見てみるとhttp://q15.ctf.cpaw.siteにアクセスした際、
`302 Found`のレスポンスが返されています。

![DevTools](https://github.com/riko-teki/pictures/blob/main/%E3%82%B9%E3%82%AF%E3%83%AA%E3%83%BC%E3%83%B3%E3%82%B7%E3%83%A7%E3%83%83%E3%83%88%202021-10-26%20215519.png?raw=true)

このレスポンスの下の方を見ると`X-Flag`ヘッダーがあり、
その値にフラグが設定されています。

