import 'package:bloc_practice/reqresApi/post/create_new_user.dart';
import 'package:bloc_practice/reqresApi/get/list_of_user.dart';
import 'package:flutter/material.dart';

class ReqResScreen extends StatelessWidget {
  const ReqResScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateNewUserScreen(),
                    ));
              },
              child: const Text("CREATE USER SCREEN"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ListOfAllUsersScreen(),
                    ));
              },
              child: const Text("LIST OF USER SCREEN"),
            )
          ],
        ),
      ),
    );
  }
}
