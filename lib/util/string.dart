import 'dart:convert';
import 'dart:ffi';

import 'package:ffi/ffi.dart';

class GFFi {
  static String dartString(Pointer<Char> char) {
    return char.cast<Utf8>().toDartString();
  }

  static Pointer<Char> goChar(String char) {
    return char.toString().toNativeUtf8().cast<Char>();
  }

  static Pointer<Char> goJson(Map<String, dynamic> data) {
    return jsonEncode(data).toNativeUtf8().cast<Char>();
  }

  static dynamic dartJson(Pointer<Char> data) {
    return jsonDecode(dartString(data));
  }

  static void free(Pointer<NativeType> pointer) {
    calloc.free(pointer);
  }

  static String json2str(Map<String, dynamic> data) {
    return jsonEncode(data);
  }
}
