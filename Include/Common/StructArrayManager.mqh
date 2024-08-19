//+------------------------------------------------------------------+
//|											StructArrayManager.mqh	 |
//| Template Class for Struct Array Management						 |
//|										 Copyright 2024, OgidaniLLC. |
//|											 https://www.ogidani.com |
//+------------------------------------------------------------------+
// テンプレートクラスの定義
template <typename T>
class StructArrayManager {
private:
	T array[];				// 構造体の配列
	int m_iSize;			// 現在の要素数
	int m_iCapacity;		// 配列の容量
public:
	// コンストラクタ
	StructArrayManager(int iIinitialCapacity = 10) : m_iSize(0), m_iCapacity(iIinitialCapacity) {
		ArrayResize(array, m_iCapacity);
	}
	// 要素の追加
	void Add(const T &item) {
		if (m_iSize >= m_iCapacity) {
			m_iCapacity += 10;
			ArrayResize(array, m_iCapacity);
		}
		array[m_iSize++] = item;
	}
	// 要素の取得
	T Get(int index) const {
		if (index >= 0 && index < m_iSize) return array[index];
		// 範囲外アクセス時のエラーハンドリング（ここではデフォルト構造体を返す）
		return T();
	}
	// 要素の削除
	void Remove(int index) {
		if (index >= 0 && index < m_iSize) {
			for (int i = index; i < m_iSize - 1; i++) {
				array[i] = array[i + 1];
			}
			m_iSize--;
		}
	}
	// 配列のサイズを取得
	int Size() const { return m_iSize; }
};
