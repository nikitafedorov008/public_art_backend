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

Future<Response> _addAuthorHandler(Request request) async {
  Map<String, dynamic> authorJsonMap = jsonDecode(await request.readAsString());
  final AuthorAddRequest authorRequest = AuthorAddRequest.fromJson(authorJsonMap);
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
  try {
    fileName = await _createFileFromString();
    publicArtDB.insertImage(Image(id: imageId, imageUrl: fileName));
  } catch (e) {
    print('error while adding photo $e');
  }
  //add author
  await publicArtDB.insertAuthor(
    Author(
      id: authorId,
      name: authorRequest.name,
      nameEN: authorRequest.nameEN,
      description: authorRequest.description,
      descriptionEN: authorRequest.descriptionEN,
      imageId: imageId,
    ),
  );
  //add author arts
  /*try {
      for(var artIndex in authorRequest.arts!) {
        publicArtDB.insertArtWork(ArtWork(artId: artIndex, authorId: authorId));
      }
    } catch (e) {
      print('error while adding author arts $e');
    }*/
  //add tags for author
  try {
    for (var tagIndex in authorRequest.tags!) {
      publicArtDB.insertAuthorTag(AuthorTag(authorId: authorId, tagId: tagIndex));
    }
  } catch (e) {
    print('error while adding tags $e');
  }
  //get author from database
  Author author = await publicArtDB.getAuthorById(authorId);
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
  //print user info
  print('author: ${author.name}, ${author.description}, ${author.id}; image: ${authorImage.imageUrl};${authorArts.isEmpty ? '' : ' arts: $authorArtsFiltered'}${authorTagsFiltered.isEmpty ? '' : ' tags: $authorTagsFiltered'}');
  return Response.ok(
    jsonEncode({
      'author':author,
      'name': authorRequest.name,
      //'data': authorJsonMap,
    }),
  );
}

Future<Response> _updateAuthorHandler(Request request, authorId) async {
  Map<String, dynamic> authorJsonMap = jsonDecode(await request.readAsString());
  final AuthorUpdateRequest authorRequest = AuthorUpdateRequest.fromJson(authorJsonMap);
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
      name: authorRequest.name,
      nameEN: authorRequest.nameEN,
      description: authorRequest.description,
      descriptionEN: authorRequest.descriptionEN,
      imageId: author.imageId,
    ),
  );
  Image imageRes = await publicArtDB.getImageById(author.imageId!);
  //make response
  return Response.ok(
    jsonEncode({
      'author':author,
      'id':authorId,
      'data': authorRequest.name,
      'arts': authorRequest.arts,
      'image': imageRes.imageUrl,
      //'image': imageRes.imageUrl!,
    }),
  );
}

Future<Response> _deleteAuthorHandler(Request request, authorId) async {
  //Map<String, dynamic> authorJsonMap = jsonDecode(await request.readAsString());
  //final AuthorUpdateRequest authorRequest = AuthorUpdateRequest.fromJson(authorJsonMap);
  Author author = await publicArtDB.getAuthorById(authorId);
  //final String authorId = _uuid.v4();
  final String imageId = _uuid.v1();
  //delete author image
  try {
    //delete old image
    Image imagePath = await publicArtDB.getImageById(author.imageId!);
    await File(".${imagePath.imageUrl}").delete();
    //fileName = await _createFileFromString();
    await publicArtDB.deleteImage(Image(id: author.imageId!, imageUrl: imagePath.imageUrl));
  } catch (e) {
    print('error while deleting photo $e');
  }
  //delete author tags
  try {
    List<AuthorTag> authorTags = await publicArtDB.getAllAuthorTags;
    for (var tagIndex in authorTags) {
      publicArtDB.deleteAuthorTag(AuthorTag(authorId: authorId, tagId: tagIndex.tagId));
    }
  } catch (e) {
    print('error while adding tags $e');
  }
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
    jsonEncode('author deleted'),
  );
}

