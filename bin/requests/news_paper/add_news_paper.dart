import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:shelf/shelf.dart';

import '../../database/publicart_db.dart';
import '../../models/news_paper_request.dart';
import '../../server.dart';
import '../../utils/consts.dart';

///ADD NEW NEWSPAPER
Future<Response> addNewsPaperHandler(Request request) async {
  Map<String,dynamic> newsJsonMap = jsonDecode(await request.readAsString());
  NewsPaperRequest newsPaperRequest = NewsPaperRequest.fromJson(newsJsonMap);
  //final AuthorAddRequest authorRequest = AuthorAddRequest.fromJson(authorJsonMap);
  final String newsId = uuid.v4();
  final String linkId = uuid.v1();
  //add news paper images
  String fileName = '';
  for (String imageIndex in newsPaperRequest.images) {
    final String imageId = uuid.v1();
    Future<String> _createFileFromString() async {
      final encodedStr = imageIndex;
      Uint8List bytes = base64.decode(encodedStr);
      String directory = './upload/pictures';
      String uploadFileName = "/upload/pictures/$imageId.png";
      File file = File("$directory/$imageId.png");
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
  }
  //add news paper videos
  try {
    for (var videoIndex in newsPaperRequest.videos!.toList()) {
      final String videoId = uuid.v1();
      Future<String> _createFileFromString() async {
        final encodedStr = videoIndex;
        Uint8List bytes = base64.decode(encodedStr);
        String directory = './upload/videos';
        String uploadFileName = "/upload/videos/$videoId.mp4";
        File file = File("$directory/$videoId.mp4");
        await file.writeAsBytes(bytes);
        fileName = uploadFileName;
        return uploadFileName;
      }
      await _createFileFromString()
          .then((videoURL) async {
        fileName = videoURL;
        await publicArtDB.insertVideo(Video(id: videoId, videoUrl: fileName));
      })
          .catchError((e) {
        print('error while adding video $e');
      },);
    }
  } catch (e) {}
  //add newspaper
  await publicArtDB.insertNewsPaper(
    NewsPaper(
      id: newsId,
      title: newsPaperRequest.title.ru,
      titleEN: newsPaperRequest.title.en,
      subtitle: newsPaperRequest.subtitle.ru,
      subtitleEN: newsPaperRequest.subtitle.en,
      description: newsPaperRequest.description.ru,
      descriptionEN: newsPaperRequest.description.en,
      importantInfo: newsPaperRequest.importantInfo.ru,
      importantInfoEN: newsPaperRequest.importantInfo.en,
      eternalLink: linkId,
      eventStart: DateTime.parse(newsPaperRequest.eventDuration!.start.toString()),
      eventFinish: DateTime.parse(newsPaperRequest.eventDuration!.end.toString()),
      eventAddress: newsPaperRequest.address!.ru,
      eventAddressEN: newsPaperRequest.address!.en,
      lat: newsPaperRequest.coordinates!.lat,
      lng: newsPaperRequest.coordinates!.lng,
      isPinned: newsPaperRequest.pinned,
      isEvent: newsPaperRequest.event,
      eventDate: DateTime.parse(newsPaperRequest.dateOfEvent!),
    ),
  );
  //add tags for author
  try {
    if (newsPaperRequest.tags.isEmpty) {
      print('no tags');
    }  else {
      for(var tagIndex in newsPaperRequest.tags) {
        print(tagIndex);
        await publicArtDB.insertNewsPaperTag(NewsPaperTag(newsPaperId: newsId, tagId: tagIndex));
      }
    }
  } catch (e) {
    print('error while adding author tags $e');
  }
  //add eternal link for news paper
  try {
    await publicArtDB.insertLink(
      Link(
        id: linkId,
        url: newsPaperRequest.eternalLink.url,
        title: newsPaperRequest.eternalLink.title.ru,
        titleEN: newsPaperRequest.eternalLink.title.en,
      ),
    );
  } catch (e) {
    print('error while adding author tags $e');
  }
  //add links for news paper
  try {
    newsPaperRequest.links?.forEach((linkIndex) async {
      final String linkId = uuid.v1();
      await publicArtDB.insertLink(
        Link(
          id: linkId,
          url: linkIndex.url,
          title: linkIndex.title.ru,
          titleEN: linkIndex.title.en,
        ),
      );
      await publicArtDB.insertNewsPaperLink(
        NewsPaperLink(newsPaperId: newsId, linkId: linkId),
      );
    });
  } catch (e) {
    print('error while adding author tags $e');
  }
  //get news paper from database
  NewsPaper newsPaper = await publicArtDB.getNewsPaperById(newsId);
  //get author's image
  List<Image>? newsPaperImages;
  try {
    List<NewsPaperImage> imageList = await publicArtDB.getNewsPaperImagesById(newsPaper.id);
    for (var newsImageIndex in imageList) {
      newsPaperImages?.add(await publicArtDB.getImageById(newsImageIndex.imageId));
    }
  } catch (e) {
    print('error while getting photo $e');
  }
  //get news paper's tags
  List<int> newspaperTagsFiltered = [];
  try {
    List<NewsPaperTag> newsPaperTags = await publicArtDB.getNewsPaperTagsById(newsId);
    if (newsPaperTags.isEmpty) {
      print('no tags');
    }  else {
      newsPaperTags.forEach((element) {newspaperTagsFiltered.add(element.tagId);});
    }
  } catch (e) {
    print('error while getting authorTags');
  }
  //get news paper eternal link
  Link? newsPaperLink;
  try {
    newsPaperLink = await publicArtDB.getLinkById(linkId);
  } catch (e) {
    print('error while getting author link');
  }
  //get news paper links
  Future<List<Map<String, dynamic>>> getLinks() async {
    List<NewsPaperLink>? links = await publicArtDB.getNewsPaperLinksById(newsPaper.id);
    List<Map<String, dynamic>> newLinks = [];
    for (var linkIndex in links) {
      Link newsLink = await publicArtDB.getLinkById(linkIndex.linkId);
      print('one $newLinks');
      newLinks.add({
        'url':newsLink.url,
        'title':{
          'ru':newsLink.title,
          'en':newsLink.titleEN,
        },
      });
    }
    print('two $newLinks');
    return await newLinks;
  }
  List<Map<String, dynamic>>? newsLinks = await getLinks();
  /*links.forEach((linkIndex) async {
    Link newsLink = await publicArtDB.getLinkById(linkIndex.linkId);
    print(newsLink);
    newsLinks.add(newsLink);
  });*/
  /*for (var element in authorTags) {
    authorTagsFiltered.add(element.tagId);
  }*/
  //print user info
  //print('author: ${author.name}, ${author.description}, ${author.id};${authorImage!.imageUrl.isEmpty ? '' : ' image: ${authorImage!.imageUrl}'};${authorTagsFiltered.isEmpty ? '' : ' arts: $authorArtsFiltered'}${authorTagsFiltered.isEmpty ? '' : ' tags: $authorTagsFiltered'}');
  return Response.ok(
    jsonEncode({
      'id':newsPaper.id,
      'title': {
        'ru': newsPaper.title,
        'en': newsPaper.titleEN,
      },
      'description': {
        'ru': newsPaper.description,
        'en': newsPaper.descriptionEN,
      },
      'images': newsPaperImages,
      'eternal_link': {
        'url':newsPaperLink?.url,
        'title': {
          'ru': newsPaperLink?.title,
          'en':newsPaperLink?.titleEN,
        }
      },
      'links': newsLinks,
      'tags': newspaperTagsFiltered,
    }),
    headers: {
      'Content-type':'application/json'
    },
  );
}