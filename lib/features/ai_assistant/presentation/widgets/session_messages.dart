import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_dent_client/features/ai_assistant/presentation/widgets/message_item.dart';

import '../../data/index.dart';

class SessionMessages extends ConsumerStatefulWidget {
  const SessionMessages({super.key});

  @override
  ConsumerState<SessionMessages> createState() => _SessionMessagesState();
}

class _SessionMessagesState extends ConsumerState<SessionMessages> {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_controller.hasClients) {
      print("Scroll offset: ${_controller.offset}");

      _controller.animateTo(
        _controller.position.minScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final chat = ref.watch(chatProvider).reversed.toList();

    ref.listen(chatStreamProvider, ((previous, next) {
      next.whenData((chunk) {
        ref.read(chatProvider.notifier).appendChunk(chunk);
      });
    }));

    return Expanded(
        child: ListView.builder(
            controller: _controller,
            reverse: true,
            itemCount: chat.length,
            itemBuilder: (context, index) {
              return MessageItem(message: chat[index]);
            }));
  }
}
