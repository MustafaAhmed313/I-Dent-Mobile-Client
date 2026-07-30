export './ai_assisstant_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_dent_client/core/index.dart';
import 'package:i_dent_client/features/ai_assistant/presentation/widgets/sessions_drawer.dart';
import 'package:i_dent_client/features/index.dart';
import '../widgets/index.dart';

class AiAssisstantView extends ConsumerWidget {
  AiAssisstantView({super.key});

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final chat = ref.watch(chatProvider);

    ref.listen(sessionMessagesProvider, (previous, next) {
      next.whenData((messages) {
          ref.read(chatProvider.notifier).loadSession(messages);
        });
    });

    return Scaffold(
      key: _key,
      drawer: SessionsDrawer(scaffoldKey: _key),
      appBar: AppBar(
        surfaceTintColor: AppColors.background,
        backgroundColor: AppColors.background,
        shape: Border.all(color: Colors.grey.shade200),
        title: const Text(
          'المساعد الذكي',
          style: AppFontStyles.display,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(right: 20, left: 20, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (chat.length  == 1)
                const GradiantBanner(),
              const SessionMessages(),
              const MessageInput(),
            ],
          ),
        ),
      ),
    );
  }
}
