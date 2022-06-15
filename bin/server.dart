import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:hive/hive.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';
import 'package:path/path.dart' as path;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_virtual_directory/shelf_virtual_directory.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';
import 'package:uuid/uuid.dart';
import 'person.dart';
import 'person.dart';
import 'publicart_db.dart';

// Configure routes.
final _router = Router()
  ..get('/', _rootHandler)
  ..get('/echo/<message>', _echoHandler)
  ..get('/kek/<message>', _kekHandler)
  ..post('/lol/', _lolHandler)
  ..delete('/lol/<number>', _lolDeleteHandler)
  ..put('/lol/<post>', _lolPutHandler)
  ..get('/ws', wsHandle)
  ..get('/auth', _authHandler)
  ..post('/register', _registerHandler)
  ..post('/upload', _uploadHandler)
//..mount('/routerstatic/', virDir.router)
//..mount('/storage2/', virDir.handler)
  ..mount('/storage/', ShelfVirtualDirectory(folderPath, listDirectory: true).handler)
///production router
  ..post('/author', _addAuthorHandler)
  ..put('/author/<authorId>', _updateAuthorHandler)
  ..delete('/author/<authorId>', _deleteAuthorHandler)
  ..get('/authors', _getAuthorsHandler)
;

//database instance
final publicArtDB = PublicArtDB();
//uuid
final _uuid = Uuid();

final folderPath = path.join(
  Directory.current.path,
  './upload',
  //folderToServe,
);
final virDir = ShelfVirtualDirectory(folderPath);

Response _rootHandler(Request req) {
  return Response.ok('Hello, World!\n');
}

Response _echoHandler(Request request) {
  final message = params(request, 'message');
  return Response.ok('$message\n');
}

var wsHandle = webSocketHandler((webSocket) {
  webSocket.stream.listen((message) {
    print(message);
    webSocket.sink.add("echos $message");
  });
});

//Response _echoRequest(Request request) => Response.ok('Request for "${request.url}"',);

Response _kekHandler(Request request, String name) {
  if (name == 'a') {
    return Response.ok('fuck you\n');
  } else if (name == 'b') {
    return Response.ok('nice balls\n');
  } else {
    return Response.ok(
      jsonEncode({
        'success':true,
        'data':data
      }),
      headers: {
        'Content-type':'application/json'
      },
    );
  }
}

List data = [
  {
    "id":1,
    "Name":"Rachel Green",
    "Age": 32
  },
  {
    "id":2,
    "Name":"Ross Geller",
    "Age": 33
  },
  {
    "id":3,
    "Name":"Monica Geller",
    "Age": 32
  },
  {
    "id":4,
    "Name":"Joey Tribbiani",
    "Age": 31
  },
  {
    "id":5,
    "Name":"Chandler Bing",
    "Age": 33
  },
  {
    "id":6,
    "Name":"Pheobe Buffay",
    "Age": 34
  }
];

Future<Response> _addArtHandler(Request request) async {
  final payload = jsonDecode(await request.readAsString());
  data.add(payload);
  return Response.ok(
    jsonEncode({
      'success':true,
      'data':data
    }),
    headers: {
      'Content-type':'application/json'
    },
  );
}

Future<Response> _lolHandler(Request request) async {
  final payload = jsonDecode(await request.readAsString());
  data.add(payload);
  return Response.ok(
    jsonEncode({
      'success':true,
      'data':data
    }),
    headers: {
      'Content-type':'application/json'
    },
  );
}

Future<Response> _lolDeleteHandler(Request request, number) async {
  final idN = int.parse(number);
  final deletedData = data.firstWhere((element) => element['id']==idN, orElse: ()=> null);
  if(deletedData==null) {
    return Response.notFound(
      jsonEncode({
        'success':false,
        'data':'invalid id'
      }),
      headers: {
        'Content-type': 'application/json'
      },
    );
  }
  int pos = deletedData['id'];
  data.removeAt(pos-1);
  return Response.ok(
      jsonEncode({
        'success':true,
        'data':deletedData
      }),
      headers: {
        'Content-type':'application/json'
      }
  );
}

