

import 'package:flutter/material.dart';
import 'package:flutter_comm/CommImage//FCConstantImages.dart';
import 'package:flutter_comm/CommImage//FCImageConver.dart';

class FCSettingItemWidget extends StatelessWidget {
	final int index;
	final String title;
	final String iconFilename;
	final String extraInfo;
	final VoidCallback onClick;
	final Widget subWidget;
	final bool needRightArrow;
	final EdgeInsets padding;
	final TextStyle titleStyle;
	final Color backgroundColor;
	
	FCSettingItemWidget(this.title,
		
		{
			this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
			this.index = 0,
			this.titleStyle,
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
				color: backgroundColor
			),
			child: Padding(
				padding: padding,
				child: Row(
					crossAxisAlignment: CrossAxisAlignment.center,
					children: <Widget>[
						// 图标
						Offstage(
							offstage: iconFilename == null,
							child: iconFilename == null ? Container() : Image.asset('assets/images/${iconFilename}.png'),
						),
						
						// 标题
						Text(
							title,
							style: titleStyle,
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
									Offstage(
										offstage: needRightArrow == false,
										child: Padding(
											padding: const EdgeInsets.only(left:8.0),
											child: SizedBox(
												height: 12,
												width: 7,
												child: FCImageConver.fromBase64ToImage(FCConstantImages.rightArrow)
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