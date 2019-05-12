import 'package:flutter/material.dart';

typedef InputDone = void Function(String text);

enum DialogDemoAction {
	cancel,
	discard,
	disagree,
	agree,
}

/// 显示加载框，注意：要在StatefulWidget下调用
/// Use a [StatefulBuilder] or a custom [StatefulWidget] if the dialog needs to update dynamically.
Future<Null> FCShowLoadingDialog({@required BuildContext context, String text = '', String loadingPath = ""}) async {
	if (text.isEmpty) {
		text = "Loading...";
	}
	return showDialog<Null>(
		context: context,
		barrierDismissible: false,
		builder: (BuildContext context) {
			return _DialogComponent(text: text, loadingPath: loadingPath);
		},
	);
}

/// 取消显示加载框
void dismissLoadingDialog({@required BuildContext context}) {
	Navigator.pop(context);
}

/// 此dialog控件会屏蔽返回按键
/// android端按下返回按键会导致dialog被关闭
class _DialogComponent extends StatelessWidget {
	final String text;
	final String loadingPath;

	_DialogComponent({@required this.text, @required this.loadingPath});

	@override
	Widget build(BuildContext context) {
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
											child: Image.asset(loadingPath),
										),
										Text(
											text,
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

///====================提示类对话框====================


void _showDemoDialog<T>({ BuildContext context, Widget child }) {
	showDialog<T>(
		context: context,
		builder: (BuildContext context) => child,
	)
		.then<void>((T value) { // The value passed to Navigator.pop() or null.
            if (value != null) {
//                _scaffoldKey.currentState.showSnackBar(new SnackBar(
//                    content: new Text('You selected: $value')
//                ));
            }
	});
}


/// 提示对话框,并带有两个按钮(默认名称为"确定"和"取消")
alertWith2Operation(BuildContext context, String message, VoidCallback onEnsure, {String cancelStr, String ensureStr, VoidCallback onCancel}) {

//	ensureStr ??= lg.getString("确定");
//	cancelStr ??= lg.getString("取消");

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
				dialogBackgroundColor:Color.fromARGB(0xcc, 0x00, 0x00, 0x00),
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

FCInputDialog(
	BuildContext context,
	String message,
	bool isPass,
	InputDone onEnsure,
	{
		String cancelStr = '取消',
		String ensureStr = "确定",
		TextInputType keyboardType=TextInputType.text,
		Color backgroundColor = const Color.fromARGB(0xcc, 0x00, 0x00, 0x00),
		Color boderColor = Colors.white,
		Color textColor = Colors.white,
		VoidCallback onCancel
	})
{
	final TextStyle dialogTextStyle = TextStyle(
		fontSize: 14.0,
		color: Colors.white,
	);
	String tftext = "";
	_showDemoDialog<DialogDemoAction>(
		context: context,
		child: Theme(
			data: Theme.of(context).copyWith(
				dialogBackgroundColor:backgroundColor,
			),
			child: new AlertDialog(
				content: TextField(
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
					onChanged: (txt){
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




