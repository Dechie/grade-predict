import 'dart:io';
import 'package:flutter/services.dart';
import 'dart:convert';

class Api {
  Map<String, Map<String, dynamic>> reverseEnc = {};
  Api._();

  static Future<Api> create() async {
    var api = Api._();
    await api.applyValue();
    return api;
  }

  // asynchronous constructor

  Future<void> applyValue() async {
    reverseEnc = await _loadReverseEncodedJson();
  }

  Future<Map<String, Map<String, dynamic>>> _loadReverseEncodedJson() async {
    Map<String, Map<String, dynamic>> revv = {};
    try {
      String reverseEncoded =
          await rootBundle.loadString('assets/json/reverse_encoded.json');

      Map<String, dynamic> reverseEncodedVals = json.decode(reverseEncoded);

      for (var entry in reverseEncodedVals.entries) {
        //Map<String, dynamic> keyVal = Map.fromIterable(entry as Iterable);
        revv[entry.key] = Map<String, dynamic>.from(entry.value);
      }
      //print(reverseEnc);
    } catch (e) {
      print(e);
    }

    return revv;
  }

  sendRequest(Map<String, dynamic> dataDecode) {}
}
