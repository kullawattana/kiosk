import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:kiosk/jayne/model/request/bot_request.dart';
import 'package:http/http.dart' as http;
import 'package:kiosk/jayne/model/response/bot_response.dart';

const ipAddress = "184.72.103.175:5000";

class ServiceProvider {
  Future<ApiResponse> requestProduct({
    required String userContent,
    required String botContent,
    required String inputText,
    required int minPrice,
    required int maxPrice,
    required int minDiscountPc,
    required int minDiscountValue,
    required int minPoint,
  }) async {
    List<ChatHistory> messages = [
      ChatHistory(role: "user", content: userContent),
      ChatHistory(role: "bot", content: botContent),
    ];
    final request = BotRequest(
      inputText: inputText,
      chatHistory: messages,
      minPrice: minPrice,
      maxPrice: maxPrice,
      minDiscountPc: minDiscountPc,
      minDiscountValue: minDiscountValue,
      minPoint: minPoint,
    );
    final response = await http.post(Uri.http(ipAddress, '/chat'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: request,
    );
    if (response.statusCode == HttpStatus.ok) {
      final responseApi = BotResponse.fromJson(json.decode(response.body));
      debugPrint(responseApi.output);
      debugPrint(responseApi.retrievedReferences?[0].content);
      debugPrint(responseApi.retrievedReferences?[0].metadata?.code);
      debugPrint(responseApi.retrievedReferences?[0].metadata?.productUrl);
      return ApiResponse(
        isSuccess: true,
        statusCode: response.statusCode,
        responseBody: response.body,
      );
    } else {
      return ApiResponse(
        isSuccess: false,
        statusCode: response.statusCode,
        responseBody: response.body,
      );
    }
  }
}

class ApiResponse {
  bool isSuccess;
  int statusCode;
  String responseBody;

  ApiResponse({
    this.isSuccess = false,
    this.statusCode = 0,
    this.responseBody = "",
  });
}
