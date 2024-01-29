import 'package:flutter/material.dart';
import 'package:pet_finder/core/design/tokens/tokens.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({required this.child, super.key});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Shimmer.fromColors(
      baseColor:
          isDarkMode ? Theme.of(context).colorScheme.background : Palette.white,
      highlightColor: isDarkMode
          ? Theme.of(context).colorScheme.background.withOpacity(.1)
          : Palette.neutral200,
      child: child,
    );
  }
}
