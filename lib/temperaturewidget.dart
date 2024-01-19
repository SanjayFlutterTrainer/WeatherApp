import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TempWidget extends StatelessWidget {
  const TempWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(style: TextStyle(color: Colors.white),'data'),
          Lottie.network(height: 65,'https://lottie.host/59e3b996-54ce-4cfd-96ab-0e79f289b9a6/Wc11ri6BR3.json'
          ),
          Text(style: TextStyle(color: Colors.white),'27°')
        ],
      ),
    );
  }
}
