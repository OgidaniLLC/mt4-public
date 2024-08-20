//+------------------------------------------------------------------+
//|											ClassArrayManager.mqh	 |
//| Template Class for Struct Array Management						 |
//|										 Copyright 2024, OgidaniLLC. |
//|											 https://www.ogidani.com |
//+------------------------------------------------------------------+
// テンプレートクラスの定義
template <typename T>
class ClassArrayManager {
private:
	T* array[];				// 構造体の配列
	int m_iSize;			// 現在の要素数
	int m_iCapacity;		// 配列の容量
public:
	// コンストラクタ
	ClassArrayManager(int iIinitialCapacity = 10) : m_iSize(0), m_iCapacity(iIinitialCapacity) {
		ArrayResize(array, m_iCapacity);
	}
	~ClassArrayManager() {
		for (int iIndex = 0; iIndex < m_iSize; iIndex++) {
			delete array[iIndex];
		}
	}
	// 要素の追加
	void Add(T* item) {
		if (m_iSize >= m_iCapacity) {
			m_iCapacity += 10;
			ArrayResize(array, m_iCapacity);
		}
		array[m_iSize++] = item;
	}
	// 要素の取得
	T* Get(int iTarget) const {
		if (iTarget >= 0 && iTarget < m_iSize) return array[iTarget];
		// 範囲外アクセス時のエラーハンドリング（ここではデフォルト構造体を返す）
		return NULL;
	}
	// 要素の削除
	void Remove(int iTarget) {
		if (iTarget >= 0 && iTarget < m_iSize) {
			delete array[iTarget];
			for (int iIndex = iTarget; iIndex < m_iSize - 1; iIndex++) {
				array[iIndex] = array[iIndex + 1];
			}
			m_iSize--;
		}
	}
	// 配列のサイズを取得
	int Size() const { return m_iSize; }
};
