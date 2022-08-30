import 'dart:convert';

import 'package:shelf/shelf.dart';

import '../../database/publicart_db.dart';
import '../../utils/consts.dart';

Future<Response> getAuthorsHandler(Request request) async {
  //create response list first response list
  List<Map<String, dynamic>>? responseList = [];
  //get authors from database
  try {
    List<Author> authorList = await publicArtDB.getAllAuthors;
    //get author from list
    for(Author author in authorList) {
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
        List<ArtWork> authorArts = await publicArtDB.getArtWorksById(author.id);
        for (var artWorkIndex in authorArts) {
          Art art = await publicArtDB.getArtById(artWorkIndex.artId);
          authorArtsFiltered.add(art.id);
        }
      } catch (e) {
        print('error while getting art $e');
      }
      //get author's tags
      List<AuthorTag>? authorTags = [];
      try {
        authorTags = await publicArtDB.getAuthorTagsById(author.id);
      } catch (e) {
        print('error while getting authorTags');
      }
      //get author link
      Link? authorLink;
      try {
        AuthorLink link = await publicArtDB.getAuthorLinkById(author.id);
        await publicArtDB.getLinkById(link.linkId).then((value) => authorLink = value).catchError((e){print('error while getting link $e');});
      } catch (e) {
        print('error while getting author link');
      }
      responseList.add({
        'id':author.id,
        'name': {
          'ru':author.name,
          'en':author.nameEN,
        },
        'description':{
          'ru':author.description,
          'en':author.descriptionEN,
        },
        'image':authorImage?.imageUrl,
        'link':{
          'url':authorLink?.url,
          'title':{
            'ru':authorLink?.title,
            'en':authorLink?.titleEN
          }
        },
        'tags': authorTags?.map((AuthorTag tag) => tag.tagId).toList(),
        'arts':authorArtsFiltered,
      });
    }
  } catch (e) {
    print('error while getting users');
  }
  return Response.ok(
    jsonEncode(responseList.isEmpty ? 'no users found' : responseList),
    headers: {
      'Content-type':'application/json'
    },
  );
}