Future<Response> _getAuthorsHandler(Request request) async {
  Map<String, dynamic> authorJsonMap = jsonDecode(await request.readAsString());
  final AuthorAddRequest authorRequest = AuthorAddRequest.fromJson(authorJsonMap);
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

  String exampleAuthorId = '';
  String exampleAuthorImageId = '';

  void addAuthor(AuthorAddRequest authorRequest) async {
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
    try {
      fileName = await _createFileFromString();
      publicArtDB.insertImage(Image(id: imageId, imageUrl: fileName));
    } catch (e) {
      print('error while adding photo $e');
    }
    //add author
    await publicArtDB.insertAuthor(
      Author(
        id: authorId,
        name: authorRequest.name,
        nameEN: authorRequest.nameEN,
        description: authorRequest.description,
        descriptionEN: authorRequest.descriptionEN,
        imageId: imageId,
      ),
    );
    //add author arts
    /*try {
      for(var artIndex in authorRequest.arts!) {
        publicArtDB.insertArtWork(ArtWork(artId: artIndex, authorId: authorId));
      }
    } catch (e) {
      print('error while adding author arts $e');
    }*/
    //add tags for author
    try {
      for (var tagIndex in authorRequest.tags!) {
        publicArtDB.insertAuthorTag(AuthorTag(authorId: authorId, tagId: tagIndex));
      }
    } catch (e) {
      print('error while adding tags $e');
    }
    //get author from database
    Author author = await publicArtDB.getAuthorById(authorId);
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
    //print user info
    print('author: ${author.name}, ${author.description}, ${author.id}; image: ${authorImage.imageUrl};${authorArts.isEmpty ? '' : ' arts: $authorArtsFiltered'}${authorTagsFiltered.isEmpty ? '' : ' tags: $authorTagsFiltered'}');
    //write example id
    exampleAuthorId = authorId;
  }

  void updateAuthor(AuthorUpdateRequest authorRequest) async {
    //get author from database
    Author author = await publicArtDB.getAuthorById(authorRequest.authorId);
    //final String authorId = _uuid.v4();
    Image imageId = await publicArtDB.getImageById(authorRequest.authorId);
    final String newImageId = _uuid.v1();
    //update author image
    String fileName = '';
    Future<String> _createFileFromString() async {
      final encodedStr = authorRequest.image;
      Uint8List bytes = base64.decode(encodedStr!);
      String directory = './upload/pictures';
      String uploadFileName = "/upload/pictures/$newImageId.${authorRequest.format}";
      File file = File("$directory/$newImageId.${authorRequest.format}");
      await file.writeAsBytes(bytes);
      fileName = uploadFileName;
      return uploadFileName;
    }
    try {
      fileName = await _createFileFromString();
      publicArtDB.updateImage(Image(id: imageId.imageUrl, imageUrl: fileName));
    } catch (e) {
      print('error while updating photo $e');
    }
    //update author
    await publicArtDB.updateAuthor(
      Author(
        id: authorRequest.authorId,
        name: authorRequest.name,
        nameEN: authorRequest.nameEN,
        description: authorRequest.description,
        descriptionEN: authorRequest.descriptionEN,
      ),
    );
    //update author arts
    /*try {
      for(var artIndex in authorRequest.arts!) {
        publicArtDB.insertArtWork(ArtWork(artId: artIndex, authorId: authorId));
      }
    } catch (e) {
      print('error while adding author arts $e');
    }*/
    //update tags for author
    try {
      for (var tagIndex in authorRequest.tags!) {
        publicArtDB.updateAuthorTag(AuthorTag(authorId: authorRequest.authorId, tagId: tagIndex));
      }
    } catch (e) {
      print('error while updating tags $e');
    }
    //get author's image
    Image authorImage = await publicArtDB.getImageById(author.imageId!);
    //get author arts
    List<String> authorArtsFiltered = [];
    List<ArtWork> authorArts = await publicArtDB.getArtWorksById(authorRequest.authorId);
    for (var artWorkIndex in authorArts) {
      Art art = await publicArtDB.getArtById(artWorkIndex.artId);
      authorArtsFiltered.add(art.id);
    }
    //get author's tags
    List<int> authorTagsFiltered = [];
    List<AuthorTag> authorTags = await publicArtDB.getAuthorTagsById(authorRequest.authorId);
    for (var element in authorTags) {
      authorTagsFiltered.add(element.tagId);
    }
    //print user info
    print('author: ${author.name}, ${author.description}, ${author.id}; image: ${authorImage.imageUrl};${authorArts.isEmpty ? '' : ' arts: $authorArtsFiltered'}${authorTagsFiltered.isEmpty ? '' : ' tags: $authorTagsFiltered'}');
    //write example id
    exampleAuthorId = authorRequest.authorId;
  }
  //adding author example
  //addAuthor(AuthorAddRequest(name: 'Николас', nameEN: 'Nikolas', description: 'крутой чел', descriptionEN: 'cool guy', arts: ['sdsd','sdsdsd'], tags: [3,1], image: 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAApgAAAKYB3X3/OAAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAANCSURBVEiJtZZPbBtFFMZ/M7ubXdtdb1xSFyeilBapySVU8h8OoFaooFSqiihIVIpQBKci6KEg9Q6H9kovIHoCIVQJJCKE1ENFjnAgcaSGC6rEnxBwA04Tx43t2FnvDAfjkNibxgHxnWb2e/u992bee7tCa00YFsffekFY+nUzFtjW0LrvjRXrCDIAaPLlW0nHL0SsZtVoaF98mLrx3pdhOqLtYPHChahZcYYO7KvPFxvRl5XPp1sN3adWiD1ZAqD6XYK1b/dvE5IWryTt2udLFedwc1+9kLp+vbbpoDh+6TklxBeAi9TL0taeWpdmZzQDry0AcO+jQ12RyohqqoYoo8RDwJrU+qXkjWtfi8Xxt58BdQuwQs9qC/afLwCw8tnQbqYAPsgxE1S6F3EAIXux2oQFKm0ihMsOF71dHYx+f3NND68ghCu1YIoePPQN1pGRABkJ6Bus96CutRZMydTl+TvuiRW1m3n0eDl0vRPcEysqdXn+jsQPsrHMquGeXEaY4Yk4wxWcY5V/9scqOMOVUFthatyTy8QyqwZ+kDURKoMWxNKr2EeqVKcTNOajqKoBgOE28U4tdQl5p5bwCw7BWquaZSzAPlwjlithJtp3pTImSqQRrb2Z8PHGigD4RZuNX6JYj6wj7O4TFLbCO/Mn/m8R+h6rYSUb3ekokRY6f/YukArN979jcW+V/S8g0eT/N3VN3kTqWbQ428m9/8k0P/1aIhF36PccEl6EhOcAUCrXKZXXWS3XKd2vc/TRBG9O5ELC17MmWubD2nKhUKZa26Ba2+D3P+4/MNCFwg59oWVeYhkzgN/JDR8deKBoD7Y+ljEjGZ0sosXVTvbc6RHirr2reNy1OXd6pJsQ+gqjk8VWFYmHrwBzW/n+uMPFiRwHB2I7ih8ciHFxIkd/3Omk5tCDV1t+2nNu5sxxpDFNx+huNhVT3/zMDz8usXC3ddaHBj1GHj/As08fwTS7Kt1HBTmyN29vdwAw+/wbwLVOJ3uAD1wi/dUH7Qei66PfyuRj4Ik9is+hglfbkbfR3cnZm7chlUWLdwmprtCohX4HUtlOcQjLYCu+fzGJH2QRKvP3UNz8bWk1qMxjGTOMThZ3kvgLI5AzFfo379UAAAAASUVORK5CYII=', format: 'jpg'),);
  //update author info
  //updateAuthor(AuthorUpdateRequest(authorId: exampleAuthorId, name: 'Николасc', nameEN: 'Nikolass', description: 'крутой челл', descriptionEN: 'cool guy', arts: ['sdsd','sdsdsd'], tags: [3,1,4], image: 'iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAApgAAAKYB3X3/OAAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAANCSURBVEiJtZZPbBtFFMZ/M7ubXdtdb1xSFyeilBapySVU8h8OoFaooFSqiihIVIpQBKci6KEg9Q6H9kovIHoCIVQJJCKE1ENFjnAgcaSGC6rEnxBwA04Tx43t2FnvDAfjkNibxgHxnWb2e/u992bee7tCa00YFsffekFY+nUzFtjW0LrvjRXrCDIAaPLlW0nHL0SsZtVoaF98mLrx3pdhOqLtYPHChahZcYYO7KvPFxvRl5XPp1sN3adWiD1ZAqD6XYK1b/dvE5IWryTt2udLFedwc1+9kLp+vbbpoDh+6TklxBeAi9TL0taeWpdmZzQDry0AcO+jQ12RyohqqoYoo8RDwJrU+qXkjWtfi8Xxt58BdQuwQs9qC/afLwCw8tnQbqYAPsgxE1S6F3EAIXux2oQFKm0ihMsOF71dHYx+f3NND68ghCu1YIoePPQN1pGRABkJ6Bus96CutRZMydTl+TvuiRW1m3n0eDl0vRPcEysqdXn+jsQPsrHMquGeXEaY4Yk4wxWcY5V/9scqOMOVUFthatyTy8QyqwZ+kDURKoMWxNKr2EeqVKcTNOajqKoBgOE28U4tdQl5p5bwCw7BWquaZSzAPlwjlithJtp3pTImSqQRrb2Z8PHGigD4RZuNX6JYj6wj7O4TFLbCO/Mn/m8R+h6rYSUb3ekokRY6f/YukArN979jcW+V/S8g0eT/N3VN3kTqWbQ428m9/8k0P/1aIhF36PccEl6EhOcAUCrXKZXXWS3XKd2vc/TRBG9O5ELC17MmWubD2nKhUKZa26Ba2+D3P+4/MNCFwg59oWVeYhkzgN/JDR8deKBoD7Y+ljEjGZ0sosXVTvbc6RHirr2reNy1OXd6pJsQ+gqjk8VWFYmHrwBzW/n+uMPFiRwHB2I7ih8ciHFxIkd/3Omk5tCDV1t+2nNu5sxxpDFNx+huNhVT3/zMDz8usXC3ddaHBj1GHj/As08fwTS7Kt1HBTmyN29vdwAw+/wbwLVOJ3uAD1wi/dUH7Qei66PfyuRj4Ik9is+hglfbkbfR3cnZm7chlUWLdwmprtCohX4HUtlOcQjLYCu+fzGJH2QRKvP3UNz8bWk1qMxjGTOMThZ3kvgLI5AzFfo379UAAAAASUVORK5CYII=', format: 'jpg'),);
}

