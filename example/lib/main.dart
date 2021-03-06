//import 'dart:html';

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
		
//		List<String> ds = List.generate(10, (_i){
//			return _i.toString()+"v";
//		});
//
//		FCPicker(ctx: context,dataSource: ds, selectDone:(_i,_v){
//			print("v:$_v");
//		},defaultValueIndex: 5).showPickerDialog();
		
		DateTime dt = DateTime(1999,3,13);
	
//		FCPicker.pickDateTime(context, (_dt){
//			print("dt:$_dt");
//			DateTime dt = DateTime(1999,_dt.month,_dt.day);
//
//			print("dtt:$dt");
//		},hideYear: true,initTime: dt);
	
		FCPicker.pickDate(context, (_dt){
			print("dt:$_dt");
		});
	
	}
	
	@override
	Widget build(BuildContext context) {
		TextEditingController _ctrl = TextEditingController();
		_ctrl.text = "disburden";
		
		final TextStyle titleStyle = TextStyle(
			fontSize: 14
		);
		final TextStyle hintStyle = titleStyle;
		final EdgeInsets padding = EdgeInsets.symmetric(horizontal: 16, vertical: 0);
		
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
						FCSettingItemWidget("hoho",aPadding: padding,subWidget: Text("oo",textAlign: TextAlign.right),),
						FCSettingItemWidget("xixi",aPadding: padding,subWidget: Text("ii",textAlign: TextAlign.right,),),
						FCSettingItemWidget("职位", titleStyle: titleStyle,
							aPadding: padding,
							needRightArrow: true,
							subWidget: TextField(
								readOnly: true,
								keyboardType: TextInputType.text,
								textAlign: TextAlign.right,
								decoration: InputDecoration(
									isDense: true,
									hintText: "请输入",
									hintStyle: hintStyle,
									border: InputBorder.none,
//											contentPadding: EdgeInsets.only(top: 1),
								),
								style: titleStyle,
							),
						),
						FCLine(height: 1, leftIndent: 16, rightIndent: 16),
						FCSettingItemWidget(
							"姓名",
							titleStyle: titleStyle,
							aPadding: padding,
							needRightArrow: true,
							subWidget: TextField(
								keyboardType: TextInputType.text,
								textAlign: TextAlign.right,
								decoration: InputDecoration(
									isDense: true,
									hintText: "请输入",
									hintStyle: hintStyle,
									border: InputBorder.none,
//																	contentPadding: EdgeInsets.only(top: 1),
								),
								style: titleStyle,
							),
						),
						FCLine(height: 1, leftIndent: 16, rightIndent: 16),
						FCSettingItemWidget(
							"姓名",
							titleStyle: titleStyle,
							aPadding: padding,
							needRightArrow: false,
							subWidget: Padding(
							  padding: padding,
							  child: TextField(
							  	keyboardType: TextInputType.text,
							  	textAlign: TextAlign.right,
							  	decoration: InputDecoration(
							  		isDense: true,
							  		hintText: "请输入",
							  		hintStyle: hintStyle,
							  		border: InputBorder.none,
//																	contentPadding: EdgeInsets.only(top: 1),
							  	),
							  	style: titleStyle,
							  ),
							),
						),
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

