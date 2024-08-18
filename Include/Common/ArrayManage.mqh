//+------------------------------------------------------------------+
//|												   ArrayManager.mqh	 |
//| Template Class for Array Management								 |
//|										 Copyright 2024, OgidaniLLC. |
//|											 https://www.ogidani.com |
//+------------------------------------------------------------------+
template<typename T>
class CArrayManager {
private:
	T m_Data[]; // 配列を格納するメンバ変数

public:
	// コンストラクタ
	CArrayManager() {}

	// 配列に値を追加するメソッド
	void Add(T value) {
		ArrayResize(m_Data, ArraySize(m_Data) + 1);
		m_Data[ArraySize(m_Data) - 1] = value;
	}

	// 指定したインデックスの値を削除するメソッド
	bool Remove(int iTarget) {
		int iSize = ArraySize(m_Data);
		if (iTarget < 0 || iTarget >= iSize) {
			// インデックスが無効な場合
			return false;
		}
		for (int iIndex = iTarget; iIndex < iSize - 1; iIndex++) {
			m_Data[iIndex] = m_Data[iIndex + 1];
		}
		ArrayResize(m_Data, iSize - 1);
		return true;
	}

	// 配列のサイズを取得するメソッド
	int Size() { return ArraySize(m_Data); }

	// 配列の要素を取得するメソッド
	T Get(int iTarget) {
		if (iTarget < 0 || iTarget >= ArraySize(m_Data)) {
			// 無効なインデックスの場合はデフォルト値を返す
			return T();
		}
		return m_Data[iTarget];
	}
};
