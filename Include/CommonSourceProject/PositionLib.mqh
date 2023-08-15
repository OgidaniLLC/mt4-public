//+------------------------------------------------------------------+
//|													 PositionLib.mqh |
//|										 Copyright 2023, OgidaniLLC. |
//|											 https://www.ogidani.com |
//+------------------------------------------------------------------+
//////////////////////////////////////////////////////////////////////
//	MQL5
#ifdef __MQL5__		//__MQL5__
///////////////////////////////////////////////////////////////////////////////
// 約定済ポジション(未決済)を選択する
bool PositionSelect(ulong ulIndex, int iSelect, int iPool = MODE_TRADES)
{
	bool bResult = false;
	if (MODE_TRADES == iPool) {
		if (SELECT_BY_TICKET == iSelect) {
			bResult = PositionSelectByTicket(ulIndex);
		} else {
			bResult = (0 == PositionGetTicket((int)ulIndex) ? false : true);
		}
	} else {
		//MQL5では履歴から選択できない
		//要改善項目（MQL4と動作が不一致）
	}
	return bResult;
}
///////////////////////////////////////////////////////////////////////////////
// ポジションのチケット番号取得
long PotitionTicket()
{
	return (long)PositionGetInteger(POSITION_TICKET);
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
