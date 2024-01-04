import 'package:flutter_bloc_poc/models/dto/random_message_dto.dart';
import 'package:flutter_bloc_poc/models/model/random_message_model.dart';
import 'mapper.dart';

class RandomMessageMapper extends Mapper<RandomMessageDto, RandomMessageModel> {
  @override
  RandomMessageModel map(RandomMessageDto input) {
    return RandomMessageModel(input.content, input.authorSlug);
  }
}
