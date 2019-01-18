import 'package:flutter/material.dart';

class FCTextView extends StatefulWidget {

	_FCTextViewState _state;

	/// 高度
	final double height;

	/// 宽度
	final double width;

	/// textfield的控制器,如果外部传入就用外部,没有的话会自己创建一个
	TextEditingController _contrl;

	/// 文本改变时触发的事件
	ValueChanged<String> textChanged;

	/// 文本样式
	TextStyle textStyle;

	/// 背景色
	Color backgroundColor;

	/// 提示文本的样式
	TextStyle hintStyel;

	/// 提示文本
	String hintStr;

	/// 文本距离上下左右的间距
	EdgeInsets gap;

	/// 圆角
	double cornerRadius;

	/// 获取当前的文本属性
	String get text => _contrl.text;

	/// 重新设置文本内容
	set text(String str){
		_contrl.text = str;
		_state.setState((){});
	}

	FCTextView({
		@required this.height,
		this.width = 320.0,
		TextEditingController controller,
		this.textChanged,
		this.textStyle,
		this.backgroundColor,
		this.hintStyel,
		this.hintStr,
		this.gap = const EdgeInsets.all(8.0),
		this.cornerRadius=.0
	}) {
//		this._contrl == controller ?? TextEditingController();

//		this._contrl = controller;
//		if (this._contrl == null){
//			this._contrl = TextEditingController();
//		}
		_contrl = controller;
		if (_contrl == null){
			_contrl = TextEditingController();
		}
	}

	@override
	_FCTextViewState createState()  {
		_state = _FCTextViewState();
		return _state;
	}

}

class _FCTextViewState extends State<FCTextView> {

	@override
	Widget build(BuildContext context) {
		return ClipRRect(
			borderRadius: BorderRadius.circular(widget.cornerRadius),
			child: Container(
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
			),
		);
	}

	void update(){
		setState(() {});
	}
}
