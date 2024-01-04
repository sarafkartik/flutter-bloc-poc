import 'dart:async';
import 'package:flutter_bloc_poc/models/model/random_message_model.dart';
import 'package:flutter_bloc_poc/resources/mapper/random_message_mapper.dart';
import 'package:flutter_bloc_poc/resources/repository/remote_client/base_remote_client.dart';

abstract class MessageRemoteClient {
  Future<RandomMessageModel> getRandomMessage();
}

class MessageRemoteClientImpl extends BaseRemoteClient
    implements MessageRemoteClient {
  @override
  Future<RandomMessageModel> getRandomMessage() {
    return apiClient
        .getRandomMessage()
        .then((value) => RandomMessageMapper().map(value))
        .catchError(handleError<RandomMessageModel>);
  }
}
