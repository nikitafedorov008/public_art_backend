import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:shelf/shelf.dart';

import '../../database/publicart_db.dart';
import '../../models/author_request.dart';
import '../../models/news_paper_request.dart';
import '../../models/route_request.dart';
import '../../server.dart';
import '../../utils/consts.dart';

///ADD NEW NEWSPAPER
Future<Response> addRouteHandler(Request request) async {
  Map<String,dynamic> routeJsonMap = jsonDecode(await request.readAsString());
  RouteRequest routeRequest = RouteRequest.fromJson(routeJsonMap);

  return Response.ok(
    jsonEncode({
      'id':routeRequest.paid,
      'title': {
        'ru': routeRequest.name.ru,
        'en': routeRequest.name.en,
      },
      'description': {
        'ru': routeRequest.description.ru,
        'en': routeRequest.description.en,
      },
      'images': routeRequest.images,
      'city': routeRequest.city,
    }),
    headers: {
      'Content-type':'application/json'
    },
  );
}