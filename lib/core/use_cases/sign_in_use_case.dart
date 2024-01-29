import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:pet_finder/core/extensions/string_extension.dart';
import 'package:pet_finder/core/network/response_extension.dart';
import 'package:pet_finder/core/utils/app_logger.dart';
import 'package:pet_finder/core/utils/constants.dart';

class SignInUseCase {
  Future<String> call() async {
    try {
      final response = await Client().post(
        '$kURL/oauth2/token'.toUri(),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: json.encode({
          'grant_type': 'client_credentials',
          'client_id': kClientId,
          'client_secret': kClientSecret,
        }),
      );

      final res = response.toApiResponse<String>();
      logger.d(res.data);
      if (res.success) {
        final body = json.decode(res.data!) as Map<String, dynamic>;
        return body['access_token'];
      }
      throw Exception(res.message);
    } on Exception {
      rethrow;
    } catch (e) {
      logger.d('There was an error while signing in');
      throw Exception(e);
    }
  }
}

final signInUseCase = Provider((ref) => SignInUseCase());
