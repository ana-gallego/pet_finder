// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:pet_finder/core/use_cases/sign_in_use_case.dart';
import 'package:pet_finder/core/utils/app_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_handler.g.dart';
@Riverpod(keepAlive: true)
class TokenHandlerNotifier extends _$TokenHandlerNotifier {
  Timer? timer;
  @override
  AccessToken build() {
    return AccessToken('');
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(minutes: 1), (_) async {
      try {
        final token = await ref.read(signInUseCase).call();
        logger.d('token updated');
        state = state.copyWith(value: token);
      } catch (e) {
        logger.e('Error updating token: ',error: e);
      }
    });
  }

  void setToken(String token) {
    state = state.copyWith(value: token);
  }
}

class AccessToken {
  AccessToken(this.value);
  final String value;

  AccessToken copyWith({
    String? value,
  }) {
    return AccessToken(
      value ?? this.value,
    );
  }
}
