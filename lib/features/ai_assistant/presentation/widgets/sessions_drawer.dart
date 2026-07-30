import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i_dent_client/core/colors/app_colors.dart';
import 'package:i_dent_client/core/colors/app_font_styles.dart';
import 'package:i_dent_client/features/ai_assistant/data/index.dart';
import 'package:i_dent_client/features/ai_assistant/presentation/widgets/add_session_popup.dart';
import 'package:i_dent_client/features/ai_assistant/presentation/widgets/session_item.dart';

class SessionsDrawer extends ConsumerStatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const SessionsDrawer({super.key, required this.scaffoldKey});

  @override
  ConsumerState<SessionsDrawer> createState() => _SessionsDrawerState();
}

class _SessionsDrawerState extends ConsumerState<SessionsDrawer> {
  String? helSessionId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sessions = ref.watch(recentSessionsProvider);
    final sessionNotifier = ref.watch(currentSessionProvider.notifier);

    return Drawer(
        child: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "المحادثات الأخيرة :",
                      style: AppFontStyles.sectionTitle,
                    ),
                    Expanded(
                        child: sessions.when(
                            loading: () => const Center(
                                child: CircularProgressIndicator()),
                            error: (error, stack) => Center(
                                child: Text("Fetching sessions error: $error")),
                            data: (sessions) {
                              return ListView.builder(
                                itemCount: sessions.length,
                                itemBuilder: (context, index) {
                                  return SessionItem(
                                    session: sessions[index],
                                    isHeld: helSessionId == sessions[index].id,
                                    onLongPress: () {
                                      setState(() {
                                        helSessionId = sessions[index].id;
                                      });
                                    },
                                    onTap: () {
                                      if (helSessionId != null) {
                                        setState(() {
                                          helSessionId = null;
                                        });
                                        return;
                                      }
                                      sessionNotifier.setCurrentSession(
                                          session: sessions[index]);
                                      ref
                                          .read(selectedSessionIdProvider
                                              .notifier)
                                          .state = sessions[index].id;
                                      Navigator.of(context).pop();
                                    },
                                  );
                                },
                              );
                            })),
                    InkWell(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            gradient: AppColors.gradientCard,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text("بدأ محادثة جديدة",
                              style: AppFontStyles.label
                                  .copyWith(color: Colors.white)),
                        ),
                      ),
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                  child: AddSessionPopup(
                                onSuccess: () => widget.scaffoldKey.currentState
                                    ?.closeDrawer(),
                              ));
                            });
                      },
                    )
                  ],
                ))));
  }
}
