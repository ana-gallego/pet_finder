// To parse this JSON data, do
//
//     final pet = petFromJson(jsonString);

class Pet {
  Pet({
    this.id,
    this.organizationId,
    this.url,
    this.type,
    this.species,
    this.breeds,
    this.colors,
    this.age,
    this.gender,
    this.size,
    this.coat,
    this.attributes,
    this.environment,
    this.tags,
    this.name,
    this.description,
    this.organizationAnimalId,
    this.photos,
    this.primaryPhotoCropped,
    this.videos,
    this.status,
    this.statusChangedAt,
    this.publishedAt,
    this.distance,
    this.contact,
    this.links,
  });

  factory Pet.fromJson(Map<String, dynamic> json) {
    final tags = json['tags'] as List<dynamic> ?? [];

    return Pet(
      id: json['id'],
      organizationId: json['organization_id'],
      url: json['url'],
      type: json['type'],
      species: json['species'],
      breeds: json['breeds'] == null ? null : Breeds.fromJson(json['breeds']),
      colors: json['colors'] == null ? null : Colors.fromJson(json['colors']),
      age: json['age'],
      gender: json['gender'],
      size: json['size'],
      coat: json['coat'],
      attributes: json['attributes'] == null
          ? null
          : Attributes.fromJson(json['attributes']),
      environment: json['environment'] == null
          ? null
          : Environment.fromJson(json['environment']),
      tags: List<String>.from(tags.map((x) => x)),
      name: json['name'],
      description: json['description'],
      organizationAnimalId: json['organization_animal_id'],
      primaryPhotoCropped: json['primary_photo_cropped'] == null
          ? null
          : PrimaryPhotoCropped.fromJson(json['primary_photo_cropped']),
      status: json['status'],
      statusChangedAt: json['status_changed_at'],
      publishedAt: json['published_at'],
      distance: json['distance'],
      contact:
          json['contact'] == null ? null : Contact.fromJson(json['contact']),
      links:
          json['_links'] == null ? null : AnimalLinks.fromJson(json['_links']),
    );
  }
  int? id;
  String? organizationId;
  String? url;
  String? type;
  String? species;
  Breeds? breeds;
  Colors? colors;
  String? age;
  String? gender;
  String? size;
  String? coat;
  Attributes? attributes;
  Environment? environment;
  List<String>? tags;
  String? name;
  String? description;
  String? organizationAnimalId;
  List<PrimaryPhotoCropped>? photos;
  PrimaryPhotoCropped? primaryPhotoCropped;
  List<Video>? videos;
  String? status;
  String? statusChangedAt;
  String? publishedAt;
  dynamic distance;
  Contact? contact;
  AnimalLinks? links;
}

class Attributes {
  Attributes({
    this.spayedNeutered,
    this.houseTrained,
    this.declawed,
    this.specialNeeds,
    this.shotsCurrent,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        spayedNeutered: json['spayed_neutered'],
        houseTrained: json['house_trained'],
        declawed: json['declawed'],
        specialNeeds: json['special_needs'],
        shotsCurrent: json['shots_current'],
      );
  bool? spayedNeutered;
  bool? houseTrained;
  bool? declawed;
  bool? specialNeeds;
  bool? shotsCurrent;
}

class Breeds {
  Breeds({
    this.primary,
    this.secondary,
    this.mixed,
    this.unknown,
  });

  factory Breeds.fromJson(Map<String, dynamic> json) => Breeds(
        primary: json['primary'],
        secondary: json['secondary'],
        mixed: json['mixed'],
        unknown: json['unknown'],
      );
  String? primary;
  String? secondary;
  bool? mixed;
  bool? unknown;
}

class Colors {
  Colors({
    this.primary,
    this.secondary,
    this.tertiary,
  });

  factory Colors.fromJson(Map<String, dynamic> json) => Colors(
        primary: json['primary'],
        secondary: json['secondary'],
        tertiary: json['tertiary'],
      );
  String? primary;
  String? secondary;
  String? tertiary;
}

class Contact {
  Contact({
    this.email,
    this.phone,
    this.address,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        email: json['email'],
        phone: json['phone'],
        address:
            json['address'] == null ? null : Address.fromJson(json['address']),
      );
  String? email;
  String? phone;
  Address? address;
}

class Address {
  Address({
    this.address1,
    this.address2,
    this.city,
    this.state,
    this.postcode,
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        address1: json['address1'],
        address2: json['address2'],
        city: json['city'],
        state: json['state'],
        postcode: json['postcode'],
        country: json['country'],
      );
  String? address1;
  dynamic address2;
  String? city;
  String? state;
  String? postcode;
  String? country;
}

class Environment {
  Environment({
    this.children,
    this.dogs,
    this.cats,
  });

  factory Environment.fromJson(Map<String, dynamic> json) => Environment(
        children: json['children'],
        dogs: json['dogs'],
        cats: json['cats'],
      );
  bool? children;
  bool? dogs;
  bool? cats;
}

class AnimalLinks {
  AnimalLinks({
    this.self,
    this.type,
    this.organization,
  });

  factory AnimalLinks.fromJson(Map<String, dynamic> json) => AnimalLinks(
        self: json['self'] == null ? null : Next.fromJson(json['self']),
        type: json['type'] == null ? null : Next.fromJson(json['type']),
        organization: json['organization'] == null
            ? null
            : Next.fromJson(json['organization']),
      );
  Next? self;
  Next? type;
  Next? organization;
}

class Next {
  Next({
    this.href,
  });

  factory Next.fromJson(Map<String, dynamic> json) => Next(
        href: json['href'],
      );
  String? href;
}

class PrimaryPhotoCropped {
  PrimaryPhotoCropped({
    this.small,
    this.medium,
    this.large,
    this.full,
  });

  factory PrimaryPhotoCropped.fromJson(Map<String, dynamic> json) =>
      PrimaryPhotoCropped(
        small: json['small'],
        medium: json['medium'],
        large: json['large'],
        full: json['full'],
      );
  String? small;
  String? medium;
  String? large;
  String? full;
}

class Video {
  Video({
    this.embed,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        embed: json['embed'],
      );
  String? embed;
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
