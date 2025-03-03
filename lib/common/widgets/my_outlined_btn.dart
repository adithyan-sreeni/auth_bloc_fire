import 'package:flutter/material.dart';

class MyOutlinedButton extends StatelessWidget {
  // final String assetLocation;
  final Function()? onTap;
  final String label;

  const MyOutlinedButton({super.key, required this.onTap, required this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(17),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
          border: Border.all(color: Color.fromARGB(255, 80, 60, 150)),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.asset(assetLocation, height: 20),
              // Image.network(
              //   'https://w7.pngwing.com/pngs/326/85/png-transparent-google-logo-google-text-trademark-logo.png',
              //   // color: Colors.white,
              //   height: 20,
              // ),
              const SizedBox(width: 10),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
