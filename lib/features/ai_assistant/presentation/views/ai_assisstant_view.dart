export './ai_assisstant_view.dart';

import 'package:flutter/material.dart';
import 'package:i_dent_client/core/index.dart';
import '../widgets/index.dart';
import '../../data/index.dart';

class AiAssistantView extends StatefulWidget {
  const AiAssistantView({super.key});

  @override
  State<AiAssistantView> createState() => _AiAssistantViewState();
}

class _AiAssistantViewState extends State<AiAssistantView> {
  final TextEditingController _messageController = TextEditingController();

  List<MessageModel> messages = [
    MessageModel(
      role: MessageRole.model,
      content: """
أهلاً دكتور 👋 أنا مساعدك الذكي. تقدر تسألني عن:
• عروض الأدوات والأجهزة
• معلومات طبية مبنية على أبحاث
• حالة المخزون
    """
    ),
    MessageModel(role: MessageRole.user, content: """إيه أحدث عروض الكومبوزيت؟"""),
    MessageModel(
      role: MessageRole.model,
      content: """لقيتلك 3 عروض حالياً:
🦷 3M Filtek Z350 — 1,250 ج (خصم 14%)
🦷 Tetric N-Ceram — 980 ج
🦷 Estelite Sigma — 1,680 ج

عايز أضيف أي منهم لقائمة الشراء؟   """
    ),
    MessageModel(
      role: MessageRole.model,
      content: """
أهلاً دكتور 👋 أنا مساعدك الذكي. تقدر تسألني عن:
• عروض الأدوات والأجهزة
• معلومات طبية مبنية على أبحاث
• حالة المخزون
    """
    ),
    MessageModel(role: MessageRole.user, content: """إيه أحدث عروض الكومبوزيت؟"""),
    MessageModel(
      role: MessageRole.model,
      content: """لقيتلك 3 عروض حالياً:
🦷 3M Filtek Z350 — 1,250 ج (خصم 14%)
🦷 Tetric N-Ceram — 980 ج
🦷 Estelite Sigma — 1,680 ج

عايز أضيف أي منهم لقائمة الشراء؟   """
    ),
    MessageModel(
      role: MessageRole.model,
      content: """
أهلاً دكتور 👋 أنا مساعدك الذكي. تقدر تسألني عن:
• عروض الأدوات والأجهزة
• معلومات طبية مبنية على أبحاث
• حالة المخزون
    """
    ),
    MessageModel(role: MessageRole.user, content: """إيه أحدث عروض الكومبوزيت؟"""),
    MessageModel(
      role: MessageRole.model,
      content: """لقيتلك 3 عروض حالياً:
🦷 3M Filtek Z350 — 1,250 ج (خصم 14%)
🦷 Tetric N-Ceram — 980 ج
🦷 Estelite Sigma — 1,680 ج

عايز أضيف أي منهم لقائمة الشراء؟   """
    ),
    MessageModel(
      role: MessageRole.model,
      content: """
أهلاً دكتور 👋 أنا مساعدك الذكي. تقدر تسألني عن:
• عروض الأدوات والأجهزة
• معلومات طبية مبنية على أبحاث
• حالة المخزون
    """
    ),
    MessageModel(role: MessageRole.user, content: """إيه أحدث عروض الكومبوزيت؟"""),
    MessageModel(
      role: MessageRole.model,
      content: """لقيتلك 3 عروض حالياً:
🦷 3M Filtek Z350 — 1,250 ج (خصم 14%)
🦷 Tetric N-Ceram — 980 ج
🦷 Estelite Sigma — 1,680 ج

عايز أضيف أي منهم لقائمة الشراء؟   """
    ),
    MessageModel(
      role: MessageRole.model,
      content: """
أهلاً دكتور 👋 أنا مساعدك الذكي. تقدر تسألني عن:
• عروض الأدوات والأجهزة
• معلومات طبية مبنية على أبحاث
• حالة المخزون
    """
    ),
    MessageModel(role: MessageRole.user, content: """إيه أحدث عروض الكومبوزيت؟"""),
    MessageModel(
      role: MessageRole.model,
      content: """لقيتلك 3 عروض حالياً:
🦷 3M Filtek Z350 — 1,250 ج (خصم 14%)
🦷 Tetric N-Ceram — 980 ج
🦷 Estelite Sigma — 1,680 ج

عايز أضيف أي منهم لقائمة الشراء؟   """
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const GradiantBanner(),
              Expanded(
                  child: ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        return Align(
                          alignment: messages[index].role == MessageRole.model
                              ? Alignment.topLeft
                              : Alignment.topRight,
                          child: Container(
                            margin: EdgeInsets.only(bottom: 10),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: messages[index].role == MessageRole.model
                                  ? AppColors.background
                                  : AppColors.primary,
                              borderRadius: BorderRadius.circular(25),
                              boxShadow: [SoftShadow()],
                            ),
                            child: Text(
                              messages[index].content,
                              style: AppFontStyles.body.copyWith(
                                  color:
                                      messages[index].role == MessageRole.model
                                          ? Colors.black
                                          : Colors.white),
                            ),
                          ),
                        );
                      })),
              MessageInput(controller: _messageController),
            ],
          ),
        ),
      ),
    );
  }
}
