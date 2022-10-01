import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sandec_magic_of_getx/app/model/ResponseModel.dart';

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "http://192.168.100.10:5000";

    httpClient.addResponseModifier((request, response) {
      debugPrint(
        '\n╔══════════════════════════ Response ══════════════════════════\n'
        '╟ REQUEST ║ ${request.method.toUpperCase()}\n'
        '╟ url: ${request.url}\n'
        '╟ Headers: ${request.headers}\n'
        '╟ Body: ${request.bodyBytes.map((event) => event.asMap().toString()) ?? ''}\n'
        '╟ Status Code: ${response.statusCode}\n'
        '╟ Data: ${response.bodyString?.toString() ?? ''}'
        '\n╚══════════════════════════ Response ══════════════════════════\n',
        wrapWidth: 1024,
      );
      return response;
    });

    super.onInit();
  }

  Future<ResponseModel> postNew(
      String name, String description, String bornDate) async {
    final body = {
      'name': name,
      'description': description,
      'born_date': bornDate
    };
    final response = await post("/api/new", body);
    return ResponseModel.fromJson(response.body);
  }

  Future<ResponseModel> getAll() async {
    final response = await get("/api/all");
    return ResponseModel.fromJson(response.body);
  }
}