Future<Response> _lolPutHandler(Request request, number) async {
  final idNumber = int.parse(number);
  final payload = jsonDecode(await request.readAsString());
  var target = data.firstWhere((item) => item["id"] == idNumber);
  if (target != null) {
    target["Age"] = payload['Age'];
    target["Name"] = payload['Name'];
  }
  //final updatedData = data.where((element) => element['id'] == idNumber);
  if(target == null) {
    return Response.notFound(
      jsonEncode({
        'success':false,
        'data':'invalid id'
      }),
      headers: {
        'Content-type': 'application/json'
      },
    );
  }
  //int pos = updatedData.;
  //data.indexOf(pos);
  return Response.ok(
      jsonEncode({
        'success':true,
        'data':target
      }),
      headers: {
        'Content-type':'application/json'
      }
  );
}

var user = {
  'name':'Fucking',
  'surname':'Slave',
  'age':300,
  'work': {
    'type':'slaver',
    'grade':'hign',
    'spec':'junior',
  },
};

Future<Response> _registerHandler(Request request) async {
  final payload = jsonDecode(await request.readAsString());
  if(payload['name'] != null && payload['surname'] != null){
    //data.add(payload);
    final key = 'pushkeen';
    final claimSet = JwtClaim(
        //subject: 'userregister',
        payload: payload,
        //issuer: 'clientapp',
        //audience: <String>['lol@kek.com'],
        /*otherClaims: <String,dynamic>{
          'typ': 'JWT',
          'pld': {'k': 'v'}},*/
        maxAge: const Duration(minutes: 5));

    String token = issueJwtHS256(claimSet, key);
    print(token);
    return Response.ok(
      jsonEncode({
        'success':true,
        'user_data':payload,
        'token':token
      }),
      headers: {
        'Content-type':'application/json',
        'Authorization': 'Bearer ${token}'
      },
    );
  } else {
    return Response.badRequest(
      body: 'fuck you',
    );
  }
}

Future<Response> _authHandler(Request request) async {
  final payload = jsonDecode(await request.readAsString());
  if(request.headers.containsKey('Authorization')){
    //data.add(payload);
    return Response.ok(
      jsonEncode({
        'dataa': payload,
        'success':true,
        'data':data,
      }),
      headers: {
        'Content-type':'application/json',
        'Authorization': 'Bearer ${payload['jwt']}'
      },
    );
  } else {
    return Response.badRequest(
      body: 'fuck you',
    );
  }
}

Future<Response> _uploadHandler(Request request) async {
  final payload = jsonDecode(await request.readAsString());
  String fileName = '';
  Future<String> _createFileFromString() async {
    final encodedStr = payload['data'];
    Uint8List bytes = base64.decode(encodedStr);
    String directory = (payload['format'] == 'mp4') ? './upload/videos' : './upload/pictures';
    String uploadFileName = "$directory/${DateTime.now().millisecondsSinceEpoch}${(payload['format'] == 'mp4') ? '.mp4' : '.jpg'}";
    File file = File(
        "$directory/${DateTime.now().millisecondsSinceEpoch}${(payload['format'] == 'mp4') ? '.mp4' : '.jpg'}");
    await file.writeAsBytes(bytes);
    fileName = uploadFileName;
    return file.path;
  }
  fileName = await _createFileFromString();
  return Response.ok(
    jsonEncode({
      'file': fileName,
      'data': payload,
    })
  );
}

