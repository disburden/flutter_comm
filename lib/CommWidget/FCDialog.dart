import 'package:flutter/material.dart';

/// 显示加载框，注意：要在StatefulWidget下调用
/// Use a [StatefulBuilder] or a custom [StatefulWidget] if the dialog needs to update dynamically.
Future<Null> showLoadingDialog({@required BuildContext context, String text = '', String loadingPath = ""}) async {
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