import 'dart:convert';
import 'dart:io';

import 'package:shelf/shelf.dart';

import '../../database/publicart_db.dart';
import '../../utils/consts.dart';

Future<Response> deleteAuthorHandler(Request request, authorId) async {
  //Map<String, dynamic> authorJsonMap = jsonDecode(await request.readAsString());
  //final AuthorUpdateRequest authorRequest = AuthorUpdateRequest.fromJson(authorJsonMap);
  Author author = await publicArtDB.getAuthorById(authorId);
  //final String authorId = _uuid.v4();
  final String imageId = uuid.v1();
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