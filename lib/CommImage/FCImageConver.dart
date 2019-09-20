
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;



/// 很多库中定义和图片相关的类都叫Image
/// 所以所有的Image类前面都带有库名
/// 比如ui.Image或者mt.Image
/// 一般情况下mt.Image是个widget
/// ui.Image通常会被包装成ImageProvider



class FCImageConver{
	///通过base64得到mt.Image
	static Image fromBase64ToImage(String base64Str){
		Uint8List bytes = base64.decode(base64Str);
		return Image.memory(bytes);
	}
	
	///把ui.Image转成unit8Lit
	static Future<Uint8List> uiimage2unit8list(ui.Image image) async{
		ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
		Uint8List pngBytes = byteData.buffer.asUint8List();
		return pngBytes;
	}
	
	///把mtimage转成uiimage(回调方式)
   static mtimage2uiimageWitchCb(Image image,callback(ui.Image img)){
	   /// 要先从Image中拿到图片数据流ImageStream,在Image的ImagePrivode里
	   ImageStream imageStream = image.image.resolve(ImageConfiguration.empty);
	   /// 然后通过添加流的监听器获取ui.Image
	   /// 回调中的imageInfo就带有ui.Image的数据
	   imageStream.addListener(ImageStreamListener((_info,_){
		   callback(_info.image);
	   }));
//	   imageStream.addListener((_info,_){
//		   callback(_info.image);
//	   });
   }
   
   static Future<ui.Image> mtimage2uiimage(Image image) async{
	   ImageStream imageStream = image.image.resolve(ImageConfiguration());
	   Completer<ui.Image> completer = Completer<ui.Image>();
	   void imageListener(ImageInfo info, bool synchronousCall) {
		   ui.Image image = info.image;
		   completer.complete(image);
		   imageStream.removeListener(ImageStreamListener(imageListener));
	   }
	   imageStream.addListener(ImageStreamListener(imageListener));
	   return completer.future;
   }
   
   ///把uiimage转成mtimage
   static Future<Image> uiimage2mtimage(ui.Image image) async {
	   ByteData byteData = await image.toByteData(format: ui.ImageByteFormat.png);
	   Uint8List pngBytes = byteData.buffer.asUint8List();
	   return Image.memory(pngBytes);
   }
   
   
   

}