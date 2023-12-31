import 'package:flutter/material.dart';

class RoundBtnWidget extends StatelessWidget {
  final bool loading;
  final String title;
  final VoidCallback onTap;
  RoundBtnWidget({super.key, required this.title,required this.onTap,this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
            color: Colors.deepPurple, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: loading ? const CircularProgressIndicator(color: Colors.white,strokeWidth: 3,) : Text(
            title,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
