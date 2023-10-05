import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/reqresApi/post/model/created_user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;

part 'create_user_event.dart';
part 'create_user_state.dart';

class CreateUserBloc extends Bloc<CreateUserEvent, CreateUserState> {
  CreateUserBloc() : super(CreateUserInitial()) {
    on<CreateUserRequestEvent>(createNewUser);
    on<ResetEvent>(resetState);
  }

  FutureOr<void> createNewUser(CreateUserRequestEvent event, emit) async {
    if (event.name.isEmpty || event.password.isEmpty) {
      EasyLoading.showError("Please Enter the data");
    } else {
      var client = await http.post(
        Uri.parse("https://reqres.in/api/users"),
        body: <String, String>{
          'name': event.name,
          'job': event.password,
        },
      );
      var data = jsonDecode(client.body);
      CreatedUserDataModel createdUserDataModel =
          CreatedUserDataModel.fromJson(data);

      emit(CreateUserRequestState(client.toString(), createdUserDataModel));
      if (client.reasonPhrase == "created") {
        debugPrint("THIS IS THE STSTUS CODE OF THE API");
        debugPrint(client.reasonPhrase);
        EasyLoading.showSuccess(client.reasonPhrase.toString());
      } else {
        EasyLoading.showError(client.reasonPhrase.toString());
      }

      // final fetchEvent = ResetEvent();
      // add(fetchEvent);
    }
  }

  FutureOr<void> resetState(ResetEvent event, emit) {
    emit(CreateUserInitial());
  }
}
