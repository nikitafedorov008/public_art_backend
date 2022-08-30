//model for request to add author
class AuthorRequest {
  late Name name;
  late Name description;
  late RequestLink link;
  List<String>? arts;
  List<int>? tags;
  String? image;
  String? format;

  AuthorRequest({
    required this.name,
    required this.description,
    required this.link,
    this.arts,
    this.tags,
    this.image,
    this.format,
  });

  AuthorRequest.fromJson(Map<String, dynamic> json) {
    name = (json['name'] != null ? Name.fromJson(json['name']) : null)!;
    description = (json['description'] != null
        ? Name.fromJson(json['description'])
        : null)!;
    link = (json['link'] != null ? RequestLink.fromJson(json['link']) : null)!;
    arts = json['arts'] != null ? json['arts'].cast<String>() : [];
    tags = json['tags'] != null ? json['tags'].cast<int>() : [];
    image = json['image'];
    format = json['format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name.toJson();
    data['description'] = description.toJson();
    data['link'] = link.toJson();
    data['arts'] = arts;
    data['tags'] = tags;
    data['image'] = image;
    data['format'] = format;
    return data;
  }
}

class Name {
  late String ru;
  late String en;

  Name({required this.ru, required this.en});

  Name.fromJson(Map<String, dynamic> json) {
    ru = json['ru'];
    en = json['en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ru'] = ru;
    data['en'] = en;
    return data;
  }
}

class RequestLink {
  late String url;
  late Name title;

  RequestLink({required this.url, required this.title});

  RequestLink.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = (json['title'] != null ? Name.fromJson(json['title']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['title'] = title.toJson();
    return data;
  }
}