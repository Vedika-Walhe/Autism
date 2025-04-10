import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE parents (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          email TEXT UNIQUE NOT NULL,
          password TEXT NOT NULL
      )
    ''');

    await db.execute('''
      CREATE TABLE therapists (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        email TEXT UNIQUE,
        password TEXT
      )
    ''');
  }

  // Check if an email exists in the specified table
  Future<bool> emailExistsInRole(String email, String role) async {
    final db = await database;
    final result = await db.query(role, where: 'email = ?', whereArgs: [email]);
    return result.isNotEmpty;
  }

  // Register a parent
  Future<void> registerParent(String email, String password) async {
    final db = await database;

    // Check for existing email
    if (await emailExistsInRole(email, 'parents')) {
      throw Exception('Email already registered as a Parent!');
    }

    // Insert new parent record with full name
    await db.insert('parents', {
      'email': email,
      'password': password,
    });
  }

  // Register a therapist
  Future<void> registerTherapist(String email, String password) async {
    final db = await database;

    // Check for existing email
    if (await emailExistsInRole(email, 'therapists')) {
      throw Exception("Email already registered as a Therapist!");
    }

    // Insert new therapist record
    await db.insert('therapists', {'email': email, 'password': password});
  }

  // Authenticate Parent Login
  Future<bool> loginParent(String email, String password) async {
    final db = await database;
    final result = await db.query(
      'parents',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }

  // Authenticate Therapist Login
  Future<bool> loginTherapist(String email, String password) async {
    final db = await database;
    final result = await db.query(
      'therapists',
      where: 'email = ? AND password = ?',
      whereArgs: [email, password],
    );
    return result.isNotEmpty;
  }
}
