// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:pet_finder/core/extensions/string_extension.dart';
import 'package:pet_finder/core/network/response_extension.dart';
import 'package:pet_finder/core/utils/constants.dart';
import 'package:pet_finder/features/miscellaneous/token_handler.dart';

class GetPetsTypesUseCase {
  final String token;
  GetPetsTypesUseCase({
    required this.token,
  });
  Future<List<String>> call() async {
    try {
      final response = await Client().get(
        '$kURL/types'.toUri(),
        headers: await _headers(),
      );

      final res = response.toApiResponse<String>();

      if (res.success) {
        final body = json.decode(res.data!) as Map<String, dynamic>;
        final types = body['types'] as List<dynamic>;
        return types
            .map((e) => (e as Map<String, dynamic>)['name'] as String)
            .toList();
      }

      throw Exception(res.message);
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Map<String, String>> _headers() async {
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };
  }
}

final getPetsTypesUseCase = Provider(
  (ref) => GetPetsTypesUseCase(
    token: ref.read(tokenHandlerNotifierProvider).value,
  ),
);