//model for request to add author
class AuthorAddRequest {
  late String name;
  late String nameEN;
  late String description;
  late String descriptionEN;
  String? image;
  String? format;
  List<dynamic>? arts;
  List<dynamic>? tags;

  AuthorAddRequest({
    required this.name,
    required this.nameEN,
    required this.description,
    required this.descriptionEN,
    this.image,
    this.format,
    this.arts,
    this.tags,
  });

  AuthorAddRequest.fromJson(Map<String, dynamic> json):
   name = json['name'],
   nameEN = json['nameEN'],
   description = json['description'],
   descriptionEN = json['descriptionEN'],
   image = json['image'],
   format = json['format'],
   arts = json['arts'],
   tags = json['tags'];


  Map<String, dynamic> toJson() => {
    'name': name,
    'nameEN': nameEN,
    'description': description,
    'descriptionEN': descriptionEN,
    'image': image!,
    'format': format!,
    'arts': arts!,
    'tags': tags!,
  };
}

//model for request to update author info
class AuthorUpdateRequest {
  late String authorId;
  late String name;
  late String nameEN;
  late String description;
  late String descriptionEN;
  String? image;
  String? format;
  List<dynamic>? arts;
  List<dynamic>? tags;

  AuthorUpdateRequest({
    required this.authorId,
    required this.name,
    required this.nameEN,
    required this.description,
    required this.descriptionEN,
    this.image,
    this.format,
    this.arts,
    this.tags,
  });

  AuthorUpdateRequest.fromJson(Map<String, dynamic> json):
   name = json['name'],
   nameEN = json['nameEN'],
   description = json['description'],
   descriptionEN = json['descriptionEN'],
   image = json['image'],
   format = json['format'],
   arts = json['arts'],
   tags = json['tags'];


  Map<String, dynamic> toJson() => {
    'authorId': authorId,
    'name': name,
    'nameEN': nameEN,
    'description': description,
    'descriptionEN': descriptionEN,
    'image': image!,
    'format': format!,
    'arts': arts!,
    'tags': tags!,
  };
}