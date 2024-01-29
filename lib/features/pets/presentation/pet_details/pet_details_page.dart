// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:pet_finder/core/design/atoms/buttons/icon_button.dart';
import 'package:pet_finder/core/design/atoms/custom_icon.dart';
import 'package:pet_finder/core/design/atoms/custom_text.dart';
import 'package:pet_finder/core/design/tokens/tokens.dart';
import 'package:pet_finder/core/entities/pet.dart' hide Colors;
import 'package:pet_finder/core/extensions/context_extension.dart';
import 'package:pet_finder/core/extensions/extensions.dart';
import 'package:pet_finder/core/network/response_extension.dart';
import 'package:pet_finder/core/utils/constants.dart';
import 'package:pet_finder/features/miscellaneous/token_handler.dart';
import 'package:pet_finder/features/pets/presentation/pets_list/pets_list_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PetDetailsPage extends ConsumerStatefulWidget {
  final Pet pet;
  final String type;
  final int index;
  PetDetailsPage({
    required this.pet,
    required this.type,
    required this.index,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PetDetailsPageState();
}

class _PetDetailsPageState extends ConsumerState<PetDetailsPage> {
  Pet? pet;
  bool favorite = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final prefs = await SharedPreferences.getInstance();
      final ids = prefs.getStringList('favoritePets') ?? [];
      favorite = ids.contains(widget.pet.id.toString());

      await useCase();
    });
  }

// TODO: Poner en el lugar correcto
  Future<String> useCase() async {
    try {
      final token = ref.read(tokenHandlerNotifierProvider).value;
      final response = await Client().get(
        '$kURL/animals/${widget.pet.id}'.toUri(),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token',
        },
      );

      final res = response.toApiResponse<String>();
      if (res.success) {
        final body = json.decode(res.data!) as Map<String, dynamic>;
        pet = Pet.fromJson(body['animal']);
        setState(() {});
        return 'Success';
      }
      throw Exception(res.message);
    } on Exception {
      rethrow;
    } catch (e) {
      throw Exception(e);
    }
  }
// TODO: Poner en el lugar correcto
  Future<void> switchFavorite() async {
    final prefs = await SharedPreferences.getInstance();
    final ids = prefs.getStringList('favoritePets') ?? [];
    if (ids.contains(widget.pet.id.toString())) {
      ids.remove(widget.pet.id.toString());
    } else {
      ids.add(widget.pet.id.toString());
    }
    await prefs.setStringList('favoritePets', ids);
    setState(() {
      favorite = !favorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    final image = widget.pet.primaryPhotoCropped?.small ?? '';

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: context.all(24),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CustomIconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        onPressed: () => Navigator.of(context).pop(),
                        padding: EdgeInsets.zero,
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            AppText(
                              widget.pet.name,
                              style: AppTextStyle.mobileHeading3,
                            ),
                            const SizedBox(height: 4),
                            AppText(widget.pet.breeds?.primary ?? ''),
                          ],
                        ),
                      ),
                      CustomIconButton(
                        icon: favorite
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_border),
                        onPressed: switchFavorite,
                        padding: EdgeInsets.zero,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Stack(
                    children: [
                      Align(
                        child: Container(
                          height: context.height * 0.3,
                          width: context.height * 0.3,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.secondary,
                            image: image.isNotEmpty
                                ? DecorationImage(
                                    image: NetworkImage(image),
                                    fit: BoxFit.cover,
                                  )
                                : null,
                          ),
                          child: image.isEmpty
                              ? Center(
                                  child: CustomIcon(
                                    pawByType(widget.type),
                                    width: 200,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary
                                        .withOpacity(.6),
                                  ),
                                )
                              : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(.4),
                          ),
                          padding: context.all(32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                AppLocalizations.of(context)!.age,
                                style: AppTextStyle.mediumBody2,
                              ),
                              AppText(
                                widget.pet.age
                                    .toString()
                                    .split('.')
                                    .last
                                    .capitalize(),
                                style: AppTextStyle.mobileHeading3,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(.4),
                          ),
                          padding: context.all(32),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                AppLocalizations.of(context)!.size,
                                style: AppTextStyle.mediumBody2,
                              ),
                              AppText(
                                (widget.pet.size ?? '')
                                    .split('.')
                                    .last
                                    .capitalize(),
                                style: AppTextStyle.mobileHeading3,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(.4),
                    ),
                    width: context.width,
                    padding: context.all(32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          AppLocalizations.of(context)!.about,
                          style: AppTextStyle.mediumBody2,
                        ),
                        AppText(
                          widget.pet.description ?? '...',
                          style: AppTextStyle.mobileHeading3,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      CustomIconButton(
                        icon: const Icon(Icons.phone),
                        onPressed: () {
                          launchUrlString(
                            pet?.contact?.phone ?? '',
                          );
                        },
                        padding: EdgeInsets.zero,
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.secondary,
                        customSize: 60,
                      ),
                      const SizedBox(width: 24),
                      CustomIconButton(
                        icon: const Icon(Icons.message),
                        onPressed: () => Navigator.of(context).pop(),
                        padding: EdgeInsets.zero,
                        shape: BoxShape.circle,
                        color: Theme.of(context).colorScheme.secondary,
                        customSize: 60,
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            launchUrlString(
                              pet?.url ??
                                  pet?.links?.self?.href ??
                                  pet?.links?.organization?.href ??
                                  '',
                            );
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(50)),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            child: Center(
                              child: AppText(
                                AppLocalizations.of(context)!.adopt,
                                style: AppTextStyle.boldBody1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
