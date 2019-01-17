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