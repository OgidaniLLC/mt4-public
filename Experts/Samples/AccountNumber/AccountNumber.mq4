//+------------------------------------------------------------------+
//|                                                AccountNumber.mqX |
//|                                      Copyright 2023, OgidaniLLC. |
//|                                          https://www.ogidani.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, OgidaniLLC."
#property link      "https://www.ogidani.com"
#property version   "1.00"
#property strict

input int      InpAccountNumber = 0;         //口座番号

int OnInit()
{
	if (!EventSetTimer(10)) {
		return(INIT_FAILED);
	}
	return(INIT_SUCCEEDED);
}
void OnTimer()
{
	static int iCalls = 0;
	if (6 <= ++iCalls) {
		//EA終了させる
		ExpertRemove();
	}
}
void OnTick()
{
	int iAccount = (int)AccountInfoInteger(ACCOUNT_LOGIN);
	if (0 == iAccount) {
		//口座にログイン出来ていないためスキップ
	} else if (InpAccountNumber == iAccount) {
		//認証成功：処理継続
		int iNumPositions = OrdersTotal();     //MT4,5で挙動は違う
		double dAsk = SymbolInfoDouble(Symbol(), SYMBOL_ASK);
		double dHigh = iHigh(Symbol(), PERIOD_CURRENT, 0);
		datetime dtNowTime = TimeCurrent();
	} else {
		//認証エラー：EA終了させる
		ExpertRemove();
	}
}
