
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_finder/core/design/atoms/loading.dart';
import 'package:pet_finder/core/design/pages/main_page.dart';
import 'package:pet_finder/core/use_cases/sign_in_use_case.dart';
import 'package:pet_finder/core/utils/app_logger.dart';
import 'package:pet_finder/core/utils/error_handler.dart';
import 'package:pet_finder/features/miscellaneous/token_handler.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  String error = '';
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      try {
        final token = await ref.read(signInUseCase).call();
        ref.read(tokenHandlerNotifierProvider.notifier).setToken(token);
        ref.read(tokenHandlerNotifierProvider.notifier).startTimer();
        goToPetsListPage();
      } catch (e) {
        logger.d('There was an error while signing in', error: e);
        ErrorHandler.handleError<String>('There was an error while signing in');
        setState(() {
          error = e.toString();
        });
      }
    });
  }

  void goToPetsListPage() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute<void>(
        builder: (context) => const MainPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Loading());
  }
}
