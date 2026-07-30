import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:i_dent_client/core/index.dart';
import 'package:i_dent_client/features/ai_assistant/data/repositories/chat_service.dart';
import 'package:i_dent_client/features/ai_assistant/data/repositories/dtos/get_session_dto.dart';
import 'package:i_dent_client/features/index.dart';

import '../models/index.dart';
import '../repositories/dtos/create_session_dto.dart';

class CurrentSessionNotifier extends Notifier<SessionModel?> {
  @override
  SessionModel? build() => null;

  Future<void> createSession({required String title}) async {
    final response = await getIt.get<ChatService>().createSession(
        dto: CreateSessionDto(
            title: title, userId: "ced37e12-d324-4678-b3fc-d4fc229e6345"));

    if (response is SessionModel) {
      state = response as SessionModel;
    }
  }

  void setCurrentSession({required SessionModel session}) {
    state = session;
  }
}

final currentSessionProvider =
    NotifierProvider<CurrentSessionNotifier, SessionModel?>(() {
  return CurrentSessionNotifier();
});

final recentSessionsProvider =
    FutureProvider.autoDispose<List<SessionModel>>((ref) async {
  final response = await getIt.get<ChatService>().getRecentSessions();

  return response.fold(
    (failure) {
      return <SessionModel>[];
    },
    (sessions) => sessions,
  );
});

final selectedSessionIdProvider = StateProvider<String?>((ref) => null);

final sessionMessagesProvider =
    FutureProvider.autoDispose<List<MessageModel>>((ref) async {
  final sessionId = ref.watch(selectedSessionIdProvider);
  
  if (sessionId == null) return [];

  final response = await getIt.get<ChatService>().getSession(
      dto: GetSessionDto(
          sessionId: sessionId,
          userId: 'ced37e12-d324-4678-b3fc-d4fc229e6345'));

  return response.fold((failure) => throw failure.message , (messages) => messages);
});
