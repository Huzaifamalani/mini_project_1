import 'package:e_commerce_app/screens/home_screen/home_screen.dart';
import 'package:e_commerce_app/styles/colors.dart';
import 'package:flutter/material.dart';


class Custom1stButton extends StatelessWidget {
  const Custom1stButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: CustColors.black10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ));
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Get Started',style: TextStyle(color: Colors.black),),
          const Icon(
            Icons.arrow_forward,
            color: Color(0xff1E222B),
          ),
        ],
      ),
    );
  }
}
