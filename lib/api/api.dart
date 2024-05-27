import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/services.dart';

class Api {
  Map<String, Map<String, dynamic>> reverseEnc = {};
  Api._();

  // asynchronous constructor

  Future<void> applyValue() async {
    reverseEnc = await _loadReverseEncodedJson();
  }

  Future<List<List<FlSpot>>> getCorrelations() async {
    Dio dio = Dio();
    Response response;
    List here = [];

    try {
      response = await dio.get("http://127.0.0.1:5000/get-correlations");

      if (response.statusCode == 200) {
        var data = response.data;
        here = data;

        print(data);
      }
    } catch (e) {
      print(e.toString());
    }

    List<List> cor1 = [], cor2 = [], cor3 = [], cor4 = [], cor5 = [], cor6 = [];
    for (var entry in here) {
      for (var ent in entry.entries) {
        switch (ent.key) {
          case "G1":
            cor1.add([ent.value, entry["G3"]]);
            break;
          case "G2":
            cor2.add([ent.value, entry["G3"]]);
            break;
          case "Medu":
            cor3.add([ent.value, entry["G3"]]);
            break;
          case "age":
            cor4.add([ent.value, entry["G3"]]);
            break;
          case "failures":
            cor5.add([ent.value, entry["G3"]]);
            break;
          case "higher":
            cor6.add([ent.value, entry["G3"]]);
            break;
        }
      }
    }

    List<List<FlSpot>> result = [];

    result.add(
        cor1.map((e) => FlSpot(e[0].toDouble(), e[1].toDouble())).toList());
    result.add(
        cor2.map((e) => FlSpot(e[0].toDouble(), e[1].toDouble())).toList());
    result.add(
        cor3.map((e) => FlSpot(e[0].toDouble(), e[1].toDouble())).toList());
    result.add(
        cor4.map((e) => FlSpot(e[0].toDouble(), e[1].toDouble())).toList());
    result.add(
        cor5.map((e) => FlSpot(e[0].toDouble(), e[1].toDouble())).toList());
    result.add(
        cor6.map((e) => FlSpot(e[0].toDouble(), e[1].toDouble())).toList());

    print("result");
    print(result);
    return result;
  }

  Future<double> sendRequest(Map<String, dynamic> dataDecode) async {
    var dio = Dio();
    double prediction = 0.0;
    for (var ent in dataDecode.entries) {
      print("${ent.key}: ${ent.value.runtimeType}");
    }

    Response response;

    try {
      response = await dio.post(
        "http://127.0.0.1:5000/predict",
        data: dataDecode,
      );

      if (response.statusCode == 200) {
        print(response.data);
        prediction = response.data["prediction"][0];
      }
    } catch (e) {
      print(e.toString());
    }
    return prediction;
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

  static Future<Api> create() async {
    var api = Api._();
    await api.applyValue();
    return api;
  }
}
