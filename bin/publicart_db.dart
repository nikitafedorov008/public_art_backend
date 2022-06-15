import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:uuid/uuid.dart';

part 'publicart_db.g.dart';

final _uuid = Uuid();

///AUTHOR DATABASES

@DataClassName('Author')
class Authors extends Table {
  @override
  Set<Column> get primaryKey => {id};
  //id uuid (string)
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  //name
  TextColumn get name => text()();
  TextColumn get nameEN => text()();
  //description
  TextColumn get description => text()();
  TextColumn get descriptionEN => text()();
  //image
  TextColumn get imageId => text().nullable()();
}

@DataClassName('AuthorTag')
class AuthorTags extends Table {
  @override
  Set<Column> get primaryKey => {authorId, tagId};
  TextColumn get authorId => text()();
  IntColumn get tagId => integer()();
}

@DataClassName('AuthorLink')
class AuthorLinks extends Table {
  @override
  Set<Column> get primaryKey => {authorId, linkId};
  TextColumn get authorId => text()();
  TextColumn get linkId => text()();
}


///ART DATABASES

@DataClassName('Art')
class Arts extends Table {
  @override
  Set<Column> get primaryKey => {id};
  //id uuid (string)
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  //name
  TextColumn get name => text()();
  TextColumn get nameEN => text()();
  //description
  TextColumn get description => text()();
  TextColumn get descriptionEN => text()();
  //has AR
  BoolColumn get hasAR => boolean()();
  //has audio
  BoolColumn get hasAudio => boolean()();
  //is paid audio
  BoolColumn get isPaidAudio => boolean()();
  //status title
  TextColumn get statusTitle => text()();
  TextColumn get statusTitleEN => text()();
}

@DataClassName('ArtWork')
class ArtWorks extends Table {
  @override
  Set<Column> get primaryKey => {artId, authorId};
  TextColumn get artId => text()();
  TextColumn get authorId => text()();
}

@DataClassName('ArtCategory')
class ArtCategories extends Table {
  @override
  Set<Column> get primaryKey => {artId, categoryId};
  TextColumn get artId => text()();
  IntColumn get categoryId => integer()();
}

///NEWS DATABASES

@DataClassName('NewsPaper')
class NewsPapers extends Table {
  @override
  Set<Column> get primaryKey => {id};
  //id uuid (string)
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  //title
  TextColumn get title => text()();
  TextColumn get titleEN => text()();
  //subtitle
  TextColumn get subtitle => text()();
  TextColumn get subtitleEN => text()();
  //description
  TextColumn get description => text()();
  TextColumn get descriptionEN => text()();
  //important info
  TextColumn get importantInfo => text()();
  TextColumn get importantInfoEN => text()();
  //event dates
  DateTimeColumn get eventStart => dateTime()();
  DateTimeColumn get eventFinish => dateTime()();
  //event address
  TextColumn get eventAddress => text()();
  TextColumn get eventAddressEN => text()();
  //coordinates
  RealColumn get lat => real()();
  RealColumn get lng => real()();
  //is pinned
  BoolColumn get isPinned => boolean()();
  //is event
  BoolColumn get isEvent => boolean()();
  //event date
  DateTimeColumn get eventDate => dateTime()();
}

@DataClassName('NewsPaperAddress')
class NewsPaperAddresses extends Table {
  @override
  Set<Column> get primaryKey => {newsPaperId, addressId};
  TextColumn get newsPaperId => text()();
  TextColumn get addressId => text()();
}

@DataClassName('NewsPaperImage')
class NewsPaperImages extends Table {
  @override
  Set<Column> get primaryKey => {newsPaperId, imageId};
  TextColumn get newsPaperId => text()();
  TextColumn get imageId => text()();
}


///PARTNER DATABASES

@DataClassName('Partner')
class Partners extends Table {
  @override
  Set<Column> get primaryKey => {id};
  //id uuid (string)
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  TextColumn get name => text()();
  TextColumn get nameEN => text()();
  TextColumn get description => text()();
  TextColumn get descriptionEN => text()();
  TextColumn get addressId => text()();
}

@DataClassName('PartnerCategory')
class PartnerCategories extends Table {
  @override
  Set<Column> get primaryKey => {partnerId, categoryId};
  TextColumn get partnerId => text()();
  IntColumn get categoryId => integer()();
}

@DataClassName('PartnerImage')
class PartnerImages extends Table {
  @override
  Set<Column> get primaryKey => {partnerId, imageId};
  TextColumn get partnerId => text()();
  TextColumn get imageId => text()();
}

