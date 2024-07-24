//+------------------------------------------------------------------+
//|                                            Data Notification.mq4 |
//|                                      Copyright 2024, OgidaniLLC. |
//|                                          https://www.ogidani.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2024, OgidaniLLC."
#property link      "https://www.ogidani.com"
#property version   "1.00"
#property strict
#property indicator_chart_window
#property indicator_plots   0

input double InpPersent = 50;				//検出差分(%)
input double InpDiffPlus = 100000;          //差分+
input double InpDiffMinus = 100000;         //差分-(符号なし指定)

#ifdef __MQL5__
#define MODE_MINLOT 23
#define MODE_MAXLOT 25
double MarketInfo(string strSymbol, int type) {
	double dResult = -1;
	switch(type) {
	case MODE_MINLOT:
		dResult = (double)SymbolInfoDouble(strSymbol, (ENUM_SYMBOL_INFO_DOUBLE)SYMBOL_VOLUME_MIN);
		break;
	case MODE_MAXLOT:
		dResult = (double)SymbolInfoDouble(strSymbol, (ENUM_SYMBOL_INFO_DOUBLE)SYMBOL_VOLUME_MAX);
		break;
	default:
		break;
	}
	return dResult;
}
#endif
enum KIND_DATA {
	KD_CREDIT,
	KD_BALANCE,
	KD_MINLOTS,
	KD_MAXLOTS,
};
class CDataRecord {
private:
	double m_dCredit;
	double m_dBalance;
	double m_dMinLots;
	double m_dMaxLots;
	void NotifyAlert(KIND_DATA eKind, double dValue) {
		string strMessage = "";
		switch(eKind) {
		case KD_CREDIT:
			strMessage = "Credit:";
			break;
		case KD_BALANCE:
			strMessage = "Balance:";
			break;
		case KD_MINLOTS:
			strMessage = "MinLots:";
			break;
		case KD_MAXLOTS:
			strMessage = "MaxLots:";
			break;
		default:
			return;
		}
		strMessage += DoubleToString(dValue, 2);
		SendNotification(strMessage);
		Alert(strMessage);
	}
public:
	CDataRecord() : m_dCredit(-1), m_dBalance(-1), m_dMinLots(-1), m_dMaxLots(-1) {
		if (-1 == m_dCredit) m_dCredit = AccountInfoDouble(ACCOUNT_CREDIT);
		if (-1 == m_dBalance) m_dBalance = AccountInfoDouble(ACCOUNT_BALANCE);
		if (-1 == m_dMinLots) {
		    m_dMinLots = MarketInfo(Symbol(), MODE_MINLOT);
			Print("MinLot : " + DoubleToString(m_dMinLots, 2));
		}
		if (-1 == m_dMaxLots) {
			m_dMaxLots = MarketInfo(Symbol(), MODE_MAXLOT);
			Print("MaxLot : " + DoubleToString(m_dMaxLots, 2));
		}
	}
	void CompareCredit(double dCredit) {
		if (0 == m_dCredit) return;
		double diffValue = m_dCredit - dCredit;
		double dPersent = MathAbs(diffValue) * 100 / m_dCredit;
		if (InpPersent <= dPersent || InpDiffPlus < diffValue || diffValue < -InpDiffMinus) NotifyAlert(KD_CREDIT, dCredit);
		m_dCredit = dCredit;
	}
	void CompareBalance(double dBalance) {
		if (0 == m_dBalance) return;
		double diffValue = m_dBalance - dBalance;
		double dPersent = MathAbs(diffValue) * 100 / m_dBalance;
		if (InpPersent <= dPersent || InpDiffPlus < diffValue || diffValue < -InpDiffMinus) NotifyAlert(KD_CREDIT, dBalance);
		m_dBalance = dBalance;
	}
	void CompareMinLots(double dMinLots) { if (dMinLots != m_dMinLots) NotifyAlert(KD_MINLOTS, dMinLots); }
	void CompareMaxLots(double dMaxLots) { if (dMaxLots != m_dMaxLots) NotifyAlert(KD_MAXLOTS, dMaxLots); }
};
CDataRecord cData;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
{
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
	cData.CompareCredit(AccountInfoDouble(ACCOUNT_CREDIT));
	cData.CompareBalance(AccountInfoDouble(ACCOUNT_BALANCE));
	cData.CompareMinLots(MarketInfo(Symbol(), MODE_MINLOT));
	cData.CompareMaxLots(MarketInfo(Symbol(), MODE_MAXLOT));
	return(rates_total);
}
//+------------------------------------------------------------------+
