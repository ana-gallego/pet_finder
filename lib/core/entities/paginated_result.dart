import 'package:pet_finder/core/entities/pet.dart';

class PaginatedResult {
  PaginatedResult({this.animals, this.pagination});

  factory PaginatedResult.fromJson(Map<String, dynamic> json) {
    final animals = json['animals'] as List<dynamic> ?? [];
    return PaginatedResult(
      animals: List<Pet>.from(
        animals.map((e) => Pet.fromJson(e as Map<String, dynamic>)),
      ),
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination']),
    );
  }
  List<Pet>? animals;
  Pagination? pagination;
}

class Pagination {
  Pagination({
    this.countPerPage,
    this.totalCount,
    this.currentPage,
    this.totalPages,
    this.links,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        countPerPage: json['count_per_page'],
        totalCount: json['total_count'],
        currentPage: json['current_page'],
        totalPages: json['total_pages'],
        links: json['_links'] == null
            ? null
            : PaginationLinks.fromJson(json['_links']),
      );
  int? countPerPage;
  int? totalCount;
  int? currentPage;
  int? totalPages;
  PaginationLinks? links;
}

class PaginationLinks {
  PaginationLinks({
    this.next,
  });

  factory PaginationLinks.fromJson(Map<String, dynamic> json) =>
      PaginationLinks(
        next: json['next'] == null ? null : Next.fromJson(json['next']),
      );
  Next? next;
}
