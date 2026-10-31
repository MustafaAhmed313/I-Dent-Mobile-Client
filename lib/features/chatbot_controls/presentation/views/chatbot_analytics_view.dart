import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:i_dent_client/core/index.dart';
import 'package:i_dent_client/features/chatbot_controls/presentation/widgets/analytics_grid.dart';
import 'package:i_dent_client/features/chatbot_controls/presentation/widgets/index.dart';
import 'package:i_dent_client/features/chatbot_controls/presentation/widgets/switch_tile.dart';

class ChatbotAnalyticsView extends StatefulWidget {
  const ChatbotAnalyticsView({super.key});

  @override
  State<ChatbotAnalyticsView> createState() => _ChatbotAnalyticsViewState();
}

class _ChatbotAnalyticsViewState extends State<ChatbotAnalyticsView> {
  bool _isAutoReservation = false;
  bool _isPreConfirmation = false;
  bool _isAppointmentReminded = false;
  bool _isAIAnswered = false;
  bool _isAudioConverted = false;
  bool _isOnlinePaid = false;
  bool _isSendLocation = false;
  bool _isSendInvoice = false;
  bool _isGoogleRated = false;
  bool _isAbsentPatients = false;
  bool _isMultilingualReplied = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 120),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: 200, child: AnalyticsGrid()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Text(
                "⚡ المميزات السريعة",
                style: AppFontStyles.sectionTitle,
              ),
              Padding(
                padding: EdgeInsets.only(
                  right: 10,
                ),
                child: Column(
                  spacing: 10,
                  children: [
                    SwitchTile(
                        description: "البوت يفتح المواعيد المتاحة و يحجز",
                        icon: FontAwesomeIcons.calendar,
                        title: "حجز تلقائي للمواعيد",
                        value: _isAutoReservation,
                        onChanged: (value) {
                          setState(() {
                            _isAutoReservation = !_isAutoReservation;
                          });
                        }),
                    SwitchTile(
                        description: "رسالة تأكيد + اعادة جدولة",
                        icon: FontAwesomeIcons.check,
                        title: "تأكيد الموعد قبل بيوم",
                        value: _isPreConfirmation,
                        onChanged: (value) {
                          setState(() {
                            _isPreConfirmation = !_isPreConfirmation;
                          });
                        }),
                    SwitchTile(
                        description: "تذكير ذكي بالموقع",
                        icon: FontAwesomeIcons.bell,
                        title: "تذكير قبل الموعد بساعة",
                        value: _isAppointmentReminded,
                        onChanged: (value) {
                          setState(() {
                            _isAppointmentReminded = !_isAppointmentReminded;
                          });
                        }),
                    SwitchTile(
                        description: "اجابات مبدئية مع توجيه للعيادات",
                        icon: FontAwesomeIcons.brain,
                        title: "ردود AI على الأسئلة الطبية",
                        value: _isAIAnswered,
                        onChanged: (value) {
                          setState(() {
                            _isAIAnswered = !_isAIAnswered;
                          });
                        }),
                    SwitchTile(
                        description: "يفهم الرسائل الصوتية تلقائيا",
                        icon: FontAwesomeIcons.message,
                        title: "تحوبل الرسائل الصوتية لنص",
                        value: _isAudioConverted,
                        onChanged: (value) {
                          setState(() {
                            _isAudioConverted = !_isAudioConverted;
                          });
                        })
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 20,
            children: [
              Text(
                "🚀 مميزات اضافية مقترحة",
                style: AppFontStyles.sectionTitle,
              ),
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Column(
                  spacing: 10,
                  children: [
                    SwitchTile(
                        description: "البوت يرسل لينك دفع لتأكيد الحجز",
                        icon: FontAwesomeIcons.creditCard,
                        title: "دفع العربون أونلاين",
                        value: _isOnlinePaid,
                        onChanged: (value) {
                          setState(() {
                            _isOnlinePaid = !_isOnlinePaid;
                          });
                        }),
                    SwitchTile(
                        description: "Google Maps تلقائيا عند الحجز",
                        icon: FontAwesomeIcons.mapLocationDot,
                        title: "ارسال موقع العيادة",
                        value: _isSendLocation,
                        onChanged: (value) {
                          setState(() {
                            _isSendLocation = !_isSendLocation;
                          });
                        }),
                    SwitchTile(
                        description: "PDF + تعليمات ما بعد العلاج",
                        icon: FontAwesomeIcons.dollarSign,
                        title: "ارسال فاتورة + ملاحظات بعد الزيارة",
                        value: _isSendInvoice,
                        onChanged: (value) {
                          setState(() {
                            _isSendInvoice = !_isSendInvoice;
                          });
                        }),
                    SwitchTile(
                        description: "بعد 24 ساعة من الزيارة",
                        icon: FontAwesomeIcons.star,
                        title: "طلب تقييم Google تلقائيا",
                        value: _isGoogleRated,
                        onChanged: (value) {
                          setState(() {
                            _isGoogleRated = !_isGoogleRated;
                          });
                        }),
                    SwitchTile(
                        description: "رسالة تلقائية بعد 6 شهور",
                        icon: FontAwesomeIcons.microphoneLines,
                        title: "اعادة تفعيل المرضى الغايبين",
                        value: _isAbsentPatients,
                        onChanged: (value) {
                          setState(() {
                            _isAbsentPatients = !_isAbsentPatients;
                          });
                        }),
                    SwitchTile(
                        description: "عربي / انجليزي حسب لغة المريض",
                        icon: FontAwesomeIcons.language,
                        title: "ردود متعددة اللغات",
                        value: _isMultilingualReplied,
                        onChanged: (value) {
                          setState(() {
                            _isMultilingualReplied = !_isMultilingualReplied;
                          });
                        })
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
