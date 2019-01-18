import 'package:tripledes/tripledes.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:typed_data';


class FCEncrypt{
	static String encryptUse3des(String originText,String keyStr) {
		var blockCipher = new BlockCipher(new DESEngine(), keyStr);
		return blockCipher.encodeB64(originText);
	}

	static String decryptUse3des(String encryptedStr,String keyStr){
		var blockCipher = new BlockCipher(new DESEngine(), keyStr);
		return blockCipher.decodeB64(encryptedStr);
	}

	static String encryptUseMd5(String data) {
		List<int> intList = utf8.encode(data);
		var result = md5.convert(intList);
		return result.toString();
	}

	static String encodeUseBase64(String data){
		Uint8List u8Str = Uint8List.fromList(data.codeUnits);
		String base64Str = base64Encode(u8Str);
		return base64Str;
	}

	static String decodeUseBase64(String data){
		Uint8List u8Str =  base64Decode(data);
		String originStr = String.fromCharCodes(u8Str);
		return originStr;
	}
}