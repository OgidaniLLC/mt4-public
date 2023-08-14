# [MT4/5][TradesTotal.mq4/5](.)

1. OrdersTotal()がMT4/MT5で挙動に差があるためのMQL共通化を考えたコード

## ソース説明

1. TradesTotal()を定義して代替として利用する
1. OrderSelect()の共通化に課題が残っているため可読性が低い

## インタフェース
__*int TradesTotal(int& iNumPositions, int& iNumOrders)*__
 
__[Param]__
 
*iNumPositons* ：ポジション数 [o]
 
*iNumOrders* ：オーダー数 [o]
 
__[Return]__
 
ポジションとオーダーの合計数
## include
[TradesLib.mqh](../../../Include/CommonSourceProject/TradesLib.mqh)
## History
Ver1.01 2023/08/14　エラー処理追加
 
Ver1.00 2023/08/14　新規作成