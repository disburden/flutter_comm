import 'package:flutter/material.dart';

typedef Clicked = Function(int);

enum ImageButtonStyle { topImageButtonText, leftImageRightText, leftTextRightImage }

class FCImageButton extends StatefulWidget {
	final Widget image;
	final Text text;
	final EdgeInsets padding;
	final double gapBetweenImageAndText;
	final ImageButtonStyle style;
	final Clicked onClick;
	int tag;
	
	FCImageButton({
		this.image,
		this.text,
		this.padding,
		this.gapBetweenImageAndText,
		this.style,
		this.onClick,
		this.tag=-1,
	});
	
	@override
	_FCImageButtonState createState() => _FCImageButtonState();
}

class _FCImageButtonState extends State<FCImageButton> {
	
	Widget createButton() {
		switch (widget.style) {
			case ImageButtonStyle.topImageButtonText:
				{
					return Column(
						mainAxisSize: MainAxisSize.min,
						children: <Widget>[
							widget.image,
							Padding(
								padding: EdgeInsets.only(top: widget.gapBetweenImageAndText),
								child: widget.text,
							),
						],
					);
				}
			
			case ImageButtonStyle.leftImageRightText:
				{
					return Row(
						mainAxisSize: MainAxisSize.min,
						children: <Widget>[
							widget.image,
							Padding(
								padding: EdgeInsets.only(left: widget.gapBetweenImageAndText),
								child: widget.text,
							),
						],
					);
				}
			
			case ImageButtonStyle.leftTextRightImage:
				{
					return Row(
						mainAxisSize: MainAxisSize.min,
						children: <Widget>[
							Padding(
								padding: EdgeInsets.only(left: widget.gapBetweenImageAndText),
								child: widget.text,
							),
							widget.image,
						],
					);
				}
		}
	}
	
	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: () {
				widget.onClick(widget.tag);
			},
			behavior: HitTestBehavior.opaque,
			child: Padding(
				padding: widget.padding,
				child: createButton(),
			),
		);
	}
}