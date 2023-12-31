//+------------------------------------------------------------------+
//|                                                    BTLimiter.mq4 |
//|                                      Copyright 2023, OgidaniLLC. |
//|                                         https://www.ogidani.com/ |
//+------------------------------------------------------------------+
/*
変更歴
　V1.00 2023/08/01　新規作成
*/
#property copyright "Copyright 2023, OgidaniLLC."
#property link      "https://www.ogidani.com/"
#property version   "1.00"
#property strict
#property indicator_chart_window
//--- input parameters
sinput	int		InpSpeed = 1000;			//スピード調整（0：最速）
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
{
	for (int iLoopCnt = 0; InpSpeed * 100 > iLoopCnt; iLoopCnt++);
	return(rates_total);
}
