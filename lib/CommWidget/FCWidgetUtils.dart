library FCWidgetUtils;

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_comm/CommImage/CoreImage.dart';
import 'package:dartcomm/dartcomm.dart';

part 'package:flutter_comm/CommWidget/FCSettingItemWidget.dart';
part 'package:flutter_comm/CommWidget/FCLine.dart';

class FCWidgetUtils {
	/// 生成一个随机颜色
	static Color sjColor() {
		math.Random random = math.Random();
		return Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
	}
	
	/// 根据样式,计算出文本的宽度
	static double calculateTextWidth(TextStyle style,String text){
		if (DCDataType.isAir(text) || style==null){
			return 0;
		}
		final textPainter = TextPainter(
			textDirection: TextDirection.ltr,
			text: TextSpan(
				text: text,
				style: style,
			),
		);
		textPainter.layout();
		return textPainter.width;
	}
}





//class NetImageWithCorner extends StatelessWidget {
//	final String imageUrl;
//	final double radius;
//	final Size size;
//
//	NetImageWithCorner({this.imageUrl, this.radius, this.size});
//
//	@override
//	Widget build(BuildContext context) {
//		Size aSize = size ?? Size(double.infinity, double.infinity);
//		var aRadius = radius ?? 4.0;
//		return ClipRRect(
//			borderRadius: BorderRadius.circular(aRadius),
//			child: new CachedNetworkImage(
//				imageUrl: imageUrl,
//				fit: BoxFit.cover,
//				height: aSize.height,
//				width: aSize.width,
//			),
//		);
//	}
//}