///ADD NEW AUTHOR
Future<Response> _addAuthorHandler(Request request) async {
  Map<String,dynamic> authorJsonMap = jsonDecode(await request.readAsString());
  AuthorRequest authorRequest = AuthorRequest.fromJson(authorJsonMap);
  //final AuthorAddRequest authorRequest = AuthorAddRequest.fromJson(authorJsonMap);
  final String authorId = _uuid.v4();
  final String imageId = _uuid.v1();
  //add author image
  String fileName = '';
  Future<String> _createFileFromString() async {
    final encodedStr = authorRequest.image;
    Uint8List bytes = base64.decode(encodedStr!);
    String directory = './upload/pictures';
    String uploadFileName = "/upload/pictures/$imageId.${authorRequest.format}";
    File file = File("$directory/$imageId.${authorRequest.format}");
    await file.writeAsBytes(bytes);
    fileName = uploadFileName;
    return uploadFileName;
  }
  await _createFileFromString()
      .then((imageURL) async {
        fileName = imageURL;
        await publicArtDB.insertImage(Image(id: imageId, imageUrl: fileName));
      })
      .catchError((e) {
        print('error while adding photo $e');
        },);
  /*try {
    fileName = await _createFileFromString();
    publicArtDB.insertImage(Image(id: imageId, imageUrl: fileName));
  } catch (e) {
    print('error while adding photo $e');
  }*/
  //add author
  await publicArtDB.insertAuthor(
    Author(
      id: authorId,
      name: authorRequest.name.ru,
      nameEN: authorRequest.name.en,
      description: authorRequest.description.ru,
      descriptionEN: authorRequest.description.en,
      imageId: fileName == '' ? null : imageId,
    ),
  );
  //add author arts
  try {
      if (authorRequest.arts!.isEmpty) {
        print('no arts');
      }  else {
        for(var artIndex in authorRequest.arts!) {
          await publicArtDB.insertArtWork(ArtWork(artId: artIndex, authorId: authorId));
        }
      }
    } catch (e) {
      print('error while adding author arts $e');
    }
  //add tags for author
  try {
    if (authorRequest.tags!.isEmpty) {
      print('no tags');
    }  else {
      for(var tagIndex in authorRequest.tags!) {
        print(tagIndex);
        await publicArtDB.insertAuthorTag(AuthorTag(authorId: authorId, tagId: tagIndex));
      }
    }
  } catch (e) {
    print('error while adding author tags $e');
  }
  //add links for author
  try {
    final String linkId = _uuid.v1();
    await publicArtDB.insertLink(
      Link(
        id: linkId,
        url: authorRequest.link.url,
        title: authorRequest.link.title.ru,
        titleEN: authorRequest.link.title.en,
      ),
    );
    await publicArtDB.insertAuthorLink(
      AuthorLink(
        authorId: authorId,
        linkId: linkId,
      ),
    );
  } catch (e) {
    print('error while adding author tags $e');
  }
  /*try {
    print(authorRequest.tags!);
    authorRequest.tags!.forEach((tag) async {
      await publicArtDB.insertAuthorTag(AuthorTag(authorId: authorId, tagId: tag)).then((value) => print('tag added'),);
    });
  } catch (e) {
    print('error while adding tags $e');
  }*/
  //get author from database
  Author author = await publicArtDB.getAuthorById(authorId);
  //get author's image
  Image? authorImage;
  try {
    await publicArtDB.getImageById(author.imageId!)
        .then((value) {authorImage = value;})
        .catchError((e){print('error while getting photo');});
  } catch (e) {
    print('error while getting photo $e');
  }
  //get author arts
  List<String> authorArtsFiltered = [];
  try {
    List<ArtWork> authorArts = await publicArtDB.getArtWorksById(authorId);
    for (var artWorkIndex in authorArts) {
      Art art = await publicArtDB.getArtById(artWorkIndex.artId);
      authorArtsFiltered.add(art.id);
    }
  } catch (e) {
    print('error while getting art $e');
  }
  //get author's tags
  List<int> authorTagsFiltered = [];
  try {
    List<AuthorTag> authorTags = await publicArtDB.getAuthorTagsById(authorId);
    if (authorTags.isEmpty) {
      print('no tags');
    }  else {
      authorTags.forEach((element) {authorTagsFiltered.add(element.tagId);});
    }
  } catch (e) {
    print('error while getting authorTags');
  }
  //get author link
  Link? authorLink;
  try {
    AuthorLink link = await publicArtDB.getAuthorLinkById(authorId);
    await publicArtDB.getLinkById(link.linkId).then((value) => authorLink = value).catchError((e){print('error while getting link $e');});
  } catch (e) {
    print('error while getting author link');
  }
  /*for (var element in authorTags) {
    authorTagsFiltered.add(element.tagId);
  }*/
  //print user info
  //print('author: ${author.name}, ${author.description}, ${author.id};${authorImage!.imageUrl.isEmpty ? '' : ' image: ${authorImage!.imageUrl}'};${authorTagsFiltered.isEmpty ? '' : ' arts: $authorArtsFiltered'}${authorTagsFiltered.isEmpty ? '' : ' tags: $authorTagsFiltered'}');
  return Response.ok(
    jsonEncode({
      'id':author.id,
      'name': {
        'ru': author.name,
        'en': author.nameEN,
      },
      'description': {
        'ru': author.description,
        'en': author.descriptionEN,
      },
      'image': authorImage?.imageUrl,
      'link': {
        'url':authorLink?.url,
        'title': {
          'ru': authorLink?.title,
          'en':authorLink?.titleEN,
        }
      },
      'tags': authorTagsFiltered,
      'arts': authorArtsFiltered,
    }),
    headers: {
      'Content-type':'application/json'
    },
  );
}

