import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pet_finder/core/design/atoms/custom_text.dart';
import 'package:pet_finder/core/design/tokens/styles.dart';
import 'package:pet_finder/core/extensions/context_extension.dart';
import 'package:pet_finder/features/miscellaneous/app.dart';
import 'package:pet_finder/gen/assets.gen.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final themeC = ref.watch(themeProviderProvider.notifier);
        final langC = ref.watch(langProviderProvider.notifier);
        final bool isEng =
            ref.watch(langProviderProvider) == const Locale('en');
        final bool isDark = ref.watch(themeProviderProvider) == ThemeMode.dark;
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  shape: BoxShape.circle,
                ),
                width: 300,
                height: 300,
                child: Image.asset(
                  Assets.icons.profile.path,
                  width: 50,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: context.left(24),
                child: AppText(
                  'Jhon Doe',
                  style: Theme.of(context).textTheme.displayMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: context.left(24),
                child: const AppText(
                  'Language',
                  style: AppTextStyle.mediumBody3,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: langC.toggle,
                    child: Container(
                      width: 100,
                      height: 60,
                      decoration: BoxDecoration(
                        color: !isEng
                            ? Theme.of(context).colorScheme.secondary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: AppText(
                          'ES',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: langC.toggle,
                    child: Container(
                      width: 100,
                      height: 60,
                      decoration: BoxDecoration(
                        color: isEng
                            ? Theme.of(context).colorScheme.secondary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: AppText(
                          'EN',
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Padding(
                padding: context.left(24),
                child: const AppText(
                  'Theme',
                  style: AppTextStyle.mediumBody3,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: themeC.toggle,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: isDark
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: context.horizontal(16),
                      child: Center(
                        child: AppText(
                          AppLocalizations.of(context)!.dark.toUpperCase(),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  GestureDetector(
                    onTap: themeC.toggle,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        color: !isDark
                            ? Theme.of(context).colorScheme.secondary
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                                            padding: context.horizontal(16),

                      child: Center(
                        child: AppText(
                          AppLocalizations.of(context)!.light.toUpperCase(),
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
