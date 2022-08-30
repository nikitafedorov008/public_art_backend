

import 'safe_convert.dart';

class RouteRequest {
  late final Name name;
  late final Description description;
  late final Author author;
  late final EternalLink eternalLink;
  final List<LinksItem>? links;
  late final Duration duration;
  // 23
  late final int length;
  // 2
  late final int city;
  // true
  late final bool paid;
  // 2022-06-16 01:04:49.959
  late final String lastUpdateDate;
  final List<int>? categories;
  final List<String>? images;

  RouteRequest({
    required this.name,
    required this.description,
    required this.author,
    required this.eternalLink,
    required this.links,
    required this.duration,
    this.length = 0,
    this.city = 0,
    this.paid = false,
    this.lastUpdateDate = "",
    this.categories,
    this.images,
  });

  factory RouteRequest.fromJson(Map<String, dynamic>? json) => RouteRequest(
    name: Name.fromJson(asT<Map<String, dynamic>>(json, 'name')),
    description: Description.fromJson(asT<Map<String, dynamic>>(json, 'description')),
    author: Author.fromJson(asT<Map<String, dynamic>>(json, 'author')),
    eternalLink: EternalLink.fromJson(asT<Map<String, dynamic>>(json, 'eternal_link')),
    links: asT<List>(json, 'links').map((e) => LinksItem.fromJson(e)).toList(),
    duration: Duration.fromJson(asT<Map<String, dynamic>>(json, 'duration')),
    length: asT<int>(json, 'length'),
    city: asT<int>(json, 'city'),
    paid: asT<bool>(json, 'paid'),
    lastUpdateDate: asT<String>(json, 'last_update_date'),
    categories: asT<List>(json, 'categories').map((e) => int.tryParse(e.toString()) ?? 0).toList(),
    images: asT<List>(json, 'images').map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    'name': name.toJson(),
    'description': description.toJson(),
    'author': author.toJson(),
    'eternal_link': eternalLink.toJson(),
    'links': links?.map((e) => e.toJson()),
    'duration': duration.toJson(),
    'length': length,
    'city': city,
    'paid': paid,
    'last_update_date': lastUpdateDate,
    'categories': categories?.map((e) => e),
    'images': images?.map((e) => e),
  };
}

class Name {
  // путь до дома
  final String ru;
  // route to home
  final String en;

  Name({
    this.ru = "",
    this.en = "",
  });

  factory Name.fromJson(Map<String, dynamic>? json) => Name(
    ru: asT<String>(json, 'ru'),
    en: asT<String>(json, 'en'),
  );

  Map<String, dynamic> toJson() => {
    'ru': ru,
    'en': en,
  };
}


class Description {
  // какое-то описание
  final String ru;
  // some sort of description
  final String en;

  Description({
    this.ru = "",
    this.en = "",
  });

  factory Description.fromJson(Map<String, dynamic>? json) => Description(
    ru: asT<String>(json, 'ru'),
    en: asT<String>(json, 'en'),
  );

  Map<String, dynamic> toJson() => {
    'ru': ru,
    'en': en,
  };
}


class Author {
  // какой-то мудазвон
  final String ru;
  // some sort of motherfucker
  final String en;

  Author({
    this.ru = "",
    this.en = "",
  });

  factory Author.fromJson(Map<String, dynamic>? json) => Author(
    ru: asT<String>(json, 'ru'),
    en: asT<String>(json, 'en'),
  );

  Map<String, dynamic> toJson() => {
    'ru': ru,
    'en': en,
  };
}


class EternalLink {
  // https:/jsonplaceholder/post/1
  final String url;
  final Title title;

  EternalLink({
    this.url = "",
    required this.title,
  });

  factory EternalLink.fromJson(Map<String, dynamic>? json) => EternalLink(
    url: asT<String>(json, 'url'),
    title: Title.fromJson(asT<Map<String, dynamic>>(json, 'title')),
  );

  Map<String, dynamic> toJson() => {
    'url': url,
    'title': title.toJson(),
  };
}

class LinksItem {
  // https:/jsonplaceholder/users
  final String url;
  final Title title;

  LinksItem({
    this.url = "",
    required this.title,
  });

  factory LinksItem.fromJson(Map<String, dynamic>? json) => LinksItem(
    url: asT<String>(json, 'url'),
    title: Title.fromJson(asT<Map<String, dynamic>>(json, 'title')),
  );

  Map<String, dynamic> toJson() => {
    'url': url,
    'title': title.toJson(),
  };
}

class Title {
  // юзеры на жсон
  final String ru;
  // users on json
  final String en;

  Title({
    this.ru = "",
    this.en = "",
  });

  factory Title.fromJson(Map<String, dynamic>? json) => Title(
    ru: asT<String>(json, 'ru'),
    en: asT<String>(json, 'en'),
  );

  Map<String, dynamic> toJson() => {
    'ru': ru,
    'en': en,
  };
}


class Duration {
  // 23
  final int walk;
  // 3
  final int auto;

  Duration({
    this.walk = 0,
    this.auto = 0,
  });

  factory Duration.fromJson(Map<String, dynamic>? json) => Duration(
    walk: asT<int>(json, 'walk'),
    auto: asT<int>(json, 'auto'),
  );

  Map<String, dynamic> toJson() => {
    'walk': walk,
    'auto': auto,
  };
}

