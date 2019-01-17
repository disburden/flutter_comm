import 'package:flutter/material.dart';

class FCTextView extends StatefulWidget {
	final double height;
	final double width;
	TextEditingController _contrl;
	ValueChanged<String> textChanged;
	TextStyle textStyle;
	Color backgroundColor;
	TextStyle hintStyel;
	String hintStr;
	EdgeInsets gap; /// 文字距离上下左右的边距

	FCTextView({@required this.height,this.width,
		TextEditingController controller,
		this.textChanged,
		this.textStyle,
		this.backgroundColor,
		this.hintStyel,
		this.hintStr
	}){
		_contrl == controller ?? TextEditingController();
	}

  @override
  _FCTextViewState createState() => _FCTextViewState();
}

class _FCTextViewState extends State<FCTextView> {

  @override
  Widget build(BuildContext context) {
    return  Container(
	    color: widget.backgroundColor,
	    constraints: BoxConstraints(
		    maxHeight: widget.height,
		    maxWidth: widget.width,
		    minHeight: widget.height,
		    minWidth: widget.width),
	    padding: widget.gap,
	    child: TextField(
		    maxLines: null,
		    keyboardType: TextInputType.multiline,
		    controller: widget._contrl,
		    style: widget.textStyle,
		    decoration: InputDecoration.collapsed(
			    hintText: widget.hintStr,
			    hintStyle: widget.hintStyel
		    ),
		    onChanged: widget.textChanged,
	    ),
    );
  }
}
