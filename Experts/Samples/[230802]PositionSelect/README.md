# [MT4/5][PositionSelect.mq4/5](.)

1. オーダーとポジションを別けてOrderSelect()のMQL共通化を考えたコード

## ソース説明

1. オーダーの選択はOrderSelct()を利用する
1. ポジションの選択はPositioSelect()を利用する

## インタフェース
__*bool PositionSelect(int iIndex, int iSelect, int iPool = MODE_TRADES)*__  
__[Param]__  
*iIndex* ：ポジションリストの番号 [i]  
*iSelect* ：オーダー数 [i]  
　SELECT_BY_POS : 注文プールのインデックスをiIindexに指定する  
　SELECT_BY_TICKET : チケット番号をiIndexに指定する  
*iPool* ：注文プールの選択[i]  
　MODE_TRADES : 取引プールから注文を選択する  
　MODE_HISTORY : 履歴プールから注文を選択する
 
__[Return]__   
　true:成功  
　false:失敗

## include
[OrderLib.mqh](../../../Include/CommonSourceProject/OrderLib.mqh)  
[PositionLib.mqh](../../../Include/CommonSourceProject/PositionLib.mqh)

## History
Ver1.00 2023/08/16　新規作成