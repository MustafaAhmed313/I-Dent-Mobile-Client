import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:i_dent_client/core/index.dart';
import 'package:i_dent_client/features/ai_assistant/data/repositories/chat_service.dart';
import 'package:i_dent_client/features/ai_assistant/data/repositories/dtos/send_message_dto.dart';

import '../models/index.dart';
import 'session_providers.dart';

List<MessageModel> messages = [
  MessageModel(role: MessageRole.model, content: """
أهلاً دكتور 👋 أنا مساعدك الذكي. تقدر تسألني عن:
• عروض الأدوات والأجهزة
• معلومات طبية مبنية على أبحاث
• حالة المخزون
    """),
];

class ChatNotifier extends Notifier<List<MessageModel>> {
  @override
  List<MessageModel> build() {
    return messages;
  }

  void loadSession(List<MessageModel> history) {
    state = history.isEmpty ? messages : history;
  }

  void sendPrompt(String content) {
    state = [
      ...state,
      MessageModel(role: MessageRole.user, content: content),
      MessageModel(role: MessageRole.model, content: '')
    ];
  }

  void appendChunk(String chunk) {
    final last = state.last;
    state = [
      ...state.sublist(0, state.length - 1),
      MessageModel(role: last.role, content: last.content + chunk),
    ];
  }

  void setDefault() {
    state = messages;
  }
}


final chatStreamProvider = StreamProvider.autoDispose<String>((ref) async* {
  
  final prompt = ref.watch(currentPromptProvider);
  final sessionId = ref.watch(selectedSessionIdProvider);

  if (prompt == null || sessionId == null || prompt.trim().isEmpty) return;
  
  final stream = getIt.get<ChatService>().sendMessage(
    dto: SendMessageDto(
      message: prompt,
      sessionId: sessionId,
      userId: 'ced37e12-d324-4678-b3fc-d4fc229e6345',
    ),
  );

  await for (final chunk in stream) {
    yield chunk;
  }
});

final chatProvider = NotifierProvider<ChatNotifier, List<MessageModel>>(() {
  return ChatNotifier();
});

final currentPromptProvider = StateProvider<String?>((ref) => null);
