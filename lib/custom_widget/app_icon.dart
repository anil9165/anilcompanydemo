import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppIconWidget extends StatelessWidget {
  const AppIconWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Text("anildemo",
          style: GoogleFonts.fredokaOne(fontSize: 40.0, color:Colors.white)),
    );
  }
}
