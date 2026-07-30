import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_dent_client/core/index.dart';
import 'package:i_dent_client/features/index.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class MessageInput extends ConsumerStatefulWidget {
  const MessageInput({super.key});

  @override
  ConsumerState<MessageInput> createState() => _MessageInputState();
}

class _MessageInputState extends ConsumerState<MessageInput> {
  late final TextEditingController _messageController;
  late final FocusNode _messageFocus;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _messageFocus = FocusNode();
  }

  @override
  void dispose() {
    _messageFocus.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void handleSend(WidgetRef ref) {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;
    ref.read(chatProvider.notifier).sendPrompt(text);
    ref.read(currentPromptProvider.notifier).state = text;
    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final streamState = ref.watch(chatStreamProvider);
    final prompt = ref.watch(currentPromptProvider);
    final isStreaming = prompt != null && (streamState.isLoading || streamState.isRefreshing);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          spacing: 10,
          children: [
            InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: isStreaming ? null : () {
                handleSend(ref);
              },
              child: CircleAvatar(
                backgroundColor: AppColors.primary,
                radius: 25,
                child: isStreaming ? SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                  color: Colors.white,
                ),) : Icon(
                  LucideIcons.send,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
            Expanded(
              child: Form(
                child: TextFormField(
                  autofocus: false,
                  minLines: 1,
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hint: Text(
                      "اسأل عن أي حاجة...",
                      style: AppFontStyles.label
                          .copyWith(color: Colors.grey.shade400),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.grey.shade300),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  ),
                  cursorColor: Colors.black,
                  controller: _messageController,
                  focusNode: _messageFocus,
                  validator: (value) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
