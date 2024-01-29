import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:oktoast/oktoast.dart';
import 'package:pet_finder/core/design/pages/splash_page.dart';
import 'package:pet_finder/core/design/tokens/theme.dart';
import 'package:pet_finder/core/extensions/scroll_behavior_extension.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app.g.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.read(themeProviderProvider.notifier).init();
      ref.read(langProviderProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: ScrollBehaviorExtension(),
          title: 'Pet Finder',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ref.watch(themeProviderProvider),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: ref.watch(langProviderProvider),
          home: const SplashPage(),
          builder: (_, child) => Material(child: OKToast(child: child!)),
        );
      },
    );
  }
}

@riverpod
class ThemeProvider extends _$ThemeProvider {
  @override
  ThemeMode build() => ThemeMode.dark;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final theme = prefs.getString('theme');
    if (theme != null) {
      state = theme == 'dark' ? ThemeMode.dark : ThemeMode.light;
    }
  }

  Future<void> toggle() async {
    state = state == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', state.toString());
  }
}

@riverpod
class LangProvider extends _$LangProvider {
  @override
  Locale build() => const Locale('en');

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    final lang = prefs.getString('lang');
    if (lang != null) {
      state = Locale(lang);
    }
  }

  Future<void> toggle() async {
    state =
        state == const Locale('en') ? const Locale('es') : const Locale('en');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', state.languageCode);
  }
}
