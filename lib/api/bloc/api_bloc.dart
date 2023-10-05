import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/api/model/api_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<FetchDataEvent>(postInitialFetchEvent);
  }

  FutureOr<void> postInitialFetchEvent(FetchDataEvent event, emit) async {
    final client = http.Client();
    List<Product> list = [];
    try {
      final response =
          await client.get(Uri.parse("https://dummyjson.com/products"));
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      // for (int i = 0; i < jsonData.length; i++) {
      PostModel postModel = PostModel.fromJson(jsonData);
      list = postModel.products;
      // list.add(postModel);
      // print(postModel.products);
      // }
      emit(ApiFetchedState(list));
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
