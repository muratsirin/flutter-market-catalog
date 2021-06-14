import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = 'favorites.db';
  static final _databaseVersion = 1;

  static final _favoriteTable = 'favorite';
  static final _colID = 'id';
  static final _colCatalogDocumentID = 'catalogDocumentID';
  static final _colCatalogName = 'catalogName';
  static final _colCatalogImageURL = 'catalogImageURL';
  static final _colCatalogFileURL = 'catalogFileURL';
  static final _colMarketName = 'marketName';

  static Database _database;
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();

    return _database;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path + _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE $_favoriteTable($_colID INTEGER PRIMARY KEY AUTOINCREMENT, $_colCatalogDocumentID TEXT, $_colCatalogName TEXT, $_colCatalogImageURL TEXT, $_colCatalogFileURL TEXT, $_colMarketName TEXT)',
    );
  }
}
