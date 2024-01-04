import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_poc/events/fetch_message_event.dart';
import 'package:flutter_bloc_poc/events/message_event.dart';
import 'package:flutter_bloc_poc/models/model/random_message_model.dart';
import 'package:flutter_bloc_poc/resources/api/common/error_bundle.dart';
import 'package:flutter_bloc_poc/resources/repository/message_repository.dart';
import 'package:flutter_bloc_poc/resources/repository/message_repository_impl.dart';
import 'package:flutter_bloc_poc/resources/repository/remote_client/message_remote_client.dart';
import 'package:flutter_bloc_poc/states/message_error_state.dart';
import 'package:flutter_bloc_poc/states/message_loaded_state.dart';
import 'package:flutter_bloc_poc/states/message_loading_state.dart';
import 'package:flutter_bloc_poc/states/message_state.dart';

class MessageBloc extends Bloc<MessageEvent, MessageState> {
  late Timer timer;
  final MessageRepository _repository =
      MessageRepositoryImpl(MessageRemoteClientImpl());

  void init() {
    add(FetchMessageEvent());
    timer = Timer.periodic(const Duration(seconds: 5), (_) {
      add(FetchMessageEvent());
    });
  }

  MessageBloc() : super(MessageLoadingState()) {
    on<FetchMessageEvent>(onFetchMessage);
    init();
  }

  FutureOr<void> onFetchMessage(
      FetchMessageEvent event, Emitter<MessageState> emit) async {
    try {
      final result = await fetchRandomMessage();
      emit(MessageLoadedState(result));
    } catch (e) {
      if (e is ErrorBundle) {
        emit(MessageErrorState(e));
      } else {
        emit(MessageErrorState(ErrorBundle("1000", "Something went wrong!")));
      }
    }
  }

  Future<RandomMessageModel> fetchRandomMessage() async {
    return _repository.getRandomMessage();
  }

  @override
  Future<void> close() {
    timer.cancel();
    return super.close();
  }


}
