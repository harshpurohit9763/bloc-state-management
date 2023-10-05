import 'package:bloc_practice/api/api_Screen.dart';
import 'package:bloc_practice/home/bloc/home_bloc.dart';
import 'package:bloc_practice/reqresApi/res_req.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              return Text(state.counter.toString());
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(IncrementEvent());
                  },
                  child: const Text("Increment it ")),
              ElevatedButton(
                  onPressed: () {
                    context.read<HomeBloc>().add(DecrementEvent());
                  },
                  child: const Text("Decrement it ")),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ApiScreen(),
                  ));
            },
            child: const Text("Go to Api Page"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReqResScreen(),
                  ));
            },
            child: const Text("REQ RES API"),
          )
        ],
      ),
    ));
  }
}
