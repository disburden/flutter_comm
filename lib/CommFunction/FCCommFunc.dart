import 'package:flutter/material.dart';
import 'dart:math' as math;

class FCCommFunc {
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

	/// 画一条分割线
	static Widget splitLine({
		double height = 8.0,
		double leftIndent = 0.0,
		double rightIndent = 0.0,
		Color lineColor = const Color(0xfff7f7f7)
	}) {
		return Padding(
			padding: EdgeInsets.only(left: leftIndent, right: rightIndent),
			child: Container(
				color: lineColor,
				height: height,
			),
		);
	}

	/// 根据范围获取随机数
	static int rangeRandom(int min, int max,{bool includeMax=true}) {
		//如果需要包含最大值,就先把最大值+1;
		if (includeMax) max++;

		math.Random random = math.Random();
		return random.nextInt(max - min) + min;
	}
}