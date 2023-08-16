//+------------------------------------------------------------------+
//|												  PositionSelect.mqX |
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
	for (int iIndex = 0; iNumTrades > iIndex; iIndex++) {
		if (!PositionSelect(iIndex, SELECT_BY_POS, MODE_TRADES)) {
			continue;
		}
		if (OP_SELL < PositionType()) {
			//オーダーを除外する
			continue;
		}
		LOG("Position Ticket", PotitionTicket());
	}
}
///////////////////////////////////////////////////////////////////////////////
//オーダー用の処理
void ProcOrders(int iNumTrades, int iNumOrders)
{
	for (int iIndex = 0; iNumTrades > iIndex; iIndex++) {
		if (!OrderSelect(iIndex, SELECT_BY_POS, MODE_TRADES)) {
			continue;
		}
		if (OP_SELL >= OrderType()) {
			//ポジションを除外する
			continue;
		}
		LOG("Order Ticket", OrderTicket());
	}
}