///UPDATE AUTHOR
Future<Response> _updateAuthorHandler(Request request, authorId) async {
  Map<String, dynamic> authorJsonMap = jsonDecode(await request.readAsString());
  final AuthorRequest authorRequest = AuthorRequest.fromJson(authorJsonMap);
  Author author = await publicArtDB.getAuthorById(authorId);
  //final String authorId = _uuid.v4();
  final String imageId = _uuid.v1();
  //add author image
  String fileName = '';
  Future<String> _createFileFromString() async {
    final encodedStr = authorRequest.image;
    Uint8List bytes = base64.decode(encodedStr!);
    String directory = './upload/pictures';
    String uploadFileName = "/upload/pictures/$imageId.${authorRequest.format}";
    File file = File("$directory/$imageId.${authorRequest.format}");
    await file.writeAsBytes(bytes);
    fileName = uploadFileName;
    return uploadFileName;
  }
  try {
    //delete old image
    Image imagePath = await publicArtDB.getImageById(author.imageId!);
    await File(".${imagePath.imageUrl}").delete();
    fileName = await _createFileFromString();
    await publicArtDB.updateImage(Image(id: author.imageId!, imageUrl: fileName));
  } catch (e) {
    print('error while updating photo $e');
  }
  //update author
  await publicArtDB.updateAuthor(
    Author(
      id: authorId,
      name: authorRequest.name.ru,
      nameEN: authorRequest.name.en,
      description: authorRequest.description.ru,
      descriptionEN: authorRequest.description.en,
      imageId: author.imageId,
    ),
  );
  //update tags
  /*try {
    for(var tagIndex in authorRequest.tags!) {
      await publicArtDB.updateAuthorTag(AuthorTag(authorId: authorId, tagId: tagIndex));
    }
  } catch (e) {
    print('error while updating tags $e');
  }*/
  //delete author tags
  if (authorRequest.tags!.isNotEmpty) {
    try {
      List<AuthorTag> authorTags = await publicArtDB.getAllAuthorTags;
      for (var tagIndex in authorTags) {
        publicArtDB.deleteAuthorTag(AuthorTag(authorId: authorId, tagId: tagIndex.tagId));
      }
    } catch (e) {
      print('error while adding tags $e');
    }
    //add tags for author
    try {
      if (authorRequest.tags!.isEmpty) {
        print('no tags');
      }  else {
        for(var tagIndex in authorRequest.tags!) {
          print(tagIndex);
          await publicArtDB.insertAuthorTag(AuthorTag(authorId: authorId, tagId: tagIndex));
        }
      }
    } catch (e) {
      print('error while adding author tags $e');
    }
  }
  //update links for author
  try {
    //getting link
    late Link authorLink;
    try {
      AuthorLink link = await publicArtDB.getAuthorLinkById(authorId);
      await publicArtDB.getLinkById(link.linkId).then((value) => authorLink = value).catchError((e){print('error while getting link $e');});
    } catch (e) {
      print('error while getting author link');
    }
    //updating link
    await publicArtDB.updateLink(
      Link(
        id: authorLink.id,
        url: authorRequest.link.url,
        title: authorRequest.link.title.ru,
        titleEN: authorRequest.link.title.en,
      ),
    );
  } catch (e) {
    print('error while updating author tags $e');
  }
  //get author's tags
  List<int> authorTagsFiltered = [];
  try {
    List<AuthorTag> authorTags = await publicArtDB.getAuthorTagsById(authorId);
    if (authorTags.isEmpty) {
      print('no tags');
    }  else {
      authorTags.forEach((element) {authorTagsFiltered.add(element.tagId);});
    }
  } catch (e) {
    print('error while getting authorTags');
  }
  //get author link
  Link? authorLink;
  try {
    AuthorLink link = await publicArtDB.getAuthorLinkById(authorId);
    await publicArtDB.getLinkById(link.linkId).then((value) => authorLink = value).catchError((e){print('error while getting link $e');});
  } catch (e) {
    print('error while getting author link');
  }
  Image imageRes = await publicArtDB.getImageById(author.imageId!);
  //make response
  return Response.ok(
    jsonEncode({
      'id':authorId,
      'name':{
        'ru':author.name,
        'en':author.nameEN,
      },
      'description':{
        'ru':author.description,
        'en':author.descriptionEN,
      },
      'image':imageRes.imageUrl,
      'link':{
        'url':authorLink?.url,
        'title':{
          'ru':authorLink?.title,
          'en':authorLink?.titleEN
        }
      },
      'tags':authorTagsFiltered,
      'arts': authorRequest.arts,
      //'image': imageRes.imageUrl!,
    }),
    headers: {
      'Content-type':'application/json'
    },
  );
}

