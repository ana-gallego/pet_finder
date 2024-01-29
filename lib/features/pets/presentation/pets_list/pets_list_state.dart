// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pet_finder/core/entities/pet.dart';

class PetsListState {
  final List<String>? types;
  final List<Pet>? pets;
  final bool isLoading;
  final String? selectedType;
  final int page;

  PetsListState({
    this.types,
    this.pets,
    this.isLoading = true,
    this.selectedType,
    this.page = 1,
  });

  PetsListState copyWith({
    List<String>? types,
    List<Pet>? pets,
    bool? isLoading,
    String? selectedType,
    int? page,
  }) {
    return PetsListState(
      types: types ?? this.types,
      pets: pets ?? this.pets,
      isLoading: isLoading ?? this.isLoading,
      selectedType: selectedType ?? this.selectedType,
      page: page ?? this.page,
    );
  }
}
