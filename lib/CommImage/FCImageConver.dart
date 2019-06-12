

import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:typed_data';

class FCImageConver{
	static Image fromBase64ToImage(String base64Str){
		Uint8List bytes = base64.decode(base64Str);
		return Image.memory(bytes);
	}
}