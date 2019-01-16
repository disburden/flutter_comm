
class CommFunction {
	/// 是否为null，若是String是否是empty
	static bool isAir(Object obj) {
		if (obj == null) {
			return true;
		}
		if (obj is String) {
			return obj.isEmpty;
		}
		return true;
	}
}