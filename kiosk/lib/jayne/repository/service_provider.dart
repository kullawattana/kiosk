import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:kiosk/jayne/controllers/send_message_stream.dart';
import 'package:kiosk/jayne/model/request/bot_request.dart';
import 'package:http/http.dart' as http;
import 'package:kiosk/jayne/model/request/summary_request.dart';
import 'package:kiosk/jayne/model/response/bot_response.dart';

const ipAddress = "184.72.103.175:5000";

class ServiceProvider {
  static final ServiceProvider _instance = ServiceProvider._internal();
  StreamSubscription? subscription;

  ServiceProvider._internal();

  factory ServiceProvider() {
    return _instance;
  }
  
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
    final sendMessageStream = SendMessageStream();
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
    final jsonRequest = jsonEncode(request.toJson());
    final response = await http.post(Uri.http(ipAddress, '/chat'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonRequest,
    );
    if (response.statusCode == HttpStatus.ok) {
      var decodedResponse = jsonDecode(response.body);
      final responseApi = BotResponse.fromJson(decodedResponse);
      debugPrint(responseApi.output);
      debugPrint(responseApi.retrievedReferences?[0].content);
      debugPrint(responseApi.retrievedReferences?[0].metadata?.code);
      debugPrint(responseApi.retrievedReferences?[0].metadata?.productUrl);
      sendMessageStream.sendDataWebsocket(responseApi);
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

  Future<ApiResponse> summaryText({
    required String text,
  }) async {
    final request = SummaryRequest(
      inputText: text,
    );
    final response = await http.post(Uri.http(ipAddress, '/chat'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: request,
    );
    if (response.statusCode == HttpStatus.ok) {
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
