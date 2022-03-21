import 'package:flutter/material.dart';

class RefundRow extends StatelessWidget {
  final String refundString;
  const RefundRow({Key? key, required this.refundString}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          refundString,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Theme.of(context).primaryColorDark),
        ),
      ),
    );
  }
}
