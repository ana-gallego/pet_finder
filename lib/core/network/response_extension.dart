import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:pet_finder/core/network/api_response.dart';

extension ResponseExtension on Response {
  ApiResponse<T> toApiResponse<T>() {
    _printResponse(this);
    final body = this.body;
    if (body.isEmpty) {
      return ApiResponse<T>(
        success: false,
        message: 'There was an error while processing the request',
      );
    }

    return ApiResponse<T>(
      success: true,
      message: 'The request was received successfully',
      data: body as T,
    );
  }

  void _printResponse(Response response) {
    final body =
        response.request?.method != 'GET' ? '\n[body]: ${response.body}' : '';
    debugPrint(
      '[http-service] [validateResponse]'
      '$body'
      '\ncode: ${response.statusCode}'
      '\nrequest: ${response.request}',
    );
  }
}
