
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'image_model.dart';



class ImageDatabaseHelper {
  static final ImageDatabaseHelper instance = ImageDatabaseHelper._init();
  static Database? _database;

  ImageDatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('videos.db');
    return _database!;
  }

  Future<Database> _initDB(String dbName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, dbName);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
     await db.execute('''
      CREATE TABLE images(id INTEGER PRIMARY KEY AUTOINCREMENT, path TEXT)
    ''');
  }

  /// video
  Future<void> insertVideo(String path, String verseName) async {
    final db = await database;

    // final thumbnail = await VideoThumbnail.thumbnailFile(
    //   video: path,
    //   thumbnailPath: (await getTemporaryDirectory()).path,
    //   imageFormat: ImageFormat.JPEG,
    //   maxHeight: 64,
    //   quality: 25,
    // );

    await db.insert('videos', {'path': path});
  }


  /// images
 Future<void> insertImage(String path) async {
    final db = await database;
    await db.insert('images', {'path': path});
  }

  Future<List<ImageModel>> getImageWithVerseNames() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('images');

    return List.generate(maps.length, (index) {
      return ImageModel(
        id: maps[index]['id'],
        path: maps[index]['path'],
      );
    });
  }


  Future<void> deleteImage(int id) async {
    final db = await database;
    await db.delete('images', where: 'id = ?', whereArgs: [id]);
  }


}
