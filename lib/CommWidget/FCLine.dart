part of 'package:flutter_comm/CommWidget/FCWidgetUtils.dart';

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