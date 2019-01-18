import 'package:flutter/material.dart';
import 'package:flutter_comm/flutter_comm.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	// This widget is the root of your application.
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			theme: ThemeData(
				// This is the theme of your application.
				//
				// Try running your application with "flutter run". You'll see the
				// application has a blue toolbar. Then, without quitting the app, try
				// changing the primarySwatch below to Colors.green and then invoke
				// "hot reload" (press "r" in the console where you ran "flutter run",
				// or simply save your changes to "hot reload" in a Flutter IDE).
				// Notice that the counter didn't reset back to zero; the application
				// is not restarted.
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


	FCAddableWidget ad = FCAddableWidget(child: Container(
		height: 100,
		color: Colors.orange,
	));

	FCTextView tv;

	void _incrementCounter() {
		print(tv.text);
		tv.text = "hoho change to galking";
//		setState(() {
//			ad.addSubView(
//				child: Container(
//					color: Colors.black26,
//				),
//				height: 20.0,
//				width: 5.0,
//				top: 40.0,
//				left: 30.0
//			);
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
						tv,
						ad,
//            Text(
//              'You have pushed the button this many times:',
//            ),
//            Text(
//              '$_counter',
//              style: Theme.of(context).textTheme.display1,
//            ),
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