///ADDRESS DATABASES

@DataClassName('Address')
class Addresses extends Table {
  @override
  Set<Column> get primaryKey => {id};
  //id uuid (string)
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  //name
  TextColumn get name => text()();
  TextColumn get nameEN => text()();
  //city id
  IntColumn get cityId => integer()();
  //coordinates
  RealColumn get lat => real()();
  RealColumn get lng => real()();
}

@DataClassName('City')
class Cities extends Table {
  @override
  Set<Column> get primaryKey => {id};
  //id
  IntColumn get id => integer()();
  //name
  TextColumn get name => text()();
  TextColumn get nameEN => text()();
  //country id
  IntColumn get countryId => integer()();
}

@DataClassName('Country')
class Countries extends Table {
  @override
  Set<Column> get primaryKey => {id};
  //id
  IntColumn get id => integer()();
  //name
  TextColumn get name => text()();
  TextColumn get nameEN => text()();
}


///ROUTE DATABASES

@DataClassName('Route')
class Routes extends Table {
  @override
  Set<Column> get primaryKey => {id};
  //id uuid (string)
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  //name
  TextColumn get name => text()();
  TextColumn get nameEN => text()();
  //author
  TextColumn get author => text()();
  TextColumn get authorEN => text()();
  //city id
  IntColumn get cityId => integer()();
  //length meters
  IntColumn get lengthMeters => integer()();
  //is paid route
  BoolColumn get idPaidRoute => boolean()();
  //last changed date
  DateTimeColumn get lastChangedDate => dateTime()();
}

@DataClassName('RouteAddress')
class RouteAddresses extends Table {
  @override
  Set<Column> get primaryKey => {routeId, addressId};
  TextColumn get routeId => text()();
  TextColumn get addressId => text()();
}


@DataClassName('RouteCategory')
class RouteCategories extends Table {
  @override
  Set<Column> get primaryKey => {routeId, categoryId};
  TextColumn get routeId => text()();
  IntColumn get categoryId => integer()();
}

@DataClassName('RouteArt')
class RouteArts extends Table {
  @override
  Set<Column> get primaryKey => {routeId, artId};
  TextColumn get routeId => text()();
  TextColumn get artId => text()();
}

///IMAGE DATABASES

@DataClassName('Image')
class Images extends Table {
  @override
  Set<Column> get primaryKey => {id};
  //id uuid (string)
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  //image url
  TextColumn get imageUrl => text()();
}

///CATEGORY DATABASES

@DataClassName('Category')
class Categories extends Table {
  @override
  Set<Column> get primaryKey => {id};
  //id
  IntColumn get id => integer()();
  //name
  TextColumn get name => text()();
  TextColumn get nameEN => text()();
}


///LINK DATABASES

@DataClassName('Link')
class Links extends Table {
  @override
  Set<Column> get primaryKey => {id};
  //id uuid (string)
  TextColumn get id => text().clientDefault(() => _uuid.v4())();
  //url
  TextColumn get url => text()();
  //title
  TextColumn get title => text()();
  TextColumn get titleEN => text()();
}

///TAG DATABASES

@DataClassName('Tag')
class Tags extends Table {
  @override
  Set<Column> get primaryKey => {id};
  //id
  IntColumn get id => integer()();
  //tag
  TextColumn get tag => text()();
  TextColumn get tagEN => text()();
}


