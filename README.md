# FukauraOuiOSSPM

ふかうら王（やねうら王の深層学習版）をiOS向けのSwift Package Managerパッケージとしてビルドするスクリプト。

モデルは含まれていない。このパッケージを読み込むSwiftアプリ側に組み込んで、そのアドレスを渡す必要がある。アプリ側の実装: https://github.com/select766/FukauraOuiOS

パッケージ名は`YaneuraOuiOSSPM`となっている。

# ビルド

Xcode 15.3, cmake 3.29.0

```
git submodule init
git submodule update
cd build
./build.bash
```

# インターフェース変更

インターフェースとなる関数は `build/src/ios_main.cpp` に記述する。

関数シグネチャは `build/include/yaneuraou.h`及び`Sources/YaneuraOuiOSSPM/include/yaneuraou.h`に同じ内容を記述する。

ビルドするソースコードリスト、コンパイラオプションは `build/ios_{arm64,x86_64}/CMakeLists.txt` に記述する。(本当は１ファイルにまとめたいのだがcmakeの知識が足りないだけ)

# git　タグ

パッケージのバージョンはgitのタグで識別される。`1.2.3`のように3つの数字で表す。

`10.x`: C++側のsocketで直接外部と通信

`11.x`: Swift側にUSIメッセージを転送し、Swift側で外部と通信

# ライセンス

GPLv3 (やねうら王本体に従います)

ただし、 `ios.toolchain.cmake`([取得元](https://raw.githubusercontent.com/leetal/ios-cmake/master/ios.toolchain.cmake)) は修正BSDライセンス。