Future<Response> _deleteAuthorHandler(Request request, authorId) async {
  //Map<String, dynamic> authorJsonMap = jsonDecode(await request.readAsString());
  //final AuthorUpdateRequest authorRequest = AuthorUpdateRequest.fromJson(authorJsonMap);
  Author author = await publicArtDB.getAuthorById(authorId);
  //final String authorId = _uuid.v4();
  final String imageId = _uuid.v1();
  //delete author image
  Image? imagePath;
  try {
    //delete old image
    imagePath = await publicArtDB.getImageById(author.imageId!);
    await File(".${imagePath.imageUrl}").delete();
    //fileName = await _createFileFromString();
    await publicArtDB.deleteImage(Image(id: author.imageId!, imageUrl: imagePath.imageUrl));
  } catch (e) {
    print('error while deleting photo $e');
  }
  //delete author tags
  List<AuthorTag>? authorTags;
  try {
    authorTags = await publicArtDB.getAuthorTagsById(authorId);
    for (var tagIndex in authorTags) {
      publicArtDB.deleteAuthorTag(AuthorTag(authorId: authorId, tagId: tagIndex.tagId));
    }
  } catch (e) {
    print('error while adding tags $e');
  }
  //get and delete author link
  Link? authorLink;
  try {
    AuthorLink link = await publicArtDB.getAuthorLinkById(authorId);
    await publicArtDB.getLinkById(link.linkId).then((link) => authorLink = link).catchError((e){print('error while getting link $e');});
    await publicArtDB.deleteLink(authorLink!);
    await publicArtDB.deleteAuthorLink(link);
  } catch (e) {
    print('error while getting author link');
  }
  //get and delete author arts
  List<ArtWork>? authorArts;
  try {
    authorArts = await publicArtDB.getArtWorksById(authorId);
    for (var artIndex in authorArts) {
      publicArtDB.deleteArtWork(artIndex);
    }
  } catch (e) {
    print('error while adding tags $e');
  }
  /*List<String> authorArtsFiltered = [];
  try {
    List<ArtWork> authorArts = await publicArtDB.getArtWorksById(authorId);
    for (ArtWork artWorkIndex in authorArts) {
      Art art = await publicArtDB.getArtById(artWorkIndex.artId);
      authorArtsFiltered.add(art.id);
      print('art_index: $artWorkIndex');
      await publicArtDB.deleteArtWork(artWorkIndex);
      print('art: $art');
      await publicArtDB.deleteArt(art);
    }
  } catch (e) {
    print('error while getting art $e');
  }*/
  //delete author
  await publicArtDB.deleteAuthor(
    Author(
      id: authorId,
      name: author.name,
      nameEN: author.nameEN,
      description: author.description,
      descriptionEN: author.descriptionEN,
      imageId: author.imageId,
    ),
  );
  //make response
  return Response.ok(
    jsonEncode({
      'deleted':true,
      'author': {
        'id':author.id,
        'name': {
          'ru':author.name,
          'en':author.nameEN,
        },
        'description':{
          'ru':author.description,
          'en':author.descriptionEN,
        },
        'image':imagePath?.imageUrl,
        'link':{
          'url':authorLink?.url,
          'title':{
            'ru':authorLink?.title,
            'en':authorLink?.titleEN
          }
        },
        'tags': authorTags?.map((e) => e.tagId).toList(),
        'arts':authorArts,
      },
    }),
    headers: {
      'Content-type':'application/json'
    },
  );
}

