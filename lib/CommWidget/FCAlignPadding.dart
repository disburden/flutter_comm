import 'package:flutter/material.dart';


/// 设置align和padding
class FCAlignPadding extends StatelessWidget {
	final Alignment align;
	final EdgeInsetsGeometry padding;
	final Widget child;

	FCAlignPadding({@required this.align, @required this.padding, @required this.child});

	@override
	Widget build(BuildContext context) {
		return Align(
			alignment: align,
			child: Padding(
				padding: padding,
				child: child,
			),
		);
	}
}