import 'package:flutter/material.dart';
import 'package:dart_comm/dart_comm.dart';
import 'FCPicker.dart';


typedef InputDone = void Function(String text);
typedef DateIntervalDone = void Function(List<DateTime>);

enum DialogDemoAction {
	cancel,
	discard,
	disagree,
	agree,
}

enum DialogType {
	show,
	overlay,
}

DialogType _dialogType;

/// 显示加载菊花,有黑色半透明的背景
Future<Null> FCDialogShowJhNormal({@required BuildContext context}) async {
	_dialogType = DialogType.show;
	return showDialog<Null>(
		context: context,
		barrierDismissible: false,
		
		builder: (BuildContext context) {
			return SizedBox(
				height: 30,
				width: 30,
				child: Material(
					child: Center(
						child: CircularProgressIndicator()
					),
					color: Colors.transparent,
					type: MaterialType.transparency,
				),
			);
		},
	);
}


OverlayEntry overlayEntry;

/// 显示加载菊花,有黑色半透明的背景
FCDialogShowJhTransparent({@required BuildContext context}) async {
	_dialogType = DialogType.overlay;
	var overlayState = Overlay.of(context);
	
	
	
	overlayEntry = new OverlayEntry(builder: (context) {
		return Center(child: CircularProgressIndicator());
	});
	
	overlayState.insert(overlayEntry);
}



///====================可以更新状态文本的对话框====================
/// 就是屏幕中间一个黑色的小方块,分上下两部分,上面一半是朵菊花在转,下面是文字,比如"loading...."
/// 要更新状态时只要直接重复调用这个方法就行 e.g:
/// 		FCDialogWithState(context: context,text: "hoho是啊的沙发斯蒂芬就是地方阿萨德分撒旦发发送到发的",iconImage: CircularProgressIndicator());
/// 		Future.delayed(Duration(seconds: 3),(){
/// 			FCDialogWithState(context: context,text: "xixi",iconImage: Icon(Icons.brightness_3,color: Colors.cyan,));
/// 		});


GlobalKey<_DialogContentViewState> keyOne = GlobalKey();

Future<Null> FCDialogWithState({
	@required BuildContext context,
	String text = '',
	Widget iconImage
}) {
	bool isUpdate = keyOne.currentState != null && keyOne.currentState.getCurrentText() != text;
	if (isUpdate) {
		keyOne.currentState.changeText(text);
		if (iconImage != null) {
			keyOne.currentState.changeImage(iconImage);
		}
	} else {
		keyOne = GlobalKey();
		return showDialog<Null>(
			context: context,
			barrierDismissible: false,
			builder: (BuildContext context) {
				return _DialogContentView(text: text, key: keyOne, iconImage: iconImage);
			},
		);
	}
}

class _DialogContentView extends StatefulWidget {
	final String text;
	final Key key;
	final Widget iconImage;
	
	_DialogContentView({this.key, this.text, this.iconImage}) : super(key: key);
	
	@override
	_DialogContentViewState createState() => _DialogContentViewState();
}

class _DialogContentViewState extends State<_DialogContentView> {
	
	var _msg;
	var _currentText;
	var _imageIcon;
	
	void changeText(String inMsg) {
		setState(() {
			_msg = inMsg;
		});
	}
	
	String getCurrentText() {
		return _currentText;
	}
	
	void changeImage(Widget imageIcon) {
		setState(() {
			_imageIcon = imageIcon;
		});
	}
	
	@override
	Widget build(BuildContext context) {
		var msg = _msg ?? widget.text;
		var imageIcon = _imageIcon ?? widget.iconImage;
		
		_currentText = msg;
		
		Future<bool> _onWillPop() => new Future.value(false);
		return WillPopScope(
			onWillPop: _onWillPop,
			child: new Center(
				child: new ConstrainedBox(
					constraints: const BoxConstraints(maxWidth: 280.0),
					child: new Material(
						elevation: 24.0,
						color: Colors.transparent,
						child: Container(
							decoration: new BoxDecoration(
								color: Color.fromARGB(0xcc, 0x00, 0x00, 0x00),
								borderRadius: BorderRadius.all(
									Radius.circular(16.0),
								),
							),
							child: Padding(
								padding: const EdgeInsets.only(top: 17.0, bottom: 17.0, left: 30.0, right: 30.0),
								child: Column(
									mainAxisSize: MainAxisSize.min,
									children: <Widget>[
										Container(
											height: 32.0,
											width: 32.0,
											margin: EdgeInsets.only(bottom: 8.0),
											child: imageIcon,
										),
										Text(
											msg,
											style: TextStyle(color: Colors.white, fontSize: 16.0),
										),
									],
								),
							),
						),
					),
				),
			),
		);
	}
}



/// 确认对话框,并带有两个按钮(默认名称为"确定"和"取消")
FCDialogConfirmWith2Operation(BuildContext context,
	String message,
	VoidCallback onEnsure,
	{
		String cancelStr,
		String ensureStr,
		VoidCallback onCancel
	}) {
	ensureStr ??= "确定";
	cancelStr ??= "取消";
	
	final TextStyle dialogTextStyle = TextStyle(
		fontSize: 14.0,
		color: Colors.white,
	);
	
	_showDemoDialog<DialogDemoAction>(
		context: context,
		child: Theme(
			data: Theme.of(context).copyWith(
				dialogBackgroundColor: Color.fromARGB(0xcc, 0x00, 0x00, 0x00),
			),
			child: new AlertDialog(
				content: new Text(
					message,
					style: dialogTextStyle
				),
				actions: <Widget>[
					new FlatButton(
						child: Text(cancelStr, style: TextStyle(
							color: Colors.white
						),),
						onPressed: () {
							if (onCancel == null) {
								Navigator.of(context).pop();
							} else {
								onCancel();
							}
						}
					),
					new FlatButton(
						child: Text(ensureStr, style: TextStyle(
							color: Colors.white
						),),
						onPressed: () {
							onEnsure();
						}
					)
				]
			),
		)
	);
}

