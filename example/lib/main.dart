import 'package:flutter/material.dart';
import 'package:flutter_comm/flutter_comm.dart';
import 'package:dartcomm/dartcomm.dart';
import 'dart:typed_data';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: MyHomePage(title: 'Flutter Demo Home Page'),
		);
	}
}

class MyHomePage extends StatefulWidget {
	MyHomePage({Key key, this.title}) : super(key: key);
	
	
	final String title;
	
	@override
	_MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	
	
	void _incrementCounter() {
	}
	
	@override
	Widget build(BuildContext context) {
		TextEditingController _ctrl = TextEditingController();
		_ctrl.text = "disburden";
		
		FCIconNoti inoti = FCIconNoti(
			icon: Icon(Icons.print),
			title: '注意了',
			content: "注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了",
		
		);
		
		return Scaffold(
			appBar: AppBar(
				// Here we take the value from the MyHomePage object that was created by
				// the App.build method, and use it to set our appbar title.
				title: Text(widget.title),
			),
			body: Center(
				// Center is a layout widget. It takes a single child and positions it
				// in the middle of the parent.
				child: Column(
					mainAxisAlignment: MainAxisAlignment.center,
					children: <Widget>[
						FCImageButton(
							image: Icon(Icons.map),
							tag: 1,
							text: Text("nnn"),
							onClick: (_idx,_flag) {
								print("$_idx");
							},
							gapBetweenImageAndText: 8.0,
							style: ImageButtonStyle.topImageButtonText,
							padding: EdgeInsets.zero,
						),
						FCSettingItemWidget("hoho"),
						FCSettingItemWidget("xixi"),
						FCLine(),
//						Expanded(
//							child: ListView.builder(
//								itemBuilder: (context, idx) {
//									return Container(
//										height: 30,
//										child: Text("$idx"),
//									);
//								},
//								itemCount: 30,
//							),
//						),
						inoti,
					],
				),
			),
			floatingActionButton: FloatingActionButton(
				onPressed: _incrementCounter,
				tooltip: 'Increment',
				child: Icon(Icons.add),
			), // This trailing comma makes auto-formatting nicer for build methods.
		);
	}
}

@override
Widget build(BuildContext context) {
	// TODO: implement build
	return null;
}

