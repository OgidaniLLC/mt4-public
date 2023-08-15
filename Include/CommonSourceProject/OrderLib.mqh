//+------------------------------------------------------------------+
//|														OrderLib.mqh |
//|										 Copyright 2023, OgidaniLLC. |
//|											 https://www.ogidani.com |
//+------------------------------------------------------------------+
//////////////////////////////////////////////////////////////////////
//	MQL5
#ifdef __MQL5__		//__MQL5__
///////////////////////////////////////////////////////////////////////////////
// 注文を選択する
bool OrderSelect(ulong iIndex, int iSelect, int iPool = MODE_TRADES)
{
	bool bResult = false;
	if (iPool == MODE_TRADES) {
		if (SELECT_BY_POS == iSelect) {
			bResult = OrderGetTicket((int)iIndex);
		} else if (SELECT_BY_TICKET == iSelect) {
			bResult = OrderSelect(iIndex);
		}
	} else {
		//MQL5では履歴から選択できないため失敗する
		//要改善項目（MQL4と動作が不一致）
	}
	return bResult;
}
///////////////////////////////////////////////////////////////////////////////
// オーダータイプ取得
int OrderType()
{
   long lOrdrType = OrderGetInteger(ORDER_TYPE);
	int OrderTypeTbl[8] = {
		OP_BUY,
		OP_SELL,
		OP_BUYLIMIT,
		OP_SELLLIMIT,
		OP_BUYSTOP,
		OP_SELLSTOP
	};
	return OrderTypeTbl[lOrdrType];
}
long OrderTicket()
{
	return OrderGetInteger(ORDER_TICKET);
}
//////////////////////////////////////////////////////////////////////
//	MQL4
#else				//__MQL4__
///////////////////////////////////////////////////////////////////////////////
// 約定済ポジション(未決済)を選択する
bool PositionSelect(ulong ulIndex, int iSelect, int iPool = MODE_TRADES)
{
	bool bResult = false;
	bResult = OrderSelect((int)ulIndex, iSelect, iPool);
	return bResult;
}
///////////////////////////////////////////////////////////////////////////////
// ポジションのチケット番号取得
long PotitionTicket()
{
	return (long)OrderTicket();
}
#endif
