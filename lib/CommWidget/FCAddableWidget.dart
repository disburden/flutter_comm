import 'package:flutter/material.dart';

class FCAddableWidget extends StatefulWidget {

	_FCAddableWidgetState state;

	final Widget child;

	FCAddableWidget({@required this.child});

	void addSubView() {
		state.addSubView();
	}


	@override
	_FCAddableWidgetState createState() {
		state = _FCAddableWidgetState();
		return state;
	}
}

class _FCAddableWidgetState extends State<FCAddableWidget> {

	List<Widget> children;

	@override
	void initState() {
		super.initState();
		children = [widget.child];
	}


	@override
	Widget build(BuildContext context) {
		return Stack(
			children: children,
		);
	}

	void addSubView() {
		Positioned p = Positioned(
			child: Text("disburden"),
			top: 1.0,
			left: 1.0,

		);
		children.add(p);
		setState(() {});
	}
}
