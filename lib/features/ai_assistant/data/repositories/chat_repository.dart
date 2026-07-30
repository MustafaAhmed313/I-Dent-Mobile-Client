import 'package:dartz/dartz.dart';
import 'package:i_dent_client/core/errors/faliures.dart';
import 'package:i_dent_client/features/ai_assistant/data/repositories/dtos/index.dart';
import 'package:i_dent_client/features/index.dart';

import 'dtos/get_session_dto.dart';

abstract class ChatRepository {
  Stream<String> sendMessage({required SendMessageDto dto});

  Future<Either<Failure, SessionModel>> createSession({required CreateSessionDto dto});

  Future<Either<Failure, List<SessionModel>>> getRecentSessions();

  Future<Either<Failure, List<MessageModel>>> getSession({required GetSessionDto dto});
}
