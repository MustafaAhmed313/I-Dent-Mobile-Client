import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:i_dent_client/core/index.dart';
import 'package:i_dent_client/features/ai_assistant/data/index.dart';
import 'package:i_dent_client/features/ai_assistant/data/repositories/dtos/create_session_dto.dart';

class AddSessionPopup extends ConsumerStatefulWidget {
  final VoidCallback? onSuccess;

  const AddSessionPopup({super.key, this.onSuccess});

  @override
  ConsumerState<AddSessionPopup> createState() => _AddSessionPopupState();
}

class _AddSessionPopupState extends ConsumerState<AddSessionPopup> {
  late final TextEditingController _sessionController;
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _sessionController = TextEditingController();
  }

  @override
  void dispose() {
    _sessionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Container(
        padding: EdgeInsets.all(20),
        width: 280,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        spacing: 15,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('عنوان المحادثة', style: AppFontStyles.sectionTitle,),
          Form(
            key: _key,
            child: TextFormField(
              autofocus: false,
              minLines: 1,
              maxLines: 6,
              decoration: InputDecoration(
                hint: Text(
                  "محادثة جديدة",
                  style:
                      AppFontStyles.label.copyWith(color: Colors.grey.shade400),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              ),
              cursorColor: Colors.black,
              controller: _sessionController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'يجب ادخال عنوان للمحادثة!';
                }
                return null;
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 25,
            children: [
              InkWell(
                onTap: () {
                  if (_key.currentState!.validate()) {
                    ref.read(currentSessionProvider.notifier).createSession(title: _sessionController.text);
                    widget.onSuccess?.call();
                    Navigator.pop(context);
                  }
                } ,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 100,
                  height: 35,
                  padding: EdgeInsets.all(10),
                  child: Center(child: Text(
                    "بدأ",
                    style: AppFontStyles.label.copyWith(color: Colors.white),
                  )),
                ),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.destructive,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 100,
                  height: 35,
                  padding: EdgeInsets.all(10),
                  child: Center(child: Text(
                    "الغاء",
                    style: AppFontStyles.label.copyWith(color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
