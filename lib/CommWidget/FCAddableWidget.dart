import 'package:flutter/material.dart';

class FCAddableWidget extends StatefulWidget {

	_FCAddableWidgetState state;

	final Widget child;

	FCAddableWidget({@required this.child});

	void addSubView({@required Widget child, double top=0.0,double left=0.0,double height,double width}) {
		state.addSubView(
			child: child,
			top: top,
			left: left,
			height: height,
			width: width
		);
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

	void addSubView({@required Widget child, double top=0.0,double left=0.0,double height,double width}) {
		Positioned p = Positioned(
			child: SizedBox(
				height: height,
				width: width,
				child: child,
			),
			top: top,
			left: left,
		);
		children.add(p);
		setState(() {});
	}


}
