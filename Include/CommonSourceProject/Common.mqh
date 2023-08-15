//+------------------------------------------------------------------+
//|                                                       Common.mqh |
//|                                      Copyright 2023, OgidaniLLC. |
//|                                          https://www.ogidani.com |
//+------------------------------------------------------------------+
//////////////////////////////////////////////////////////////////////
//	MQL5
#ifdef __MQL5__		//__MQL5__
#define IsDemo()			((bool)AccountInfoInteger(ACCOUNT_TRADE_MODE) == ACCOUNT_TRADE_MODE_DEMO)
#define IsTesting()			((bool)MQLInfoInteger(MQL_TESTER))

#define OP_BUY				((int)ORDER_TYPE_BUY)
#define OP_SELL				((int)ORDER_TYPE_SELL)
#define OP_BUYLIMIT			((int)2)
#define OP_SELLLIMIT		((int)3)
#define OP_BUYSTOP			((int)4)
#define OP_SELLSTOP			((int)5)
#define MODE_TRADES 0
#define MODE_HISTORY 1
#define SELECT_BY_POS 0
#define SELECT_BY_TICKET 1
//////////////////////////////////////////////////////////////////////
//	MQL4
#else				//__MQL4__
#endif
//////////////////////////////////////////////////////////////////////
//	共通
//////////////////////////////////////////////////////////////////////
// ログ出力マクロ
#define LOG(Message, Val)	(Error(__FUNCTION__ + "(" __FILE__ + ":" + IntegerToString(__LINE__) + ") : " + Message, Val, 0))
#define INF(Message, Val)	(Error(__FUNCTION__ + "(" __FILE__ + ":"  + IntegerToString(__LINE__) + ") : " + Message, Val, 1))
#define ERR(Message, Val)	(Error(__FUNCTION__ + "(" __FILE__ + ":"  + IntegerToString(__LINE__) + ") : " + Message, Val, 2, true))
void Error(const string strError, double dVal, int iKind, bool bIsErr = false)
{
	if (bIsErr) {
		int iError = GetLastError();
		Print("■■ ERR : #", iError, " :", strError, " :", dVal);
	} else {
		if (1 == iKind) {
			Print("●○ INF : ", strError, " :", dVal);
		} else if (IsTesting() || IsDemo()) {
			Print("●● LOG : ", strError, " :", dVal);
		}
	}
}
#include "Variables.mqh"
#include "TradeLib.mqh"
#include "PositionLib.mqh"
#include "OrderLib.mqh"