@DriftDatabase(
  tables: [
    //author
    Authors,
    AuthorTags,
    AuthorLinks,
    //art
    Arts,
    ArtWorks,
    ArtCategories,
    //news
    NewsPapers,
    NewsPaperImages,
    NewsPaperAddresses,
    //partner
    Partners,
    PartnerImages,
    PartnerCategories,
    //route
    Routes,
    RouteArts,
    RouteAddresses,
    RouteCategories,
    //location
    Addresses,
    Cities,
    Countries,
    //image
    Images,
    //category
    Categories,
    //link
    Links,
    //tag
    Tags,
  ],
)
class PublicArtDB extends _$PublicArtDB {
  PublicArtDB() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  ///AUTHOR CRUD
  Stream<List<Author>> get watchAllAuthors => select(authors).watch();
  Future<List<Author>> get getAllAuthors => select(authors).get();
  Future<Author> getAuthorById(String id) => (select(authors)..where((a) => a.id.equals(id))).getSingle();
  Future insertAuthor(Author author)=> into(authors).insert(author);
  Future updateAuthor(Author author)=> update(authors).replace(author);
  Future deleteAuthor(Author author)=> delete(authors).delete(author);
  //author tags
  Stream<List<AuthorTag>> get watchAllAuthorTags => select(authorTags).watch();
  Future<List<AuthorTag>> get getAllAuthorTags => select(authorTags).get();
  Future<AuthorTag> getAuthorTagById(String id) => (select(authorTags)..where((a) => a.authorId.equals(id))).getSingle();
  Future<List<AuthorTag>> getAuthorTagsById(String id) => (select(authorTags)..where((a) => a.authorId.equals(id))).get();
  Future insertAuthorTag(AuthorTag authorTag)=> into(authorTags).insert(authorTag);
  Future updateAuthorTag(AuthorTag authorTag)=> update(authorTags).replace(authorTag);
  Future deleteAuthorTag(AuthorTag authorTag)=> delete(authorTags).delete(authorTag);
  //author links
  Stream<List<AuthorLink>> get watchAllAuthorLinks => select(authorLinks).watch();
  Future<List<AuthorLink>> get getAllAuthorLinks => select(authorLinks).get();
  Future<AuthorLink> getAuthorLinkById(String id) => (select(authorLinks)..where((a) => a.authorId.equals(id))).getSingle();
  Future insertAuthorLink(AuthorLink authorLink)=> into(authorLinks).insert(authorLink);
  Future updateAuthorLink(AuthorLink authorLink)=> update(authorLinks).replace(authorLink);
  Future deleteAuthorLink(AuthorLink authorLink)=> delete(authorLinks).delete(authorLink);


  ///ART CRUD
  Stream<List<Art>> get watchAllArts => select(arts).watch();
  Future<List<Art>> get getAllArts => select(arts).get();
  Future<Art> getArtById(String id) => (select(arts)..where((a) => a.id.equals(id))).getSingle();
  Future insertArt(Art art)=> into(arts).insert(art);
  Future updateArt(Art art)=> update(arts).replace(art);
  Future deleteArt(Art art)=> delete(arts).delete(art);
  //art works
  Stream<List<ArtWork>> get watchAllArtWorks => select(artWorks).watch();
  Future<List<ArtWork>> get getAllArtWorks => select(artWorks).get();
  Future<ArtWork> getArtWorkById(String id) => (select(artWorks)..where((a) => a.authorId.equals(id))).getSingle();
  Future<List<ArtWork>> getArtWorksById(String authorId) => (select(artWorks)..where((a) => a.authorId.equals(authorId))).get();
  Future insertArtWork(ArtWork artwork)=> into(artWorks).insert(artwork);
  Future updateArtWork(ArtWork artwork)=> update(artWorks).replace(artwork);
  Future deleteArtWork(ArtWork artwork)=> delete(artWorks).delete(artwork);
  //art categories
  Stream<List<ArtCategory>> get watchAllArtCategories => select(artCategories).watch();
  Future<List<ArtCategory>> get getAllArtCategories => select(artCategories).get();
  Future<ArtCategory> getArtCategoryById(String id) => (select(artCategories)..where((a) => a.artId.equals(id))).getSingle();
  Future insertArtCategory(ArtCategory artCategory)=> into(artCategories).insert(artCategory);
  Future updateArtCategory(ArtCategory artCategory)=> update(artCategories).replace(artCategory);
  Future deleteArtCategory(ArtCategory artCategory)=> delete(artCategories).delete(artCategory);


  ///NEWS CRUD
  Stream<List<NewsPaper>> get watchAllNewsPapers => select(newsPapers).watch();
  Future<List<NewsPaper>> get getAllNewsPapers => select(newsPapers).get();
  Future<NewsPaper> getNewsPaperById(String id) => (select(newsPapers)..where((a) => a.id.equals(id))).getSingle();
  Future insertNewsPaper(NewsPaper newsPaper)=> into(newsPapers).insert(newsPaper);
  Future updateNewsPaper(NewsPaper newsPaper)=> update(newsPapers).replace(newsPaper);
  Future deleteNewsPaper(NewsPaper newsPaper)=> delete(newsPapers).delete(newsPaper);
  //news images
  Stream<List<NewsPaperImage>> get watchAllNewsPaperImages => select(newsPaperImages).watch();
  Future<List<NewsPaperImage>> get getAllNewsPaperImages => select(newsPaperImages).get();
  Future<NewsPaperImage> getNewsPaperImageById(String id) => (select(newsPaperImages)..where((a) => a.newsPaperId.equals(id))).getSingle();
  Future insertNewsPaperImage(NewsPaperImage newsPaperImage)=> into(newsPaperImages).insert(newsPaperImage);
  Future updateNewsPaperImage(NewsPaperImage newsPaperImage)=> update(newsPaperImages).replace(newsPaperImage);
  Future deleteNewsPaperImage(NewsPaperImage newsPaperImage)=> delete(newsPaperImages).delete(newsPaperImage);
  //news addresses
  Stream<List<NewsPaperAddress>> get watchAllNewsPaperAddresses => select(newsPaperAddresses).watch();
  Future<List<NewsPaperAddress>> get getAllNewsPaperAddresses => select(newsPaperAddresses).get();
  Future<NewsPaperAddress> getNewsPaperAddressById(String id) => (select(newsPaperAddresses)..where((a) => a.newsPaperId.equals(id))).getSingle();
  Future insertNewsPaperAddress(NewsPaperAddress newsPaperAddress)=> into(newsPaperAddresses).insert(newsPaperAddress);
  Future updateNewsPaperAddress(NewsPaperAddress newsPaperAddress)=> update(newsPaperAddresses).replace(newsPaperAddress);
  Future deleteNewsPaperAddress(NewsPaperAddress newsPaperAddress)=> delete(newsPaperAddresses).delete(newsPaperAddress);


