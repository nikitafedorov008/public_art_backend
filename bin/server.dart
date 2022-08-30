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
import 'person.dart';
import 'requests/author/add_author.dart';
import 'requests/author/delete_author.dart';
import 'requests/author/get_authors.dart';
import 'requests/author/update_author.dart';
import 'requests/news_paper/add_news_paper.dart';
import 'requests/route/add_route.dart';

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
  ..post('/author', addAuthorHandler)
  ..put('/author/<authorId>', updateAuthorHandler)
  ..delete('/author/<authorId>', deleteAuthorHandler)
  ..get('/authors', getAuthorsHandler)
  ..post('/news', addNewsPaperHandler)
  ..post('/route', addRouteHandler)
;


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

void main(List<String> args) async {
  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // Configure a pipeline that logs requests.
  final _handler = Pipeline().addMiddleware(logRequests()).addHandler(_router);

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '4040');
  final server = await serve(_handler, ip, port);
  print('Server listening on ip $ip on address ${server.address.host} on port ${server.port}');

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
