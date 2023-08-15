//+------------------------------------------------------------------+
//|                                                CloseAllChart.mqX |
//|                                      Copyright 2023, OgidaniLLC. |
//|                                          https://www.ogidani.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, OgidaniLLC."
#property link      "https://www.ogidani.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
	for (long lChartID = ChartNext(0); lChartID > 0; lChartID = ChartNext(lChartID)) {
	   ChartClose(lChartID);
	}
}
