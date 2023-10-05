import 'dart:ffi';

import 'package:bloc_practice/reqresApi/post/bloc/create_user_bloc.dart';
import 'package:bloc_practice/reqresApi/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewUserScreen extends StatelessWidget {
  const CreateNewUserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateUserBloc, CreateUserState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            context.read<CreateUserBloc>().add(ResetEvent());
            return true;
          },
          child: Scaffold(
              body: Center(
                  child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: state is CreateUserInitial
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        txtcontroller: state.name,
                        text: "Enter name",
                        prefixIcon: const Icon(Icons.person),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomTextFormField(
                        txtcontroller: state.password,
                        text: "Enter Password",
                        prefixIcon: const Icon(Icons.person),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.read<CreateUserBloc>().add(
                              CreateUserRequestEvent(
                                  name: state.name.text,
                                  password: state.password.text));
                        },
                        child: const Text("Create User"),
                      ),
                    ],
                  )
                : state is CreateUserRequestState
                    ? Center(
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("ID: ${state.userdata.id}"),
                          Text("PASSWORD: ${state.userdata.job}"),
                          Text("NAME: ${state.userdata.name}"),
                          Text(
                              "CREATED ON: ${state.userdata.createdAt.toString()}"),
                          ElevatedButton(
                            onPressed: () {
                              context.read<CreateUserBloc>().add(ResetEvent());
                            },
                            child: const Text("Create New User"),
                          ),
                        ],
                      ))
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
          ))),
        );
      },
    );
  }
}
