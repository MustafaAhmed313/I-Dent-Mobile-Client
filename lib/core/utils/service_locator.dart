import 'package:get_it/get_it.dart';
import 'package:i_dent_client/core/index.dart';
import 'package:i_dent_client/features/ai_assistant/data/repositories/chat_service.dart';

export 'service_locator.dart';

final getIt = GetIt.instance;

void setupServices() {
  getIt.registerSingleton<DioHelper>(DioHelper());

  getIt.registerSingleton<ChatService>(ChatService(dio: getIt.get<DioHelper>()));
}
