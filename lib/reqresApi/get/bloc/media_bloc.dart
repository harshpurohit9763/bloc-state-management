import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:bloc_practice/reqresApi/get/model/user_model.dart';
import 'package:bloc_practice/reqresApi/res_req.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  int counter = 1;
  List<Datum> users = [];
  List<Datum> allDataList = [];
  MediaBloc() : super(MediaInitial()) {
    on<FetchUsersEvent>(fetchListOfUserDataEvent);
    on<UpdateCounterEvent>(updateCounter);
    on<ClearCounterEvent>(clearCounter);
  }
  FutureOr<void> fetchListOfUserDataEvent(FetchUsersEvent event, emit) async {
    final client = http.Client();

    try {
      final res = await client
          .get(Uri.parse("https://reqres.in/api/users?page=$counter"));

      Map<String, dynamic> decodedData = jsonDecode(res.body);
      UserDataModel userDataModel = UserDataModel.fromJson(decodedData);
      users = userDataModel.data;
      for (int i = 0; i < users.length; i++) {
        allDataList.add(users[i]);
      }

      print("HELLO WORLD");
      emit(FetchUsersState(allDataList, counter));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  FutureOr<void> updateCounter(UpdateCounterEvent event, emit) async {
    if (counter < 2) {
      try {
        counter++;
        print("THIS IS THE VALUE OF THE COUNTER : $counter");
        final fetchEvent = FetchUsersEvent();
        add(fetchEvent);
      } catch (e) {
        EasyLoading.showError(e.toString());
      }
    } else {
      EasyLoading.showError("No More Pages");
    }
  }

  FutureOr<void> clearCounter(ClearCounterEvent event, emit) async {
    counter = 0;
    emit(ClearCounterState());
    print("BYE WORLD");
  }
}
