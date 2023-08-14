//+------------------------------------------------------------------+
//|													 TradesOrder.mqX |
//|										 Copyright 2023, OgidaniLLC. |
//|											 https://www.ogidani.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2023, OgidaniLLC."
#property link		"https://www.ogidani.com"
#property version	"1.00"
#property strict
#include <CommonSourceProject\Common.mqh>
///////////////////////////////////////////////////////////////////////////////
//Ticke処理
void OnTick()
{
	int iNumPositions = 0;
	int iNumOrders = 0;
	int iNumTrades = TradesTotal(iNumPositions, iNumOrders);
	//ポジション用の処理
	ProcPositions(iNumTrades, iNumPositions);
	//オーダー用の処理
	ProcOrders(iNumTrades, iNumOrders);
}
///////////////////////////////////////////////////////////////////////////////
//ポジション用の処理
void ProcPositions(int iNumTrades, int iNumPositions)
{
#ifdef __MQL5__
	for (int iIndex = iNumPositions - 1; iIndex >= 0; iIndex--) {
		ulong ulTicket = PositionGetTicket(iIndex);
		Print("Position Ticket:", ulTicket);
#else
	for (int iIndex = iNumTrades - 1; iIndex >= 0; iIndex--) {
		if (!OrderSelect(iIndex, SELECT_BY_POS, MODE_TRADES)) {
			continue;
		}
		if (OP_SELL < OrderType()) {
			continue;
		}
		int iTicket = OrderTicket();
		Print("Position Ticket:", iTicket);
#endif
	}
}
///////////////////////////////////////////////////////////////////////////////
//オーダー用の処理
void ProcOrders(int iNumTrades, int iNumOrders)
{
#ifdef __MQL5__
	for (int iIndex = iNumOrders - 1; iIndex >=0; iIndex--) {
		ulong ulTicket = OrderGetTicket(iIndex);
		Print("Order Ticket:", ulTicket);
#else
	for (int iIndex = iNumTrades - 1; iIndex >=0; iIndex--) {
		if (!OrderSelect(iIndex, SELECT_BY_POS, MODE_TRADES)) {
			continue;
		}
		if (OP_SELL < OrderType()) {
			int iTicket = OrderTicket();
			Print("Order Ticket:", iTicket);
		}
#endif
	}
}
