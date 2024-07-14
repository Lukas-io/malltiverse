import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:malltiverse/config/constants.dart';

class NetworkError extends StatelessWidget {
  const NetworkError({
    super.key,
    required this.error,
    required this.onTryAgain,
  });

  final String error;

  final void Function() onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.wifi_slash,
                color: kPrimaryColor.withOpacity(0.4),
                size: 100.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: const Text(
                  'Try Again!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                error.replaceAll('Exception: ', ''),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                onPressed: onTryAgain,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor.withOpacity(0.7),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Retry',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
