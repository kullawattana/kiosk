import 'dart:async';
import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:kiosk/jayne/model/request/product_request.dart';
import 'package:http/http.dart' as http;

const devEnv = "dev";
const androidIpAddress = "10.0.2.2:4001";
const iOSIpAddress = "127.0.0.1:4001";

class ServiceProvider {
  final environment = dotenv.get('ENVIRONMENT');
  final serverUri = dotenv.get('SERVER_URL');

  Future<ApiResponse> requestProduct() async {
    final request = ProductRequest(
      message: "",
    );
    final response = await http.post(
      environment == devEnv
          ? Uri.http(
              Platform.isIOS //
                  ? iOSIpAddress
                  : androidIpAddress,
              '/oauth2/token',
            )
          : Uri.https(serverUri, ''),
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
