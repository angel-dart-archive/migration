// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main.dart';

// **************************************************************************
// MigrationGenerator
// **************************************************************************

class BookMigration extends Migration {
  @override
  up(Schema schema) {
    schema.create('books', (table) {
      table.serial('id')..primaryKey();
      table.varChar('title');
      table.integer('page_count');
      table.varChar('genre');
      table.timeStamp('created_at');
      table.timeStamp('updated_at');
    });
  }

  @override
  down(Schema schema) {
    schema.drop('books');
  }
}

// **************************************************************************
// OrmGenerator
// **************************************************************************

class BookQuery extends Query<Book, BookQueryWhere> {
  BookQuery() {
    _where = new BookQueryWhere(this);
  }

  @override
  final BookQueryValues values = new BookQueryValues();

  BookQueryWhere _where;

  @override
  get tableName {
    return 'books';
  }

  @override
  get fields {
    return const [
      'id',
      'title',
      'page_count',
      'genre',
      'created_at',
      'updated_at'
    ];
  }

  @override
  BookQueryWhere get where {
    return _where;
  }

  @override
  BookQueryWhere newWhereClause() {
    return new BookQueryWhere(this);
  }

  static Book parseRow(List row) {
    if (row.every((x) => x == null)) return null;
    var model = new Book(
        id: row[0].toString(),
        title: (row[1] as String),
        pageCount: (row[2] as int),
        genre: (row[3] as String),
        createdAt: (row[4] as DateTime),
        updatedAt: (row[5] as DateTime));
    return model;
  }

  @override
  deserialize(List row) {
    return parseRow(row);
  }
}

class BookQueryWhere extends QueryWhere {
  BookQueryWhere(BookQuery query)
      : id = new NumericSqlExpressionBuilder<int>(query, 'id'),
        title = new StringSqlExpressionBuilder(query, 'title'),
        pageCount = new NumericSqlExpressionBuilder<int>(query, 'page_count'),
        genre = new StringSqlExpressionBuilder(query, 'genre'),
        createdAt = new DateTimeSqlExpressionBuilder(query, 'created_at'),
        updatedAt = new DateTimeSqlExpressionBuilder(query, 'updated_at');

  final NumericSqlExpressionBuilder<int> id;

  final StringSqlExpressionBuilder title;

  final NumericSqlExpressionBuilder<int> pageCount;

  final StringSqlExpressionBuilder genre;

  final DateTimeSqlExpressionBuilder createdAt;

  final DateTimeSqlExpressionBuilder updatedAt;

  @override
  get expressionBuilders {
    return [id, title, pageCount, genre, createdAt, updatedAt];
  }
}

class BookQueryValues extends MapQueryValues {
  int get id {
    return (values['id'] as int);
  }

  set id(int value) => values['id'] = value;
  String get title {
    return (values['title'] as String);
  }

  set title(String value) => values['title'] = value;
  int get pageCount {
    return (values['page_count'] as int);
  }

  set pageCount(int value) => values['page_count'] = value;
  String get genre {
    return (values['genre'] as String);
  }

  set genre(String value) => values['genre'] = value;
  DateTime get createdAt {
    return (values['created_at'] as DateTime);
  }

  set createdAt(DateTime value) => values['created_at'] = value;
  DateTime get updatedAt {
    return (values['updated_at'] as DateTime);
  }

  set updatedAt(DateTime value) => values['updated_at'] = value;
  void copyFrom(Book model) {
    values.addAll({
      'title': model.title,
      'page_count': model.pageCount,
      'genre': model.genre,
      'created_at': model.createdAt,
      'updated_at': model.updatedAt
    });
  }
}

// **************************************************************************
// JsonModelGenerator
// **************************************************************************

@generatedSerializable
class Book extends _Book {
  Book(
      {this.id,
      this.title,
      this.pageCount,
      this.genre,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final String title;

  @override
  final int pageCount;

  @override
  final String genre;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  Book copyWith(
      {String id,
      String title,
      int pageCount,
      String genre,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new Book(
        id: id ?? this.id,
        title: title ?? this.title,
        pageCount: pageCount ?? this.pageCount,
        genre: genre ?? this.genre,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  bool operator ==(other) {
    return other is _Book &&
        other.id == id &&
        other.title == title &&
        other.pageCount == pageCount &&
        other.genre == genre &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return hashObjects([id, title, pageCount, genre, createdAt, updatedAt]);
  }

  Map<String, dynamic> toJson() {
    return BookSerializer.toMap(this);
  }
}

// **************************************************************************
// SerializerGenerator
// **************************************************************************

abstract class BookSerializer {
  static Book fromMap(Map map) {
    return new Book(
        id: map['id'] as String,
        title: map['title'] as String,
        pageCount: map['page_count'] as int,
        genre: map['genre'] as String,
        createdAt: map['created_at'] != null
            ? (map['created_at'] is DateTime
                ? (map['created_at'] as DateTime)
                : DateTime.parse(map['created_at'].toString()))
            : null,
        updatedAt: map['updated_at'] != null
            ? (map['updated_at'] is DateTime
                ? (map['updated_at'] as DateTime)
                : DateTime.parse(map['updated_at'].toString()))
            : null);
  }

  static Map<String, dynamic> toMap(_Book model) {
    if (model == null) {
      return null;
    }
    return {
      'id': model.id,
      'title': model.title,
      'page_count': model.pageCount,
      'genre': model.genre,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class BookFields {
  static const List<String> allFields = const <String>[
    id,
    title,
    pageCount,
    genre,
    createdAt,
    updatedAt
  ];

  static const String id = 'id';

  static const String title = 'title';

  static const String pageCount = 'page_count';

  static const String genre = 'genre';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}
