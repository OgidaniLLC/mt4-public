#ifdef __MQL5__		//__MQL5__
int TradesTotal(int& iNumPositions, int& iNumOrders)
{
	iNumPositions = PositionsTotal();
	iNumOrders = OrdersTotal();
	return iNumPositions + iNumOrders;
}
int TradesTotal()
{
	return PositionsTotal() + OrdersTotal();
}
#else				//__MQL4__
int TradesTotal(int& iNumPositions, int& iNumOrders)
{
	iNumPositions = 0;
	iNumOrders = 0;
	for (int iIndex = OrdersTotal() - 1; iIndex >= 0; iIndex--) {
		if (!OrderSelect(iIndex, SELECT_BY_POS, MODE_TRADES)) {
			continue;
		}
		int iTradeType = OrderType();
		if (OP_SELL >= iTradeType) {
			//ポジション数加算
			iNumPositions++;
		} else {
			//オーダー数加算
			iNumOrders++;
		}
	}
	return OrdersTotal();
}
int TradesTotal()
{
	return OrdersTotal();
}
#endif
