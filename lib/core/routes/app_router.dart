export 'app_router.dart';

import 'package:go_router/go_router.dart';
import 'package:i_dent_client/core/index.dart';
import 'package:i_dent_client/features/auth/presentation/views/login_view.dart';
import 'package:i_dent_client/features/index.dart';

final GoRouter appRouter = GoRouter(
  routes: [
    GoRoute(path: "/", builder: (context, state) => const LoginView()),
    GoRoute(
        path: AppRoutes.chatbotControlsView,
        builder: (context, state) => ChatbotControlsView()),
    GoRoute(
        path: AppRoutes.chatbotControlsView,
        builder: (context, state) => ChatbotControlsView()),
  ],
);