  ///PARTNER CRUD
  Stream<List<Partner>> get watchAllPartners => select(partners).watch();
  Future<List<Partner>> get getAllPartners => select(partners).get();
  Future<Partner> getPartnerById(String id) => (select(partners)..where((a) => a.id.equals(id))).getSingle();
  Future insertPartner(Partner partner)=> into(partners).insert(partner);
  Future updatePartner(Partner partner)=> update(partners).replace(partner);
  Future deletePartner(Partner partner)=> delete(partners).delete(partner);
  //partner images
  Stream<List<PartnerImage>> get watchAllPartnerImages => select(partnerImages).watch();
  Future<List<PartnerImage>> get getAllPartnerImages => select(partnerImages).get();
  Future<List<PartnerImage>> getPartnerImagesById(String id) => (select(partnerImages)..where((a) => a.partnerId.equals(id))).get();
  Future insertPartnerImage(PartnerImage partnerImage)=> into(partnerImages).insert(partnerImage);
  Future updatePartnerImage(PartnerImage partnerImage)=> update(partnerImages).replace(partnerImage);
  Future deletePartnerImage(PartnerImage partnerImage)=> delete(partnerImages).delete(partnerImage);
  //partner categories
  Stream<List<PartnerCategory>> get watchAllPartnerCategories => select(partnerCategories).watch();
  Future<List<PartnerCategory>> get getAllPartnerCategories => select(partnerCategories).get();
  Future insertPartnerCategory(PartnerCategory partnerCategory)=> into(partnerCategories).insert(partnerCategory);
  Future updatePartnerCategory(PartnerCategory partnerCategory)=> update(partnerCategories).replace(partnerCategory);
  Future deletePartnerCategory(PartnerCategory partnerCategory)=> delete(partnerCategories).delete(partnerCategory);


  ///ROUTE CRUD
  Stream<List<Route>> get watchAllRoutes => select(routes).watch();
  Future<List<Route>> get getAllRoutes => select(routes).get();
  Future<Route> getRouteById(String id) => (select(routes)..where((route) => route.id.equals(id))).getSingle();
  Future insertRoute(Route route)=> into(routes).insert(route);
  Future updateRoute(Route route)=> update(routes).replace(route);
  Future deleteRoute(Route route)=> delete(routes).delete(route);
  //route art
  Stream<List<RouteArt>> get watchAllRouteArts => select(routeArts).watch();
  Future<List<RouteArt>> get getAllRouteArts => select(routeArts).get();
  Future<List<RouteArt>> getRouteArtsById(String id) => (select(routeArts)..where((routeArt) => routeArt.routeId.equals(id))).get();
  Future insertRouteArt(RouteArt routeArt)=> into(routeArts).insert(routeArt);
  Future updateRouteArt(RouteArt routeArt)=> update(routeArts).replace(routeArt);
  Future deleteRouteArt(RouteArt routeArt)=> delete(routeArts).delete(routeArt);
  //route addresses
  Stream<List<RouteAddress>> get watchAllRouteAddresses => select(routeAddresses).watch();
  Future<List<RouteAddress>> get getAllRouteAddresses => select(routeAddresses).get();
  Future<List<RouteAddress>> getRouteAddressesById(String id) => (select(routeAddresses)..where((routeAddress) => routeAddress.routeId.equals(id))).get();
  Future insertRouteAddress(RouteAddress routeAddress)=> into(routeAddresses).insert(routeAddress);
  Future updateRouteAddress(RouteAddress routeAddress)=> update(routeAddresses).replace(routeAddress);
  Future deleteRouteAddress(RouteAddress routeAddress)=> delete(routeAddresses).delete(routeAddress);
  //route categories
  Stream<List<RouteCategory>> get watchAllRouteCategories => select(routeCategories).watch();
  Future<List<RouteCategory>> get getAllRouteCategories => select(routeCategories).get();
  Future<List<RouteCategory>> getCategoriesById(String id) => (select(routeCategories)..where((routeCategory) => routeCategory.routeId.equals(id))).get();
  Future insertRouteCategories(RouteCategory routeCategory)=> into(routeCategories).insert(routeCategory);
  Future updateRouteCategories(RouteCategory routeCategory)=> update(routeCategories).replace(routeCategory);
  Future deleteRouteCategories(RouteCategory routeCategory)=> delete(routeCategories).delete(routeCategory);


