import 'package:flutter/material.dart';
import 'package:fresh_mart/pages/home_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loadingscreen extends StatefulWidget {
  const Loadingscreen({super.key});

  @override
  State<Loadingscreen> createState() => _LoadingscreenState();
}

class _LoadingscreenState extends State<Loadingscreen> {
  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage('assets/appIcon.png')),
            const SizedBox(height: 20),
            SpinKitFadingCircle(
              itemBuilder: (BuildContext context, int index) {
                return const DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.green,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
