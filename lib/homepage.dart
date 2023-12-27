import 'package:bloc_learn_two/signinpage/signin_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const Expanded(
              flex: 12,
              child: Center(
                  child: Text(
                "Example",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 60,
                    fontWeight: FontWeight.w700),
              ))),
          Expanded(
              flex: 1,
              child: Center(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SignInPage()));
                      },
                      child: const Text("Login")))),
          Expanded(
              flex: 1,
              child: Center(
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text("Login")))),
        ],
      ),
    ));
  }
}
