import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:shelf/shelf.dart';

import '../../database/publicart_db.dart';
import '../../models/author_request.dart';
import '../../utils/consts.dart';

///UPDATE AUTHOR
Future<Response> updateNewsPaperHandler(Request request, authorId) async {
  Map<String, dynamic> authorJsonMap = jsonDecode(await request.readAsString());
  final AuthorRequest authorRequest = AuthorRequest.fromJson(authorJsonMap);
  Author author = await publicArtDB.getAuthorById(authorId);
  //final String authorId = _uuid.v4();
  final String imageId = uuid.v1();
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