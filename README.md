# Hello Crystal
## Crystal

[Crystal Docs](http://ja.crystal-lang.org/docs/)

## コンパイラを使用する
実行コマンド
```
$ crystal some_program.cr
```

実行ファイルの作成
```
$ crystal build some_program.cr
$ ./some_program
```

標準ディレクトリを持ったCrystalプロジェクトの作成
```
$ crystal init lib MyCoolLib
```

## Hello World!
Crystalはプログラム自体がメインルーチン

## HTTPサーバーを使用する
公式の[HTTPサーバー](http://ja.crystal-lang.org/docs/overview/http_server.html)の例を実行する

しかし、以下のバージョンではErrorが発生する
- Crystal : 0.24.2 (2018-03-10)
```
Package libssl was not found in the pkg-config search path.
Perhaps you should add the directory containing `libssl.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libssl' found
Package libcrypto was not found in the pkg-config search path.
Perhaps you should add the directory containing `libcrypto.pc'
to the PKG_CONFIG_PATH environment variable
No package 'libcrypto' found
```

### 解決策
```
$ brew intsall openssl
```

`.zshrc`または、`.bashrc`に以下を記述
```
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig
```

## Amber
CrystalのWebフレームワーク。
オブジェクト指向のパラダイムを利用してMVCパターンを実装する。
Phoenix、Ruby on Rails、Djangoに影響を受けている。

### Quick Start
```
$ brew install amber
```

```
amber new pet-tracker
cd pet-tracker
shards install
amber generate scaffold Pet name:string breed:string age:integer
amber db create migrate
amber watch
```

http://0.0.0.0:300にアクセス
