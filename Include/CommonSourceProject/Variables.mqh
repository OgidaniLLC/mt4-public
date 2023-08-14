#ifdef __MQL5__		//__MQL5__
#define	Bid							(SymbolInfoDouble(Symbol(), SYMBOL_Bid))
#define	Ask							(SymbolInfoDouble(Symbol(), SYMBOL_ASK))
#define Bars						((int)Bars(Symbol(), Period()))
#else				//__MQL4__
#endif
