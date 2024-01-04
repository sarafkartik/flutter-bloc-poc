import 'package:flutter_bloc_poc/models/model/random_message_model.dart';
import 'package:flutter_bloc_poc/resources/repository/message_repository.dart';
import 'package:flutter_bloc_poc/resources/repository/remote_client/message_remote_client.dart';

class MessageRepositoryImpl extends MessageRepository {
  final MessageRemoteClient _messageRemoteClient;

  MessageRepositoryImpl(this._messageRemoteClient);

  @override
  Future<RandomMessageModel> getRandomMessage() =>
      _messageRemoteClient.getRandomMessage();
}