Future<Response> _getAuthorsHandler(Request request) async {
  Map<String, dynamic> authorJsonMap = jsonDecode(await request.readAsString());
  final AuthorRequest authorRequest = AuthorRequest.fromJson(authorJsonMap);
  final String authorId = _uuid.v4();
  //get authors from database
  List<Author> authors = await publicArtDB.getAllAuthors;
  List<Map<String, dynamic>> authorsListFiltered = [];
  //Author author = await publicArtDB.getAuthorById(authorId);
  for (Author author in authors) {
    //get author's image
    Image authorImage = await publicArtDB.getImageById(author.imageId!);
    //get author arts
    List<String> authorArtsFiltered = [];
    List<ArtWork> authorArts = await publicArtDB.getArtWorksById(authorId);
    for (var artWorkIndex in authorArts) {
      Art art = await publicArtDB.getArtById(artWorkIndex.artId);
      authorArtsFiltered.add(art.id);
    }
    //get author's tags
    List<int> authorTagsFiltered = [];
    List<AuthorTag> authorTags = await publicArtDB.getAuthorTagsById(authorId);
    for (var element in authorTags) {
      authorTagsFiltered.add(element.tagId);
    }
    authorsListFiltered.add({
      'id': author.id,
      'name':author.name,
      'description':author.description,
      'tags':authorTags,
      'image':authorImage,
    });
    //print user info
    print('author: ${author.name}, ${author.description}, ${author.id}; image: ${authorImage.imageUrl};${authorArts.isEmpty ? '' : ' arts: $authorArtsFiltered'}${authorTagsFiltered.isEmpty ? '' : ' tags: $authorTagsFiltered'}');
  }
  return Response.ok(
    jsonEncode(authorsListFiltered,),
    headers: {
      'Content-type':'application/json'
    },
  );
}

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final _handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '4040');
  final server = await serve(_handler, ip, port);
  print('Server listening on port ${server.port}');

  var path = Directory.current.path;
  Hive
    ..init(path)
    ..registerAdapter(PersonAdapter());
  var box = await Hive.openBox('testBox');
  var person = Person(
    name: 'Dave',
    age: 22,
    friends: ['Linda', 'Marc', 'Anne'],
  );
  await box.put('dave', person);
  print(box.get('dave')); // Dave: 22
}

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
