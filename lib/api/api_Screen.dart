import 'package:bloc_practice/api/bloc/api_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ApiScreen extends StatefulWidget {
  const ApiScreen({super.key});

  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ApiBloc>().add(FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiBloc, ApiState>(
      builder: (context, state) {
        return Scaffold(
          body: state is ApiFetchedState
              ? ListView.builder(
                  itemCount: state.productList.length,
                  itemBuilder: (ctx, index) {
                    return Center(
                      child: Text(state.productList[index].title),
                    );
                  })
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
