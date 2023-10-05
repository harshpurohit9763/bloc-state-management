import 'package:bloc_practice/reqresApi/get/bloc/media_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListOfAllUsersScreen extends StatefulWidget {
  const ListOfAllUsersScreen({super.key});

  @override
  State<ListOfAllUsersScreen> createState() => _ListOfAllUsersScreenState();
}

class _ListOfAllUsersScreenState extends State<ListOfAllUsersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<MediaBloc>().add(FetchUsersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MediaBloc, MediaState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            context.read<MediaBloc>().add(ClearCounterEvent());
            return true;
          },
          child: Scaffold(
            body: state is FetchUsersState
                ? Center(
                    child: ListView.builder(
                      itemCount: state.user.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 4.h, horizontal: 8.w),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.r),
                            child: Container(
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    colors: [
                                      Color(0xFF6499E9),
                                      Color(0xFF9EDDFF),
                                      Color(0xFFA6F6FF),
                                      Color(0xFFBEFFF7),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12.r),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image(
                                      loadingBuilder:
                                          (context, child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return const CircularProgressIndicator();
                                        }
                                      },
                                      image: NetworkImage(
                                        state.user[index].avatar,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5.w),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              "USER ID: ${state.user[index].id.toString()}"),
                                          Text(
                                              "USER NAME: ${state.user[index].firstName.toUpperCase()} ${state.user[index].lastName.toUpperCase()}"),
                                          Text(
                                              "EMAIL ID: ${state.user[index].email}"),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        );
                      },
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
            floatingActionButton: state is FetchUsersState
                ? FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        context.read<MediaBloc>().add(UpdateCounterEvent());
                      });
                    },
                    child: Icon(Icons.add),
                  )
                : null,
          ),
        );
      },
    );
  }
}
