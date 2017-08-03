import 'dart:mirrors';

String absoluteSourcePath(Type type) {
  var mirror = reflectType(type);
  return mirror.location.sourceUri.toFilePath();
}