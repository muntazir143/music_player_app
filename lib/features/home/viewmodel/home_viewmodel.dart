import 'dart:io';
import 'dart:ui';

import 'package:fpdart/fpdart.dart';
import 'package:music_player_app/core/providers/current_user_notifier.dart';
import 'package:music_player_app/core/utils.dart';
import 'package:music_player_app/features/home/repositories/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_viewmodel.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  late HomeRepository _homeRepository;

  @override
  AsyncValue? build() {
    _homeRepository = ref.watch(homeRepositoryProvider);
    return null;
  }

  Future<void> uploadSong(
      {required File selectedAudio,
      required File selectedThumbnail,
      required String songName,
      required String artistName,
      required Color selectedColor}) async {
    state = const AsyncValue.loading();
    final res = await _homeRepository.uploadSong(
        selectedAudio: selectedAudio,
        selectedThumbnail: selectedThumbnail,
        songName: songName,
        artistName: artistName,
        hexCode: rgbToHex(selectedColor),
        token: ref.read(currentUserNotifierProvider)!.token);

    final val = switch (res) {
      Left(value: final l) => state =
          AsyncValue.error(l.message, StackTrace.current),
      Right(value: final r) => state = AsyncValue.data(r),
    };
    print(val);
  }
}
