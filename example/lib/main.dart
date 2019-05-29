import 'package:flutter/material.dart';
import 'package:flutter_comm/flutter_comm.dart';
import 'package:dart_comm/dart_comm.dart';
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
	int _counter = 0;
	
	FCTextView tv;
	
	void _incrementCounter() {
//		FCShowJhTransparent(context: context);
//	FCShowJhNormal(context: context);

//		Future.delayed(Duration(seconds: 3),(){
//			FCDismissDialog(context);
//		});
		
		FCInputDialogWithOneField(context, "ss", false, (_s) {
			print("输入的值是:$_s");
		}, defaultText: "123");


//		FCShowStateDialog(context: context,text: "hoho是啊的沙发斯蒂芬就是地方阿萨德分撒旦发发送到发的",iconImage: CircularProgressIndicator());
//		Future.delayed(Duration(seconds: 3),(){
//			FCShowStateDialog(context: context,text: "xixi",iconImage: Icon(Icons.brightness_3,color: Colors.cyan,));
//		});
	}
	
	@override
	Widget build(BuildContext context) {
		TextEditingController _ctrl = TextEditingController();
		_ctrl.text = "disburden";
		
		tv = FCTextView(
			height: 150.0,
			width: MediaQuery
				.of(context)
				.size
				.width,
			backgroundColor: Colors.cyan,
			controller: _ctrl,
		);
		
		FCIconNoti inoti = FCIconNoti(
//			Colors.cyan,
//			8,
			icon: Icon(Icons.print),
			title: '注意了',
			content: "注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了注意了",
//			textStyle:TextStyle(
//				color: Colors.orange,
//				fontSize: 12,
//			),
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
				child: SingleChildScrollView(
				  child: Column(
				  	mainAxisAlignment: MainAxisAlignment.center,
				  	children: <Widget>[
				  		tv,
				  		FCImageButton(
				  			image: Icon(Icons.map),
				  			tag: 1,
				  			text: Text("nnn"),
				  			onClick: (_idx) {
				  				print("$_idx");
				  			},
				  			gapBetweenImageAndText: 8.0,
				  			style: ImageButtonStyle.topImageButtonText,
				  			padding: EdgeInsets.zero,
				  		),
				  		Expanded(
				  			child: ListView.builder(
				  				itemBuilder: (context, idx) {
				  					return Container(
				  						height: 30,
				  						child: Text("$idx"),
				  					);
				  				},
				  				itemCount: 30,
				  			),
				  		),
				  		inoti,
				  	],
				  ),
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
