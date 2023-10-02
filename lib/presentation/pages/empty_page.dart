import 'package:flutter/material.dart';

class EmptyPage extends StatelessWidget {
  const EmptyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.hourglass_empty_rounded,
          ),
          SizedBox(
            height: 35,
          ),
          Text("Tidak ada data"),
        ],
      ),
    );
  }
}
