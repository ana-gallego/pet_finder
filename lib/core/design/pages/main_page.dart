import 'package:flutter/material.dart';
import 'package:pet_finder/core/extensions/context_extension.dart';
import 'package:pet_finder/features/pets/presentation/favorite_pets/favorite_pets_list.dart';
import 'package:pet_finder/features/pets/presentation/pets_list/pets_list_page.dart';
import 'package:pet_finder/features/profile/presentation/profile_details/profile_page.dart';
import 'package:pet_finder/gen/assets.gen.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(child: pageBuilder()),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: context.width,
              child: Container(
                height: 81,
                margin: context.all(24),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    padding: context.all(4),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () => setState(() => pageIndex = 0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: pageIndex == 0
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary,
                              shape: BoxShape.circle,
                            ),
                            width: 60,
                            height: 60,
                            child: Center(
                              child: pageIndex == 0
                                  ? Assets.icons.homeFill.image(width: 30)
                                  : Assets.icons.homeLine.image(width: 30),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () => setState(() => pageIndex = 1),
                          child: Container(
                            decoration: BoxDecoration(
                              color: pageIndex == 1
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary,
                              shape: BoxShape.circle,
                            ),
                            width: 60,
                            height: 60,
                            child: Center(
                              child: pageIndex == 1
                                  ? Assets.icons.favFill.image(width: 30)
                                  : Assets.icons.favLine.image(width: 30),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () => setState(() => pageIndex = 2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: pageIndex == 2
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.secondary,
                              shape: BoxShape.circle,
                            ),
                            width: 60,
                            height: 60,
                            child: Center(
                              child: pageIndex == 2
                                  ? Assets.icons.userFill.image(width: 30)
                                  : Assets.icons.userLine.image(width: 30),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget pageBuilder() {
    switch (pageIndex) {
      case 0:
        return const PetsListPage();
      case 1:
        return const FavoritePetsList();
      case 2:
        return const MyProfilePage();
      default:
        return Container();
    }
  }
}
