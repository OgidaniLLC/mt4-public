//+------------------------------------------------------------------+
//|                                                       Common.mqh |
//|                                      Copyright 2023, OgidaniLLC. |
//|                                          https://www.ogidani.com |
//+------------------------------------------------------------------+
#ifdef __MQL5__
#define IsDemo()			((bool)AccountInfoInteger(ACCOUNT_TRADE_MODE) == ACCOUNT_TRADE_MODE_DEMO)
#define IsTesting()			((bool)MQLInfoInteger(MQL_TESTER))
#else	//__MQL4__
#endif
///////////////////////////////////////////////////////////////////////////////
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
#include "TradesLib.mqh"
