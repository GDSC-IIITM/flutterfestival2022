import 'package:flutter/material.dart';
import 'package:flutter_festival/screens/todos.dart';

class Landing extends StatelessWidget {
  const Landing({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/images/landing.png",
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'TaskIt',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xffd76542),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Not your traditional TODO App',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 60,
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: ((context) => const TodoScreen()),
              ),
            );
          },
          child: const Text('Get Started'),
          style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: const Color(0xffd76542),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
        ),
      ],
    );
  }
}