  ///LOCATION CRUD
  Stream<List<Address>> get watchAllAddresses => select(addresses).watch();
  Future<List<Address>> get getAllAddresses => select(addresses).get();
  Future<Address> getAddressById(String id) => (select(addresses)..where((address) => address.id.equals(id))).getSingle();
  Future insertAddress(Address address)=> into(addresses).insert(address);
  Future updateAddress(Address address)=> update(addresses).replace(address);
  Future deleteAddress(Address address)=> delete(addresses).delete(address);
  //cities
  Stream<List<City>> get watchAllCities => select(cities).watch();
  Future<List<City>> get getAllCities => select(cities).get();
  Future<City> getCityById(int id) => (select(cities)..where((city) => city.id.equals(id))).getSingle();
  Future insertCity(City city)=> into(cities).insert(city);
  Future updateCity(City city)=> update(cities).replace(city);
  Future deleteCity(City city)=> delete(cities).delete(city);
  //countries
  Stream<List<Country>> get watchAllCountries => select(countries).watch();
  Future<List<Country>> get getAllCountries => select(countries).get();
  Future<Country> getCountryById(int id) => (select(countries)..where((country) => country.id.equals(id))).getSingle();
  Future insertCountry(Country country)=> into(countries).insert(country);
  Future updateCountry(Country country)=> update(countries).replace(country);
  Future deleteCountry(Country country)=> delete(countries).delete(country);


  ///IMAGE CRUD
  Stream<List<Image>> get watchAllImages => select(images).watch();
  Future<List<Image>> get getAllImages => select(images).get();
  Future<Image> getImageById(String id) => (select(images)..where((image) => image.id.equals(id))).getSingle();
  Future insertImage(Image image)=> into(images).insert(image);
  Future updateImage(Image image)=> update(images).replace(image);
  Future deleteImage(Image image)=> delete(images).delete(image);

  ///CATEGORY CRUD
  Stream<List<Category>> get watchAllCategories => select(categories).watch();
  Future<List<Category>> get getAllCategories => select(categories).get();
  Future<Category> getCategoryById(int id) => (select(categories)..where((category) => category.id.equals(id))).getSingle();
  Future insertCategory(Category category)=> into(categories).insert(category);
  Future updateCategory(Category category)=> update(categories).replace(category);
  Future deleteCategory(Category category)=> delete(categories).delete(category);

  ///LINK CRUD
  Stream<List<Link>> get watchAllLinks => select(links).watch();
  Future<List<Link>> get getAllLinks => select(links).get();
  Future<Link> getLinkById(String id) => (select(links)..where((link) => link.id.equals(id))).getSingle();
  Future insertLink(Link link)=> into(links).insert(link);
  Future updateLink(Link link)=> update(links).replace(link);
  Future deleteLink(Link link)=> delete(links).delete(link);

  ///TAG CRUD
  Stream<List<Tag>> get watchAllTags => select(tags).watch();
  Future<List<Tag>> get getAllTags => select(tags).get();
  Future<Tag> getTagById(int id) => (select(tags)..where((tag) => tag.id.equals(id))).getSingle();
  Future<List<Tag>> getTagsById(int id) => (select(tags)..where((tag) => tag.id.equals(id))).get();
  Future insertTag(Tag tag)=> into(tags).insert(tag);
  Future updateTag(Tag tag)=> update(tags).replace(tag);
  Future deleteTag(Tag tag)=> delete(tags).delete(tag);

}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = './databases';
    final file = File(path.join(dbFolder, 'public_art_db.sqlite'));
    return NativeDatabase(file);
  });
}
