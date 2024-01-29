import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:pet_finder/core/design/atoms/buttons/icon_button.dart';
import 'package:pet_finder/core/design/atoms/custom_icon.dart';
import 'package:pet_finder/core/design/atoms/custom_text.dart';
import 'package:pet_finder/core/design/tokens/styles.dart';
import 'package:pet_finder/core/entities/pet.dart';
import 'package:pet_finder/core/extensions/context_extension.dart';
import 'package:pet_finder/core/extensions/extensions.dart';
import 'package:pet_finder/core/network/response_extension.dart';
import 'package:pet_finder/core/utils/app_logger.dart';
import 'package:pet_finder/core/utils/constants.dart';
import 'package:pet_finder/features/miscellaneous/token_handler.dart';
import 'package:pet_finder/features/pets/presentation/pet_details/pet_details_page.dart';
import 'package:pet_finder/features/pets/presentation/pets_list/pets_list_page.dart';
import 'package:pet_finder/gen/assets.gen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritePetsList extends ConsumerStatefulWidget {
  const FavoritePetsList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FavoritePetsListState();
}

class _FavoritePetsListState extends ConsumerState<FavoritePetsList> {
  final favorites = <Pet>[];
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, loadFavorites);
  }

// TODO: Poner en el lugar correcto
  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final ids = prefs.getStringList('favoritePets') ?? [];

    if (favorites.length == ids.length) return;
    favorites.clear();
    for (final id in ids) {
      final pet = await getPet(id: id);
      favorites.add(pet);
    }
    setState(() {});
  }

// TODO: Poner en el lugar correcto
  Future<Pet> getPet({required String id}) async {
    try {
      final endpoint = 'animals/$id';
      final response = await Client().get(
        '$kURL/$endpoint'.toUri(),
        headers: await _headers(),
      );

      final res = response.toApiResponse<String>();
      if (res.success) {
        final body = json.decode(res.data!) as Map<String, dynamic>;
        logger.d(body);
        return Pet.fromJson(body['animal']);
      }

      throw Exception('There was an error getting the pets');
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception(e);
    }
  }

// TODO: Poner en el lugar correcto
  Future<Map<String, String>> _headers() async {
    final token = ref.read(tokenHandlerNotifierProvider).value;
    return {
      HttpHeaders.contentTypeHeader: 'application/json',
      HttpHeaders.authorizationHeader: 'Bearer $token',
    };
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: context.left(24),
            child: AppText(
              AppLocalizations.of(context)!.your_favorite_pets,
              style: Theme.of(context).textTheme.displayMedium,
            ),
          ),
          const SizedBox(height: 16),
          (favorites.isEmpty)
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        width: 80,
                        height: 80,
                        child: Image.asset(
                          Assets.icons.favLine.path,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      const SizedBox(height: 16),
                      AppText(
                        AppLocalizations.of(context)!.no_favorites,
                        style: AppTextStyle.mobileHeading3,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    padding: context.fromLTRB(24, 0, 24, 100),
                    itemCount: favorites.length,
                    itemBuilder: (context, index) {
                      final pet = favorites[index];
                      final image = pet.primaryPhotoCropped?.full ?? '';

                      /// TODO: Esto debe ser un widget aparte
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(
                            MaterialPageRoute<dynamic>(
                              builder: (context) => PetDetailsPage(
                                pet: pet,
                                type: pet.species ?? '',
                                index: index,
                              ),
                            ),
                          )
                              .then((favorite) {
                            loadFavorites();
                          });
                        },
                        child: Container(
                          margin: context.bottom(16),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          padding: context.all(16),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                  width: 150,
                                  height: 150,
                                  child: image.isNotEmpty
                                      ? Image.network(
                                          image,
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        )
                                      : CustomIcon(
                                          pawByType(pet.species ?? ''),
                                          width: 200,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .tertiary
                                              .withOpacity(.6),
                                        ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      pet.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                    ),
                                    const SizedBox(height: 8),
                                    AppText(
                                      pet.description,
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              CustomIconButton(
                                icon: const Icon(Icons.favorite),
                                onPressed: () async {
                                  final prefs =
                                      await SharedPreferences.getInstance();
                                  final ids =
                                      prefs.getStringList('favoritePets') ?? [];
                                  // ignore: cascade_invocations
                                  ids.remove(pet.id.toString());
                                  favorites.removeAt(index);
                                  await prefs.setStringList(
                                    'favoritePets',
                                    ids,
                                  );
                                  setState(() {});
                                },
                                padding: EdgeInsets.zero,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
