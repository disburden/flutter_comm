import 'package:flutter/material.dart';

class FCSpecifyHeightTextField extends StatefulWidget {
	
	final TextEditingController ctl;
	final double specifyHeight;
	final TextStyle textStyle;
	final String hintStr;
	
	FCSpecifyHeightTextField({
		this.ctl,
		this.specifyHeight,
		this.textStyle,
		this.hintStr
	});
	
	@override
	_FCSpecifyHeightTextFieldState createState() => _FCSpecifyHeightTextFieldState();
}

class _FCSpecifyHeightTextFieldState extends State<FCSpecifyHeightTextField> {
	
	TextEditingController _ctl;
	double _fontSize;
	double _specifyHeight;
	double _verticalPadding;
	
	@override
	void initState() {
		super.initState();
		_specifyHeight = widget.specifyHeight ?? 40;
		_fontSize = widget.textStyle == null ? 16.0 : widget.textStyle.fontSize;
		_verticalPadding = (_specifyHeight - _fontSize) / 2;
		_ctl = widget.ctl ?? TextEditingController();
	}
	
	@override
	Widget build(BuildContext context) {
		return Container(
			child: new ConstrainedBox(
				constraints: BoxConstraints(
					maxHeight: _specifyHeight,
				),
				child: new Scrollbar(
					child: new SingleChildScrollView(
						scrollDirection: Axis.vertical,
						reverse: true,
						child: new TextField(
							controller: _ctl,
							style: TextStyle(
								fontSize: 14
							),
							decoration: InputDecoration(
								isDense: true,
								contentPadding: EdgeInsets.symmetric(vertical: _verticalPadding),
								hintText: widget.hintStr
							),
						),
					),
				),
			),
		);
	}
	
}
