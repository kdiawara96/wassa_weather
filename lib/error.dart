import 'package:flutter/material.dart';

class errorPage extends StatelessWidget {
  const errorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.black45),
      child: const Center(
        child: Text(
          "Location not found....",
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 50, color: Colors.red),
        ),
      ),
    );
  }
}
