import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_poc/blocs/message_bloc.dart';
import 'package:flutter_bloc_poc/states/message_error_state.dart';
import 'package:flutter_bloc_poc/states/message_loaded_state.dart';
import 'package:flutter_bloc_poc/states/message_loading_state.dart';
import 'package:flutter_bloc_poc/states/message_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('bloc'),
      ),
      body: _buildMessageComponent(),
    );
  }

  _buildMessageComponent() {
    return BlocBuilder<MessageBloc, MessageState>(
      builder: (context, state) {
        if (state is MessageLoadingState) {
          return const Center(
              child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ));
        } else if (state is MessageLoadedState) {
          return Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
            tileColor: Colors.black,
            textColor: Colors.white,
            contentPadding: const EdgeInsets.all(10),
            title: Text(state.data.author ?? ''),
            subtitle: Text(state.data.message ?? ''),
          ),
              ));
        } else if (state is MessageErrorState) {
          return Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
            tileColor: Colors.black,
            textColor: Colors.white,
            contentPadding: const EdgeInsets.all(10),
            title: Text(state.bundle.errorCode),
            subtitle: Text(state.bundle.errorMessage),
          ),
              ));
        }
        return Container();
      },
    );
  }
}
