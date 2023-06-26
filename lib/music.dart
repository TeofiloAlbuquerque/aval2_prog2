import 'package:diglib/media.dart';

class Music extends Media {
  final String artist;

  Music(
    super.type,
    super.title,
    super.duration,
    this.artist,
  );

  String get name => artist;
}
