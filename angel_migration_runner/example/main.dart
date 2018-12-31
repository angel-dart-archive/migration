import 'package:angel_migration/angel_migration.dart';
import 'package:angel_model/angel_model.dart';
import 'package:angel_orm/angel_orm.dart';
import 'package:angel_serialize/angel_serialize.dart';
part 'main.g.dart';

@serializable
@orm
abstract class _Book extends Model {
   String get title;

   int get pageCount;

   String get genre;
}