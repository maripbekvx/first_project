import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/src/common/models/tokens_model.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'log_in_event.dart';
part 'log_in_state.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super(LogInInitial());

  final Dio dio = Dio();
  final Box tokensBox = Hive.box('tokens');

  @override
  Stream<LogInState> mapEventToState(
    LogInEvent event,
  ) async* {
    if (event is LogInPressed) {
      yield LogInLoading();

      try {
        Response response = await dio.post(
          'http://api.codeunion.kz/api/v1/auth/login',
          data: {
            'email': event.email,
            'password': event.password,
          },
        );

        TokensModel tokensModel = TokensModel.fromJson(
          response.data['tokens'],
        );

        tokensBox.put('access', tokensModel.access);
        tokensBox.put('refresh', tokensModel.refresh);

        yield LogInLoaded();
      } on DioError catch (e) {
        yield LogInFailed(message: 'Неправильный логин или пароль');
        throw e;
      } catch (e) {
        yield LogInFailed(message: 'Произошла ошибка');
        throw e;
      }
    }
  }
}