void _showDemoDialog<T>({ BuildContext context, Widget child }) {
	showDialog<T>(
		context: context,
		builder: (BuildContext context) => child,
	)
		.then<void>((T value) {
		if (value != null) {
		
		}
	});
}



/// 只有一个输入框的输入对话框
FCDialogInputWithOneField(BuildContext context,
	String message,
	bool isPass,
	InputDone onEnsure,
	{
		String cancelStr = '取消',
		String ensureStr = "确定",
		TextInputType keyboardType = TextInputType.text,
		Color backgroundColor = const Color.fromARGB(0xcc, 0x00, 0x00, 0x00),
		Color boderColor = Colors.white,
		Color textColor = Colors.white,
		VoidCallback onCancel,
		String defaultText = ""
	}) {
	TextEditingController _ctrl = TextEditingController();
	_ctrl.text = defaultText;
	_ctrl.selection = TextSelection(baseOffset: 0, extentOffset: _ctrl.text.length);
	
	String tftext = defaultText;
	_showDemoDialog<DialogDemoAction>(
		context: context,
		child: Theme(
			data: Theme.of(context).copyWith(
				dialogBackgroundColor: backgroundColor,
			),
			child: new AlertDialog(
				content: TextField(
					controller: _ctrl,
					autofocus: true,
					keyboardType: keyboardType,
					decoration: InputDecoration(
						fillColor: Colors.white,
						
						hintStyle: TextStyle(
							color: Colors.grey,
						),
						hintText: message,
						focusedBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: boderColor, width: 0.5)),
						enabledBorder: new UnderlineInputBorder(borderSide: new BorderSide(color: boderColor, width: 0.5)),
					),
					style: TextStyle(
						color: textColor,
					),
					obscureText: isPass,
					cursorColor: textColor,
					onChanged: (txt) {
						tftext = txt;
					},
				),
				actions: <Widget>[
					new FlatButton(
						child: Text(cancelStr, style: TextStyle(
							color: textColor
						),),
						onPressed: () {
							if (onCancel == null) {
								Navigator.of(context).pop();
							} else {
								onCancel();
							}
						}
					),
					new FlatButton(
						child: Text(ensureStr, style: TextStyle(
							color: textColor
						),),
						onPressed: () {
							onEnsure(tftext);
						}
					)
				]
			),
		)
	);
}



FCDialogPickerDateInterval(BuildContext context,
	DateIntervalDone selectedDone,
	{
		String cancelStr = '取消',
		String ensureStr = "确定",
		Color backgroundColor = const Color.fromARGB(0xcc, 0x00, 0x00, 0x00),
		Color boderColor = Colors.white,
		Color textColor = Colors.white,
		VoidCallback onCancel,
	}) {
	TimeStyle dtstyle = TimeStyle.YEAR_hg_MO_hg_DAY;
	DateTime b = DateTime.now();
	DateTime e = DateTime.now();
	
	showDialog(
		context: context,
		builder: (context) {
			String label = 'test';
			return StatefulBuilder(
				builder: (context, state) {
					return Theme(
						data: Theme.of(context).copyWith(
							dialogBackgroundColor: backgroundColor,
						),
						child: new AlertDialog(
							content: Row(
								mainAxisAlignment: MainAxisAlignment.center,
								children: <Widget>[
									GestureDetector(
										onTap: () {
											FCPicker.pickDate(context, (_date) {
												b = _date;
												state(() {});
											});
										},
										behavior: HitTestBehavior.opaque,
										child: Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>[
												Text(DCTime.formatDateTime(dateTimeString: b.toString(), style: dtstyle), style: TextStyle(
													fontSize: 14,
													color: textColor
												),),
												Icon(Icons.arrow_drop_down, color: textColor,),
											],
										),
									),
									Text(" 到  ", style: TextStyle(
										fontSize: 14,
										color: textColor
									),),
									GestureDetector(
										onTap: () {
											FCPicker.pickDate(context, (_date) {
												e = _date;
												state(() {});
											});
										},
										behavior: HitTestBehavior.opaque,
										child: Row(
											mainAxisAlignment: MainAxisAlignment.center,
											children: <Widget>[
												Text(DCTime.formatDateTime(dateTimeString: e.toString(), style: dtstyle), style: TextStyle(
													fontSize: 14,
													color: textColor
												),),
												Icon(Icons.arrow_drop_down, color: textColor,),
											],
										),
									),
								],
							),
							actions: <Widget>[
								new FlatButton(
									child: Text(cancelStr, style: TextStyle(
										color: textColor
									),),
									onPressed: () {
										if (onCancel == null) {
											Navigator.of(context).pop();
										} else {
											onCancel();
										}
									}
								),
								new FlatButton(
									child: Text(ensureStr, style: TextStyle(
										color: textColor
									),),
									onPressed: () {
										selectedDone([b, e]);
									}
								)
							]
						),
					);
				},
			);
		});
}

/// 取消显示的对话框或者加载框(应该与前面的方法成对出现)
/// 注意:用这个方法后不要再用Navigator.pop()方法再次关闭对话框
FCDismissDialog(BuildContext ctx) {
	if (_dialogType == null) return;
	switch (_dialogType) {
		case DialogType.show:
			Navigator.pop(ctx);
			break;
		case DialogType.overlay:
			overlayEntry?.remove();
			break;
	}
}






