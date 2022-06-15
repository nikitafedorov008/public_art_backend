import 'dart:convert';
/// name : {"ru":"Николас","en":"Nikolas"}
/// description : {"ru":"крутой чел","en":"cool guy"}
/// link : {"url":"https:/jsonplaceholder/users","title":{"ru":"юзеры на жсон","en":"users on json"}}
/// arts : ["lol","kek","cheburek"]
/// tags : [4,1,5,6]
/// image : "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAApgAAAKYB3X3/OAAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAANCSURBVEiJtZZPbBtFFMZ/M7ubXdtdb1xSFyeilBapySVU8h8OoFaooFSqiihIVIpQBKci6KEg9Q6H9kovIHoCIVQJJCKE1ENFjnAgcaSGC6rEnxBwA04Tx43t2FnvDAfjkNibxgHxnWb2e/u992bee7tCa00YFsffekFY+nUzFtjW0LrvjRXrCDIAaPLlW0nHL0SsZtVoaF98mLrx3pdhOqLtYPHChahZcYYO7KvPFxvRl5XPp1sN3adWiD1ZAqD6XYK1b/dvE5IWryTt2udLFedwc1+9kLp+vbbpoDh+6TklxBeAi9TL0taeWpdmZzQDry0AcO+jQ12RyohqqoYoo8RDwJrU+qXkjWtfi8Xxt58BdQuwQs9qC/afLwCw8tnQbqYAPsgxE1S6F3EAIXux2oQFKm0ihMsOF71dHYx+f3NND68ghCu1YIoePPQN1pGRABkJ6Bus96CutRZMydTl+TvuiRW1m3n0eDl0vRPcEysqdXn+jsQPsrHMquGeXEaY4Yk4wxWcY5V/9scqOMOVUFthatyTy8QyqwZ+kDURKoMWxNKr2EeqVKcTNOajqKoBgOE28U4tdQl5p5bwCw7BWquaZSzAPlwjlithJtp3pTImSqQRrb2Z8PHGigD4RZuNX6JYj6wj7O4TFLbCO/Mn/m8R+h6rYSUb3ekokRY6f/YukArN979jcW+V/S8g0eT/N3VN3kTqWbQ428m9/8k0P/1aIhF36PccEl6EhOcAUCrXKZXXWS3XKd2vc/TRBG9O5ELC17MmWubD2nKhUKZa26Ba2+D3P+4/MNCFwg59oWVeYhkzgN/JDR8deKBoD7Y+ljEjGZ0sosXVTvbc6RHirr2reNy1OXd6pJsQ+gqjk8VWFYmHrwBzW/n+uMPFiRwHB2I7ih8ciHFxIkd/3Omk5tCDV1t+2nNu5sxxpDFNx+huNhVT3/zMDz8usXC3ddaHBj1GHj/As08fwTS7Kt1HBTmyN29vdwAw+/wbwLVOJ3uAD1wi/dUH7Qei66PfyuRj4Ik9is+hglfbkbfR3cnZm7chlUWLdwmprtCohX4HUtlOcQjLYCu+fzGJH2QRKvP3UNz8bWk1qMxjGTOMThZ3kvgLI5AzFfo379UAAAAASUVORK5CYII="
/// format : "jpg"

AuthorReq authorReqFromJson(String str) => AuthorReq.fromJson(json.decode(str));
String authorReqToJson(AuthorReq data) => json.encode(data.toJson());
class AuthorReq {
  AuthorReq({
      Name? name, 
      Description? description, 
      Link? link, 
      List<String>? arts, 
      List<int>? tags, 
      String? image, 
      String? format,}){
    _name = name;
    _description = description;
    _link = link;
    _arts = arts;
    _tags = tags;
    _image = image;
    _format = format;
}

