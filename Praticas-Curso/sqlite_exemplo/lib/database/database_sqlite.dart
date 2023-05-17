import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSqLite {
  Future<Database> openConnection() async {
    var databasePath = await getDatabasesPath();
    final databaseFinalPath = join(databasePath, 'SQLITE_EXAMPLE');

    return await openDatabase(
      databaseFinalPath,
      version: 2,
      onConfigure: (db) async {
        await db.execute('PRAGMA foreign_keys = ON');
      },

      onCreate: (Database db, int version) {
        final batch = db.batch();

        batch.execute('''
          create table teste(
            id Integer primary key autoincrement,
            nome varchar(200)
          )
        ''');

        batch.execute('''
          create table produto(
            id Integer primary key autoincrement,
            nome varchar(200)
          )
        ''');

        batch.commit();
      },
      onUpgrade: (Database db, int oldVersion, int version) {
        final batch = db.batch();

        if (oldVersion == 1) {
          batch.execute('''
            create table produto(
              id Integer primary key autoincrement,
              nome varchar(200)
            )
          ''');
        }

        batch.commit();
      },
      onDowngrade: (Database db, int oldVersion, int version) {
        final batch = db.batch();

        if (oldVersion == 3) {
          batch.execute('''
            drop table categoria
          ''');
        }

        batch.commit();
      },
    );
  }
}
