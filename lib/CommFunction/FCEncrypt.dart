import 'package:tripledes/tripledes.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:typed_data';
import 'package:encrypt/encrypt.dart';

class FCEncrypt{

	/// Aes加解密
	static String encryptUseAes(String originText,String keyStr) {
		final key = Key.fromUtf8(keyStr);
		final iv = IV.fromLength(16);
		final encrypter = Encrypter(AES(key, iv,mode: AESMode.ecb));

		// encrypted是加密后的Encrypted对象,并不是String,需要用base64方法获取字符串
		final encrypted = encrypter.encrypt(originText);
		return encrypted.base64;
	}

	static String decryptUseAes(String encryptedStr,String keyStr){
		final key = Key.fromUtf8(keyStr);
		final iv = IV.fromLength(16);
		final encrypter = Encrypter(AES(key, iv,mode: AESMode.ecb));

		// 解密的方法需要一个Encrypted对象,所以需要通过密文创建一个Encrypted对象
		// 解密出来的直接就是字符串
		final encrypted = Encrypted.fromBase64(encryptedStr);
		return encrypter.decrypt(encrypted);
	}

	/// 3des加解密(注意:对中文支持有点问题)
	static String encryptUse3des(String originText,String keyStr) {
		var blockCipher = new BlockCipher(new DESEngine(), keyStr);
		return blockCipher.encodeB64(originText);
	}

	static String decryptUse3des(String encryptedStr,String keyStr){
		var blockCipher = new BlockCipher(new DESEngine(), keyStr);
		return blockCipher.decodeB64(encryptedStr);
	}

	/// md5
	static String encryptUseMd5(String data) {
		List<int> intList = utf8.encode(data);
		var result = md5.convert(intList);
		return result.toString();
	}

	/// base64加解密
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