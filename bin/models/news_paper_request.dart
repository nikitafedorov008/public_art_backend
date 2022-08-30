

import 'safe_convert.dart';

class NewsPaperRequest {
  late final Title title;
  late final Subtitle subtitle;
  late final Description description;
  late final ImportantInfo importantInfo;
  late final List<int> tags;
  // false
  late final bool event;
  // true
  late final bool pinned;
  late final List<String> images;
  final List<String>? videos;
  late final EternalLink eternalLink;
  final List<LinksItem>? links;
  // 2022-06-16 01:04:49.959
  final String? dateOfEvent;
  final EventDuration? eventDuration;
  final Address? address;
  final Coordinates? coordinates;
  // 2
  final int? city;

  NewsPaperRequest({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.importantInfo,
    required this.tags,
    required this.event,
    required this.pinned,
    required this.images,
    this.videos,
    required this.eternalLink,
    this.links,
    this.dateOfEvent = "",
    this.eventDuration,
    this.address,
    this.coordinates,
    this.city = 0,
  });

  factory NewsPaperRequest.fromJson(Map<String, dynamic>? json) => NewsPaperRequest(
    title: Title.fromJson(asT<Map<String, dynamic>>(json, 'title')),
    subtitle: Subtitle.fromJson(asT<Map<String, dynamic>>(json, 'subtitle')),
    description: Description.fromJson(asT<Map<String, dynamic>>(json, 'description')),
    importantInfo: ImportantInfo.fromJson(asT<Map<String, dynamic>>(json, 'important_info')),
    tags: asT<List>(json, 'tags').map((e) => int.tryParse(e.toString()) ?? 0).toList(),
    event: asT<bool>(json, 'event'),
    pinned: asT<bool>(json, 'pinned'),
    images: asT<List>(json, 'images').map((e) => e.toString()).toList(),
    videos: asT<List>(json, 'videos').map((e) => e.toString()).toList(),
    eternalLink: EternalLink.fromJson(asT<Map<String, dynamic>>(json, 'eternal_link')),
    links: asT<List>(json, 'links').map((e) => LinksItem.fromJson(e)).toList(),
    dateOfEvent: asT<String>(json, 'date_of_event'),
    eventDuration: EventDuration.fromJson(asT<Map<String, dynamic>>(json, 'event_duration')),
    address: Address.fromJson(asT<Map<String, dynamic>>(json, 'address')),
    coordinates: Coordinates.fromJson(asT<Map<String, dynamic>>(json, 'coordinates')),
    city: asT<int>(json, 'city'),
  );

  Map<String, dynamic> toJson() => {
    'title': title.toJson(),
    'subtitle': subtitle.toJson(),
    'description': description.toJson(),
    'important_info': importantInfo.toJson(),
    'tags': tags.map((e) => e),
    'event': event,
    'pinned': pinned,
    'images': images.map((e) => e),
    'videos': videos?.map((e) => e),
    'eternal_link': eternalLink.toJson(),
    'links': links?.map((e) => e.toJson()),
    'date_of_event': dateOfEvent,
    'event_duration': eventDuration?.toJson(),
    'address': address?.toJson(),
    'coordinates': coordinates?.toJson(),
    'city': city,
  };
}

class Title {
  // Открытие какой-то дичи
  final String ru;
  // Opening of some dish
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


class Subtitle {
  // Подробнее о какой-то дичи
  final String ru;
  // More about some dish
  final String en;

  Subtitle({
    this.ru = "",
    this.en = "",
  });

  factory Subtitle.fromJson(Map<String, dynamic>? json) => Subtitle(
    ru: asT<String>(json, 'ru'),
    en: asT<String>(json, 'en'),
  );

  Map<String, dynamic> toJson() => {
    'ru': ru,
    'en': en,
  };
}


class Description {
  // Какое-то описание
  final String ru;
  // Some description
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


class ImportantInfo {
  // Открытие бла бла бла
  final String ru;
  // Openning bla bla bla
  final String en;

  ImportantInfo({
    this.ru = "",
    this.en = "",
  });

  factory ImportantInfo.fromJson(Map<String, dynamic>? json) => ImportantInfo(
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

class EventDuration {
  // 2022-06-16 01:04:49.959
  final String start;
  // 2022-06-16 01:04:49.959
  final String end;

  EventDuration({
    this.start = "",
    this.end = "",
  });

  factory EventDuration.fromJson(Map<String, dynamic>? json) => EventDuration(
    start: asT<String>(json, 'start'),
    end: asT<String>(json, 'end'),
  );

  Map<String, dynamic> toJson() => {
    'start': start,
    'end': end,
  };
}


class Address {
  // Домоносово 7
  final String ru;
  // Lomonosovo 7
  final String en;

  Address({
    this.ru = "",
    this.en = "",
  });

  factory Address.fromJson(Map<String, dynamic>? json) => Address(
    ru: asT<String>(json, 'ru'),
    en: asT<String>(json, 'en'),
  );

  Map<String, dynamic> toJson() => {
    'ru': ru,
    'en': en,
  };
}


class Coordinates {
  // 233.23233
  final double lat;
  // 41.3434
  final double lng;

  Coordinates({
    this.lat = 0.0,
    this.lng = 0.0,
  });

  factory Coordinates.fromJson(Map<String, dynamic>? json) => Coordinates(
    lat: asT<double>(json, 'lat'),
    lng: asT<double>(json, 'lng'),
  );

  Map<String, dynamic> toJson() => {
    'lat': lat,
    'lng': lng,
  };
}

