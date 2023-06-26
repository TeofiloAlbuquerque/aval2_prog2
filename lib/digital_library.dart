import 'dart:convert';
import 'dart:io';
import 'package:diglib/audiobook.dart';
import 'package:diglib/media.dart';
import 'package:diglib/movie.dart';
import 'package:diglib/music.dart';
import 'package:diglib/utils.dart';

class DigitalLibrary {
  List<Media> mediaList = [];
  void addMedia(Media media) {
    mediaList.add(media);
  }

  void loadMedia(String mediaFileName) {
    final file = File(mediaFileName);
    final contents = file.readAsStringSync();
    final mediaData = jsonDecode(contents);

    for (final data in mediaData) {
      final type = data['type'];
      final title = data['title'];
      final name = data['name'];
      final duration = data['duration'];

      if (type == MediaType.book) {
        addMedia(Audiobook(type, title, name, duration));
      } else if (type == MediaType.movie) {
        addMedia(Movie(type, title, name, duration));
      } else if (type == MediaType.music) {
        addMedia(Music(type, title, name, duration));
      }
    }

  }

  void listMedia([MediaType? mediaType]) {
    tabPrint('TIPO\tTÍTULO\tNOME\tDURAÇÃO(MIN)');

    for (var media in mediaList) {
      if (mediaType == null || media.type == mediaType) {
        tabPrint(
            '${media.type}\t${media.title}\t${media.name}\t${media.duration}');
      }
    }
  }

  int totalMediaDuration([MediaType? mediaType]) {
    int totalDuration = 0;

    for (var media in mediaList) {
      if (mediaType == null || media.type == mediaType) {
        totalDuration += media.duration;
      }
    }
    return totalDuration;
  }
}
