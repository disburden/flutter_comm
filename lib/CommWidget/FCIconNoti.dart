import 'package:flutter/material.dart';

class FCIconNoti extends StatelessWidget {

	/// 文字距离周边的间距
	final EdgeInsets textPadding;

	/// 背景色
	final Color backgroundColor;

	/// 圆角
	final double cornerRadius;

	/// 标题栏与正式文本内容之间的距离
	final double gapBtwTitleBarAndContent;

	/// 标题栏图标
	final Icon icon;

	/// 标题
	final String title;

	/// 标题栏中标题与图标之间的距离
	final double gapBtwIconAndTitle;

	/// 文本内容
	final String content;

//	/// 标题文本样式
//	final TextStyle textStyle;

	/// 文本内容样式
	final TextStyle textStyle;

	FCIconNoti({
		@required this.icon,
		@required this.title,
		@required this.content,
		this.textPadding = const EdgeInsets.all(8),
		this.backgroundColor = Colors.white,
		this.cornerRadius = 0,
		this.gapBtwTitleBarAndContent = 4,
		this.gapBtwIconAndTitle = 4,
		this.textStyle,
	});


	@override
	Widget build(BuildContext context) {
		// 计算顶部标题栏的padding
		EdgeInsets titlePadding = textPadding.copyWith(
			bottom: (gapBtwTitleBarAndContent / 2),
		);
		// 计算底部文本内容标题栏
		EdgeInsets contentPadding = textPadding.copyWith(
			top: (gapBtwTitleBarAndContent / 2),
		);

		return Column(
			children: <Widget>[
				// 标题bar
				Container(
					decoration: BoxDecoration(
						color: backgroundColor,
						borderRadius: BorderRadius.only(
							topLeft: Radius.circular(cornerRadius),
							topRight: Radius.circular(cornerRadius)
						),
					),
					child: Padding(
						padding: titlePadding,
						child: Row(
							children: <Widget>[
								icon,
								Padding(
									padding: EdgeInsets.only(left: gapBtwIconAndTitle),
									child: Text(title, style: textStyle,),
								),
							],
						),
					),
				),

				// 内容
				Container(
					decoration: BoxDecoration(
						color: backgroundColor,
						borderRadius: BorderRadius.only(
							bottomLeft: Radius.circular(cornerRadius),
							bottomRight: Radius.circular(cornerRadius)
						),
					),
					child: Padding(
						padding: contentPadding,
						child: Row(
							children: <Widget>[
								Expanded(
									child: Text(
										content,
										style: textStyle,
									),
								),
							],
						),
					),
				),
			],
		);
	}
}
