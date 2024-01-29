import 'package:pet_finder/core/entities/pet.dart';
import 'package:pet_finder/core/utils/app_logger.dart';
import 'package:pet_finder/features/pets/domain/use_cases/get_pets.dart';
import 'package:pet_finder/features/pets/domain/use_cases/get_pets_types.dart';
import 'package:pet_finder/features/pets/presentation/pets_list/pets_list_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'pets_list_controller.g.dart';

@riverpod
class PetsListController extends _$PetsListController {
  @override
  PetsListState build() => PetsListState();

  Future<void> init() async {
    try {
      final types = await ref.read(getPetsTypesUseCase).call();
      if (types.isEmpty) {
        logger.d('No types');
      } else {
        logger.d('Types: $types');
        state = state.copyWith(types: types, selectedType: types.first);
        await getPets();
      }
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }

  Future<void> getPets() async {
    try {
      state = state.copyWith(isLoading: true);
      final animals = await ref.read(getPetsUseCase).call(
            page: state.page,
            type: state.selectedType,
          );
      final List<Pet> list = [...state.pets ?? [], ...animals];
      logger.d(list.length);
      state = state.copyWith(
        pets: list,
        isLoading: false,
        page: state.page + 1,
      );
    } catch (e) {
      logger.d('There was an error getting the pets', error: e);
      state = state.copyWith(
        isLoading: false,
        page: 1,
        pets: [],
      );
    }
  }

  void onTypeSelected(String type) {
    state = state.copyWith(
      selectedType: type,
      page: 1,
      pets: [],
      isLoading: true,
    );
    getPets();
  }
}
