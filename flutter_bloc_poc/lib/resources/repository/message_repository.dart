import 'package:flutter_bloc_poc/models/model/random_message_model.dart';

abstract class MessageRepository {
  Future<RandomMessageModel> getRandomMessage();
}