  AuthorReq.fromJson(dynamic json) {
    _name = json['name'] != null ? Name.fromJson(json['name']) : null;
    _description = json['description'] != null ? Description.fromJson(json['description']) : null;
    _link = json['link'] != null ? Link.fromJson(json['link']) : null;
    _arts = json['arts'] != null ? json['arts'].cast<String>() : [];
    _tags = json['tags'] != null ? json['tags'].cast<int>() : [];
    _image = json['image'];
    _format = json['format'];
  }
  Name? _name;
  Description? _description;
  Link? _link;
  List<String>? _arts;
  List<int>? _tags;
  String? _image;
  String? _format;
AuthorReq copyWith({  Name? name,
  Description? description,
  Link? link,
  List<String>? arts,
  List<int>? tags,
  String? image,
  String? format,
}) => AuthorReq(  name: name ?? _name,
  description: description ?? _description,
  link: link ?? _link,
  arts: arts ?? _arts,
  tags: tags ?? _tags,
  image: image ?? _image,
  format: format ?? _format,
);
  Name? get name => _name;
  Description? get description => _description;
  Link? get link => _link;
  List<String>? get arts => _arts;
  List<int>? get tags => _tags;
  String? get image => _image;
  String? get format => _format;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_name != null) {
      map['name'] = _name?.toJson();
    }
    if (_description != null) {
      map['description'] = _description?.toJson();
    }
    if (_link != null) {
      map['link'] = _link?.toJson();
    }
    map['arts'] = _arts;
    map['tags'] = _tags;
    map['image'] = _image;
    map['format'] = _format;
    return map;
  }

}

/// url : "https:/jsonplaceholder/users"
/// title : {"ru":"юзеры на жсон","en":"users on json"}

Link linkFromJson(String str) => Link.fromJson(json.decode(str));
String linkToJson(Link data) => json.encode(data.toJson());
class Link {
  Link({
      String? url, 
      Title? title,}){
    _url = url;
    _title = title;
}

  Link.fromJson(dynamic json) {
    _url = json['url'];
    _title = json['title'] != null ? Title.fromJson(json['title']) : null;
  }
  String? _url;
  Title? _title;
Link copyWith({  String? url,
  Title? title,
}) => Link(  url: url ?? _url,
  title: title ?? _title,
);
  String? get url => _url;
  Title? get title => _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    if (_title != null) {
      map['title'] = _title?.toJson();
    }
    return map;
  }

}

/// ru : "юзеры на жсон"
/// en : "users on json"

Title titleFromJson(String str) => Title.fromJson(json.decode(str));
String titleToJson(Title data) => json.encode(data.toJson());
class Title {
  Title({
      String? ru, 
      String? en,}){
    _ru = ru;
    _en = en;
}

  Title.fromJson(dynamic json) {
    _ru = json['ru'];
    _en = json['en'];
  }
  String? _ru;
  String? _en;
Title copyWith({  String? ru,
  String? en,
}) => Title(  ru: ru ?? _ru,
  en: en ?? _en,
);
  String? get ru => _ru;
  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ru'] = _ru;
    map['en'] = _en;
    return map;
  }

}

/// ru : "крутой чел"
/// en : "cool guy"

Description descriptionFromJson(String str) => Description.fromJson(json.decode(str));
String descriptionToJson(Description data) => json.encode(data.toJson());
class Description {
  Description({
      String? ru, 
      String? en,}){
    _ru = ru;
    _en = en;
}

  Description.fromJson(dynamic json) {
    _ru = json['ru'];
    _en = json['en'];
  }
  String? _ru;
  String? _en;
Description copyWith({  String? ru,
  String? en,
}) => Description(  ru: ru ?? _ru,
  en: en ?? _en,
);
  String? get ru => _ru;
  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ru'] = _ru;
    map['en'] = _en;
    return map;
  }

}

/// ru : "Николас"
/// en : "Nikolas"

Name nameFromJson(String str) => Name.fromJson(json.decode(str));
String nameToJson(Name data) => json.encode(data.toJson());
class Name {
  Name({
      String? ru, 
      String? en,}){
    _ru = ru;
    _en = en;
}

  Name.fromJson(dynamic json) {
    _ru = json['ru'];
    _en = json['en'];
  }
  String? _ru;
  String? _en;
Name copyWith({  String? ru,
  String? en,
}) => Name(  ru: ru ?? _ru,
  en: en ?? _en,
);
  String? get ru => _ru;
  String? get en => _en;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ru'] = _ru;
    map['en'] = _en;
    return map;
  }

}