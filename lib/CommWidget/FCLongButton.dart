import 'package:flutter/material.dart';

class FCLongButton extends StatelessWidget {
	final String text;
	final VoidCallback onPressed;
	final Color bgColor;
	final Color textColor;
	final double textSize;
	final double height;
	final double roundedCornerRadius;
	
	FCLongButton({@required this.text,
		@required this.onPressed,
		this.bgColor = const Color(0x33000000),
		this.textColor = Colors.white,
		this.textSize = 16.0,
		this.roundedCornerRadius = 4.0,
		this.height = 40.0});
	
	@override
	Widget build(BuildContext context) {
		return Container(
			child: Row(
				children: <Widget>[
					Expanded(
						child: SizedBox(
							height: height,
							child: FlatButton(
								onPressed: onPressed,
								color: bgColor,
								textColor: Colors.white,
								shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(roundedCornerRadius)),
								child: Text(
									text,
									style: TextStyle(
										color: textColor,
										fontSize: textSize
									),
								),
							),
						),
					),
				],
			),
		);
	}
}