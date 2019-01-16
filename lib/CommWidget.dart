import 'package:flutter/material.dart';

/// 设置align和padding
class FCAlignPadding extends StatelessWidget {
	final Alignment align;
	final EdgeInsetsGeometry gap;
	final Widget widget;

	FCAlignPadding({@required this.align, @required this.gap, @required this.widget});

	@override
	Widget build(BuildContext context) {
		return Align(
			alignment: align,
			child: Padding(
				padding: gap,
				child: widget,
			),
		);
	}
}


/// 圆角
class FCRoundedCorner extends StatelessWidget {
	/// 点击事件
	final GestureTapCallback onClickListener;

	/// 子组件
	final Widget child;

	/// padding
	final EdgeInsets padding;

	/// 背景颜色
	final Color backGroundColor;

	/// 圆角尺寸
	final double circular;

	final BoxBorder border;

	FCRoundedCorner({@required this.child, this.onClickListener, this.padding, this.backGroundColor, this.circular, this.border});

	@override
	Widget build(BuildContext context) {
		return new GestureDetector(
			onTap: onClickListener,
			child: Container(
				padding: padding ?? EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
				// 绘制背景颜色
				decoration: new BoxDecoration(
					color: backGroundColor ?? Color(0xffF7F7F7),
					borderRadius: new BorderRadius.circular(circular ?? 5.0),
					border: border,
				),
				child: child,
			));
	}
}