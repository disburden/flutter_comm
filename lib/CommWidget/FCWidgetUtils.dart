import 'package:flutter/material.dart';
import 'dart:math' as math;

class FCWidgetUtils {
	
	/// 画一条分割线
	static Widget splitLine({
		double height = 1.0,
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
	
	/// 生成一个随机颜色
	static Color sjColor() {
		math.Random random = math.Random();
		return Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
	}
}