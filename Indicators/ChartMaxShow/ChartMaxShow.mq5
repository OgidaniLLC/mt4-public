//+------------------------------------------------------------------+
//|                                                 ChartMaxShow.mqX |
//|                                      Copyright 2023, OgidaniLLC. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright	"Copyright 2023, OgidaniLLC."
#property link      "https://www.ogidani.com"
#property version   "1.01"
#property strict
#property indicator_chart_window
#property indicator_buffers 0
#property indicator_plots   0
#ifdef __MQL5__
#include <WinAPI\Winuser.mqh>
#else 
#include <Winuser32.mqh>
#endif
sinput bool InpSClick = false;    //Single click mode
sinput uint InpInterval = 250;    //Double click interval
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
	if (!CanUseDlls()) {
		return INIT_FAILED; 
	}
	DeleteDataName();
	return(INIT_SUCCEEDED);
}
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
	return(rates_total);
}
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
					const long &lparam,
					const double &dparam,
					const string &sparam)
{
	if (CHARTEVENT_CLICK == id) {
		if (IsChangeChartShow()) {
			ChangeChartShow(GetChartHandle());
		}
	}
}
///////////////////////////////////////////////////////////////////////////////
// DLLの使用許可確認
bool CanUseDlls()
{
	bool bResult = true;
	if (!TerminalInfoInteger(TERMINAL_DLLS_ALLOWED)) {
		Alert("Please Allow the use of DLLs.");
		bResult = false;
	}
	return bResult;
}
///////////////////////////////////////////////////////////////////////////////
// データウィンドウの項目削除
void DeleteDataName()
{
#ifdef __MQL5__
	PlotIndexSetString(0, PLOT_LABEL, NULL);
#else
	SetIndexLabel(0, NULL);
#endif
}
///////////////////////////////////////////////////////////////////////////////
// チャートの切替要否確認
bool IsChangeChartShow()
{
	bool bIsChange = false;
	if (InpSClick) {
		bIsChange = true;
	} else {
		static uint uiStartTick = 0;
		if (InpInterval > GetTickCount() - uiStartTick) {
			bIsChange = true;
		}
		uiStartTick = GetTickCount();
	}
	return bIsChange;
}
///////////////////////////////////////////////////////////////////////////////
// チャートのウィンドウハンドル取得
int GetChartHandle()
{
#ifdef __MQL5__
	int hWnd = (int)GetParent((long)ChartGetInteger(0, CHART_WINDOW_HANDLE));
#else
	int hWnd = GetParent(WindowHandle(Symbol(), Period()));
#endif
	return hWnd;
}
///////////////////////////////////////////////////////////////////////////////
// チャートの表示切替
void ChangeChartShow(int hWnd)
{
	if (!IsZoomed(hWnd)) {
		ShowWindow(hWnd, 3); 
	} else {
		ShowWindow(hWnd, 9);
	}
}
