import 'package:flutter/material.dart';
class imge extends StatefulWidget {
  const imge({super.key});

  @override
  State<imge> createState() => _imgeState();
}

class _imgeState extends State<imge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(image: DecorationImage(image: NetworkImage("https://www.ssr-inc.com/wp-content/uploads/EV-charging-1082x546.jpg"),fit: BoxFit.cover)),
    ));

  }
}