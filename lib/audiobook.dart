import 'package:diglib/media.dart';

class Audiobook extends Media {
  final String author;

  Audiobook(
    super.type,
    super.title,
    super.duration,
    this.author,
  );

  String get name => author;
}
