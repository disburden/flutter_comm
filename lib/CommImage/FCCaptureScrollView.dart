

part of 'package:flutter_comm/CommImage/FCImageOperation.dart';

//import 'dart:typed_data';
//import 'dart:ui' as ui;
//import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';

class FCCaptureScrollView extends StatefulWidget {
	final Widget child;
	final CaptureController controller;
	
	FCCaptureScrollView({@required this.child, this.controller});
	
	@override
	_FCCaptureScrollViewState createState() => _FCCaptureScrollViewState();
}

class _FCCaptureScrollViewState extends State<FCCaptureScrollView> {
	GlobalKey<_OverRepaintBoundaryState> globalKey = GlobalKey();
	
	@override
	void initState() {
		super.initState();
		if (widget.controller != null) {
			widget.controller.setGlobalKey(globalKey);
		}
	}
	
	@override
	Widget build(BuildContext context) {
		return SingleChildScrollView(
			scrollDirection: Axis.vertical,
			child: SingleChildScrollView(
				scrollDirection: Axis.horizontal,
				child: _OverRepaintBoundary(
					key: globalKey,
					child: RepaintBoundary(
						child: widget.child,
					),
				),
			),
		);
	}
	
	
}

class _OverRepaintBoundary extends StatefulWidget {
	final Widget child;
	
	const _OverRepaintBoundary({Key key, this.child}) : super(key: key);
	
	@override
	_OverRepaintBoundaryState createState() => _OverRepaintBoundaryState();
}

class _OverRepaintBoundaryState extends State<_OverRepaintBoundary> {
	@override
	Widget build(BuildContext context) {
		return widget.child;
	}
}

class CaptureController {
	GlobalKey<_OverRepaintBoundaryState> globalKey;
	
	Future<Uint8List> makeImageUint8List() async {
		RenderRepaintBoundary boundary = globalKey.currentContext.findRenderObject();
		ui.Image image = await boundary.toImage(pixelRatio: ui.window.devicePixelRatio);
		ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
		Uint8List pngBytes = byteData.buffer.asUint8List();
		return pngBytes;
	}
	
	setGlobalKey(GlobalKey<_OverRepaintBoundaryState> globalKey) {
		this.globalKey = globalKey;
	}
}
