library FCImageOperation;

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';



class FCImageOperation {
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
	
	/// 保存图片到磁盘
	static Future<String> saveIamge(Uint8List imageData,String filenmae,{int dirType=0}) async{
		//dirtype预留的,用来指定保存目录的类型,比如用户document目录还是临时目录
		
		Directory appDocDir = await getApplicationDocumentsDirectory();
		File newFile = File(path.join(appDocDir.path, filenmae));
		await newFile.writeAsBytesSync(imageData);
		
		return newFile.path;
	}
	
	///旋转图片
	static Future<Uint8List> rotateImage(Uint8List imageData,int degree) async {
		var intList = await FlutterImageCompress.compressWithList(imageData, rotate: degree);
		return Uint8List.fromList(intList);
	}
	
	///从图片的指定区域裁剪出新的小图片
//	static Future<ui.Image> subImage(ui.Image originImage,Rect clipRect){
//
//	}
}