import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:bytebank/database/dao/contact_dao.dart';

Future<Database> createDatabase() async {
  final String dbPath = await getDatabasesPath();
  final String path = join(dbPath, ContactDao.dataBase);

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tableCreate);
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
  );

  /*
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    final String query =
        'CREATE TABLE contacts(id INTEGER PRIMARY KEY, name TEXT, account_number INTEGER)';

    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(query);
      },
      version: 1,
      // onDowngrade: onDatabaseDowngradeDelete,
    );
  });
  */
}
