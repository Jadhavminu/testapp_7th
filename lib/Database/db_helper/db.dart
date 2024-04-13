import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDb {
  late Database db;

  Future<void> open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');
    print(path);

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
                CREATE TABLE IF NOT EXISTS students( 
                    id INTEGER PRIMARY KEY, 
                    name TEXT NOT NULL, 
                    roll_no INTEGER NOT NULL, 
                    address TEXT NOT NULL
                )
            ''');
        print("Table Created");
      },
    );
  }

  Future<Map<String, dynamic>?> getStudent(int rollno) async {
    await open(); // Ensure that the database is opened before performing operations
    List<Map<String, dynamic>> maps =
    await db.query('students', where: 'roll_no = ?', whereArgs: [rollno]);
    if (maps.length > 0) {
      return maps.first;
    }
    return null;
  }
}