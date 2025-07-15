import 'package:freezed_annotation/freezed_annotation.dart';
import '../appwrite/match_model.dart';

part 'live_match_state.freezed.dart';
part 'live_match_state.g.dart';

@freezed
class LiveMatchState with _$LiveMatchState {
  const factory LiveMatchState({
    String? currentMatch,
    @Default(false) bool isLive,
    @Default({}) Map<String, dynamic> matchData,
    @Default(false) bool isLoading,
    String? error,
  }) = _LiveMatchState;

  factory LiveMatchState.fromJson(Map<String, dynamic> json) => _$LiveMatchStateFromJson(json);
} 