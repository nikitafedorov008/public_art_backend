import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:shelf/shelf.dart';

import '../../database/publicart_db.dart';
import '../../models/author_request.dart';
import '../../server.dart';
import '../../utils/consts.dart';

///ADD NEW AUTHOR
Future<Response> addAuthorHandler(Request request) async {
  Map<String,dynamic> authorJsonMap = jsonDecode(await request.readAsString());
  AuthorRequest authorRequest = AuthorRequest.fromJson(authorJsonMap);
  //final AuthorAddRequest authorRequest = AuthorAddRequest.fromJson(authorJsonMap);
  final String authorId = uuid.v4();
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
    final String linkId = uuid.v1();
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