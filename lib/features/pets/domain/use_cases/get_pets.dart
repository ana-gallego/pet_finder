// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:pet_finder/core/entities/paginated_result.dart';
import 'package:pet_finder/core/entities/pet.dart';
import 'package:pet_finder/core/extensions/string_extension.dart';
import 'package:pet_finder/core/network/response_extension.dart';
import 'package:pet_finder/core/utils/constants.dart';
import 'package:pet_finder/features/miscellaneous/token_handler.dart';

class GetPetsUseCase {
  final String token;
  GetPetsUseCase({
    required this.token,
  });

  Future<List<Pet>> call({
    required int page,
    String? type,
  }) async {
    try {
      var endpoint = type != null ? 'animals?type=$type' : 'animals';
      endpoint += '&page=$page';
      final response = await Client().get(
        '$kURL/$endpoint'.toUri(),
        headers: await _headers(),
      );

      final res = response.toApiResponse<String>();
      if (res.success) {
        final body = json.decode(res.data!) as Map<String, dynamic>;
        final pag = PaginatedResult.fromJson(body);
        return pag.animals ?? [];
      }

      throw Exception('There was an error getting the pets');
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

final getPetsUseCase = Provider(
  (ref) => GetPetsUseCase(
    token: ref.read(tokenHandlerNotifierProvider).value,
  ),
);
