import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:pet_finder/core/network/api_response.dart';
import 'package:pet_finder/core/network/response_extension.dart';

abstract class HttpClient {
  Future<ApiResponse<T>> get<T>(String endpoint);

  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    required Map<String, dynamic> body,
  });

  Future<ApiResponse<T>> put<T>(
    String endpoint, {
    required Map<String, dynamic> body,
  });

  Future<ApiResponse<T>> delete<T>(
    String endpoint, {
    Map<String, dynamic>? body,
  });

  Future<ApiResponse<T>> multipart<T>(
    String endpoint, {
    required String filePath,
    required Uint8List imageBytes,
    Map<String, String> body,
  });
}

class HttpClientImpl extends HttpClient {
  HttpClientImpl({
    required this.url,
    required this.client,
    this.token,
  });

  final String url;
  final Client client;
  final String? token;

  Map<String, String> _headers() {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };
  }

  @override
  Future<ApiResponse<T>> get<T>(String endpoint) async {
    try {
      final response = await client.get(
        Uri.parse('$url$endpoint'),
        headers: _headers(),
      );
      return response.toApiResponse();
    } catch (e) {
      return ApiResponse(success: false, message: '$e');
    }
  }

  @override
  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await client.post(
        Uri.parse('$url$endpoint'),
        body: json.encode(body),
        headers: _headers(),
      );

      return response.toApiResponse();
    } on TimeoutException catch (_) {
      return ApiResponse(success: false, message: 'Timeout');
    } catch (e) {
      return ApiResponse(success: false, message: 'Error: $e');
    }
  }

  @override
  Future<ApiResponse<T>> put<T>(
    String endpoint, {
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await client
          .put(
            Uri.parse('$url$endpoint'),
            body: json.encode(body),
            headers: _headers(),
          )
          .timeout(
            const Duration(seconds: 10),
            onTimeout: onTimeout,
          );

      return response.toApiResponse();
    } on TimeoutException catch (_) {
      return ApiResponse(success: false, message: 'Timeout');
    } catch (e) {
      return ApiResponse(success: false, message: 'e');
    }
  }

  @override
  Future<ApiResponse<T>> delete<T>(
    String endpoint, {
    Map<String, dynamic>? body,
  }) async {
    try {
      final response = await client.delete(
        Uri.parse('$url$endpoint'),
        body: body != null ? json.encode(body) : null,
        headers: _headers(),
      );

      return response.toApiResponse();
    } catch (e) {
      return ApiResponse(success: false, message: 'e');
    }
  }

  @override
  Future<ApiResponse<T>> multipart<T>(
    String endpoint, {
    required String filePath,
    required Uint8List imageBytes,
    Map<String, String>? body,
  }) async {
    throw UnimplementedError('multipart not implemented yet');
  }

  FutureOr<Response> onTimeout() =>
      throw TimeoutException('{"error": "Timeout"}');
}
