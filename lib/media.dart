enum MediaType{
  book,
  movie,
  music,
}

abstract class Media {
  final MediaType type; // enum
  final String title;
  final int duration;

  Media(
    this.type,
    this.title,
    this.duration,
  );

  String get name;
}
