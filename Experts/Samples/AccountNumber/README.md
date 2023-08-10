# [MT4]AccountNumber.mq4

1. [口座認証をOnInit()でやると問題が起きる](https://twitter.com/FX_SysTradeEA/status/1686640548051083264)件に関連したソースです。
1. [AccountNumber()を使って口座認証すると重くなるか？](https://twitter.com/FX_SysTradeEA/status/1686749049477795840)で使用したソースです。

## ソース説明

1. MT4のプロファイリングで検証するためのソースです。
1. OnTick()での口座認証を毎回やったらどれくらいの処理時間を必要とするかを確認しています。
1. 60秒後にEAは強制終了するようにしています。
1. 処理時間の比較用にいくつかの関数を呼び出ししています。

## History
Ver1.00 2023/08/02　新規作成