
import 'dart:convert';
import 'package:flutter/material.dart' as mt;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:image/image.dart' as ii;
import 'package:flutter_image_compress/flutter_image_compress.dart';


/// 很多库中定义和图片相关的类都叫Image
/// 所以所有的Image类前面都带有库名
/// 比如ui.Image或者mt.Image
/// 一般情况下mt.Image是个widget
/// ui.Image通常会被包装成ImageProvider



class FCImageConver{
	///通过base64得到mt.Image
	static mt.Image fromBase64ToImage(String base64Str){
		Uint8List bytes = base64.decode(base64Str);
		return mt.Image.memory(bytes);
	}
	
	///把ui.Image转成unit8Lit
	static Future<Uint8List> uiimage2unit8list(ui.Image image) async{
		ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
		Uint8List pngBytes = byteData.buffer.asUint8List();
		return pngBytes;
	}
	
	///把mtimage转成uiimage
   static mtimage2uiimage(Image image,callback(ui.Image img)){
	   /// 要先从Image中拿到图片数据流ImageStream,在Image的ImagePrivode里
	   ImageStream imageStream = image.image.resolve(ImageConfiguration.empty);
	   /// 然后通过添加流的监听器获取ui.Image
	   /// 回调中的imageInfo就带有ui.Image的数据
	   imageStream.addListener(ImageStreamListener((_info,_){
		   callback(_info.image);
	   }));
   }
   
   ///把uiimage转成mtimage
   static Future<mt.Image> uiimage2mtimage(ui.Image image) async {
	   ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
	   Uint8List pngBytes = byteData.buffer.asUint8List();
	   return mt.Image.memory(pngBytes);
   }
   
   ///旋转图片
	static Future<Uint8List> rotateImage(Uint8List imageData,int degree) async {
		var intList = await FlutterImageCompress.compressWithList(imageData, rotate: degree);
		return Uint8List.fromList(intList);
	}
	
	///截取widget图片
	static Future<Uint8List> captureWidget(GlobalKey gk) async {
		RenderRepaintBoundary boundary = gk.currentContext.findRenderObject();
		
		//生成图片
		ui.Image image = await boundary.toImage(pixelRatio: 3.0);
		
		//将图片转成Uint8List
		ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
		Uint8List pngBytes = byteData.buffer.asUint8List();
		return pngBytes;
	}
}