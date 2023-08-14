//+------------------------------------------------------------------+
//|													   TradesLib.mqh |
//|										 Copyright 2023, OgidaniLLC. |
//|											 https://www.ogidani.com |
//+------------------------------------------------------------------+
//////////////////////////////////////////////////////////////////////
//	MQL5
#ifdef __MQL5__		//__MQL5__
#define	Bid							(SymbolInfoDouble(Symbol(), SYMBOL_Bid))
#define	Ask							(SymbolInfoDouble(Symbol(), SYMBOL_ASK))
#define Bars						((int)Bars(Symbol(), Period()))
//////////////////////////////////////////////////////////////////////
//	MQL4
#else				//__MQL4__
#endif
