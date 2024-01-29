import 'dart:math' as math;

import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pet_finder/core/design/atoms/custom_icon.dart';
import 'package:pet_finder/core/design/atoms/custom_shimmer.dart';
import 'package:pet_finder/core/design/atoms/custom_text.dart';
import 'package:pet_finder/core/design/tokens/tokens.dart';
import 'package:pet_finder/core/entities/pet.dart';
import 'package:pet_finder/core/extensions/context_extension.dart';
import 'package:pet_finder/features/pets/presentation/pet_details/pet_details_page.dart';
import 'package:pet_finder/features/pets/presentation/pets_list/pets_list_controller.dart';
import 'package:pet_finder/features/pets/presentation/pets_list/pets_list_state.dart';
import 'package:pet_finder/gen/assets.gen.dart';

class PetsListPage extends ConsumerStatefulWidget {
  const PetsListPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PetsListPageState();
}

class _PetsListPageState extends ConsumerState<PetsListPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await ref.read(petsListControllerProvider.notifier).init();
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(petsListControllerProvider.notifier);
    final state = ref.watch(petsListControllerProvider);

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: context.left(24),
            child: AppText(
              AppLocalizations.of(context)!.discover,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          Padding(
            padding: context.left(24),
            child: AppText(
              AppLocalizations.of(context)!.find_your_netx_friend,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
          const SizedBox(height: 16),
          PetTypesList(state: state, controller: controller),
          const SizedBox(height: 32),
          Expanded(
            child: SizedBox(
              height: 350,
              child: ((state.pets ?? []).isEmpty && state.isLoading)
                  ? AppinioSwiper(
                      cardCount: 5,
                      backgroundCardScale: 1,
                      backgroundCardOffset: const Offset(30, 0),
                      isDisabled: true,
                      cardBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: context.left(48),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Transform.rotate(
                              angle: index.isEven
                                  ? -math.pi / 30.0
                                  : math.pi / 30.0,
                              child: AppShimmer(
                                child: Container(
                                  width: context.width * .7,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.secondary,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : ((state.pets ?? []).isEmpty && !state.isLoading)
                      ?  Center(
                          child: AppText(
                            AppLocalizations.of(context)!.no_pets,
                            style: AppTextStyle.boldBody1,
                          ),
                        )
                      : SizedBox(
                        child: AppinioSwiper(
                            cardCount: state.pets?.length ?? 0,
                            backgroundCardScale: 1,
                            backgroundCardOffset: const Offset(30, 0),
                            onSwipeEnd: (previousIndex, targetIndex, activity) {
                              if (targetIndex == state.pets!.length - 3) {
                                controller.getPets();
                              }
                            },
                            cardBuilder: (BuildContext context, int index) {
                              final pet = state.pets![index];
                              return PetListItem(
                                pet: pet,
                                index: index,
                                type: state.selectedType ?? '',
                              );
                            },
                          ),
                      ),
            ),
          ),
          const SizedBox(height: 120),
        ],
      ),
    );
  }
}

class PetListItem extends StatelessWidget {
  const PetListItem({
    required this.pet,
    required this.index,
    required this.type,
    super.key,
  });

  final Pet pet;
  final int index;
  final String type;

  @override
  Widget build(BuildContext context) {
    final image = pet.primaryPhotoCropped?.small ?? '';
    return Padding(
      padding: context.left(48),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Transform.rotate(
          angle: index.isEven ? -math.pi / 30.0 : math.pi / 30.0,
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              PageTransition<dynamic>(
                type: PageTransitionType.fade,
                child: PetDetailsPage(
                  pet: pet,
                  index: index,
                  type: type,
                ),
              ),
            ),
            child: Container(
              width: context.width * .7,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(16),
                image: image.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(image),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: Stack(
                children: [
                  if (image.isEmpty)
                    Center(
                      child: CustomIcon(
                        pawByType(type),
                        width: 200,
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary
                            .withOpacity(.6),
                      ),
                    ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .tertiary
                            .withOpacity(.2),
                        borderRadius: AppBorderRadius.bottom(radius: 16),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: AppText(
                                pet.name ?? '',
                                style: AppTextStyle.boldBody1,
                                color: Palette.white,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PetTypesList extends StatelessWidget {
  const PetTypesList({
    required this.state,
    required this.controller,
    super.key,
  });

  final PetsListState state;
  final PetsListController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: (state.isLoading && state.types == null)
          ? ListView.separated(
              padding: context.left(24),
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return AppShimmer(
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 100),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: context.horizontal(16),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 16);
              },
            )
          : ListView.separated(
              padding: context.left(24),
              scrollDirection: Axis.horizontal,
              itemCount: state.types?.length ?? 0,
              itemBuilder: (context, index) {
                final type = state.types?[index] ?? '';
                final isSelected = type == state.selectedType;
                return GestureDetector(
                  onTap: () => controller.onTypeSelected(type),
                  child: Container(
                    constraints: const BoxConstraints(minWidth: 100),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? Theme.of(context).colorScheme.tertiary
                          : Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding: context.horizontal(16),
                    child: Center(
                      child: AppText(
                        type,
                        style: Theme.of(context).textTheme.titleMedium,
                        color: isSelected
                            ? Theme.of(context).colorScheme.secondary
                            : Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 16);
              },
            ),
    );
  }
}

String pawByType(String type) {
  switch (type.toLowerCase()) {
    case 'cat':
      return Assets.icons.paws.cat;
    case 'horse':
      return Assets.icons.paws.horse;
    case 'bird':
      return Assets.icons.paws.bird;
    case 'barnyard':
      return Assets.icons.paws.pig;

    default:
      return Assets.icons.paws.dog;
  }
}
