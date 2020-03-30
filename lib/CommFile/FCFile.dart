import 'dart:io';
import 'package:tuple/tuple.dart';

class FCFile {
	static Tuple2<String,String> splitFilename(String fileName){
		List<String> splitedFileName = fileName.split(".");
		return Tuple2(splitedFileName[0], splitedFileName[1]);
	}
}