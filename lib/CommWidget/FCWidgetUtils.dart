import 'package:flutter/material.dart';
import 'dart:math' as math;



class FCWidgetUtils {
	/// 生成一个随机颜色
	static Color sjColor() {
		math.Random random = math.Random();
		return Color.fromARGB(255, random.nextInt(255), random.nextInt(255), random.nextInt(255));
	}
}


class FCLine extends StatelessWidget {
	final double height;
	final double leftIndent;
	final double rightIndent;
	final Color lineColor;
	
	FCLine({
		this.height = 1.0,
		this.leftIndent = 0,
		this.rightIndent = 0,
		this.lineColor = const Color(0xfff7f7f7)
	});
	
	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: EdgeInsets.only(left: leftIndent, right: rightIndent),
			child: Container(
				color: lineColor,
				height: height,
			),
		);
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

class FCSettingItemWidget extends StatelessWidget {
	final int index;
	final String title;
	final String iconFilename;
	final String extraInfo;
	final VoidCallback onClick;
	final Widget subWidget;
	final bool needRightArrow;
	final EdgeInsets padding;
	final FontWeight titleFontWeight;
	final Color backgroundColor;
	
	FCSettingItemWidget(this.title,
		
		{
			this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
			this.index = 0,
			this.titleFontWeight,
			this.iconFilename,
			this.extraInfo,
			this.onClick,
			this.subWidget,
			this.needRightArrow = true,
			this.backgroundColor = Colors.white
		});
	
	Widget content() {
		return Container(
			decoration: BoxDecoration(
				color:backgroundColor
			),
		  child: Padding(
		  	padding: padding,
		  	child: Row(
		  		crossAxisAlignment: CrossAxisAlignment.center,
		  		children: <Widget>[
		  			// 图标
		  			Offstage(
		  				offstage: iconFilename == null,
		  				child: Padding(
		  					padding: const EdgeInsets.only(left: 16.0),
		  					child: iconFilename == null ? Container() : Image.asset('assets/images/${iconFilename}.png'),
		  				),
		  			),
		  			
		  			// 标题
		  			Padding(
		  				padding: const EdgeInsets.only(left: 12.0),
		  				child: Text(
		  					title,
		  					style: TextStyle(fontSize: 16, color: Color(0xff333333), fontWeight: titleFontWeight),
		  				),
		  			),
		  			// 附加视图 -- 尾部>图标
		  			Expanded(
		  				child: Row(
		  					mainAxisAlignment: MainAxisAlignment.end,
		  					children: <Widget>[
		  						Offstage(
		  							offstage: subWidget == null,
		  							child: subWidget,
		  						),
		  						Padding(
		  							padding: const EdgeInsets.only(right: 8.0),
		  							child: Offstage(
		  								offstage: needRightArrow == false,
		  								child: Icon(
		  									Icons.keyboard_arrow_right,
		  									color: Color(0x282F3133),
		  								),
		  							),
		  						),
		  					],
		  				),
		  			),
		  		],
		  	),
		  ),
		);
	}
	
	@override
	Widget build(BuildContext context) {
		//return GestureDetector(behavior: HitTestBehavior.opaque, onTap: onClick, child: content());
		return InkWell(onTap: onClick, child: content());
	}
}



