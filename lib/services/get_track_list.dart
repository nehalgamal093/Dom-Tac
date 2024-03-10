import 'package:on_audio_query/on_audio_query.dart';

class SongsList {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  Future<List<SongModel>> getLists() async {
    List<SongModel> query = await _audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
        ignoreCase: true);

    return query;
  }
}
