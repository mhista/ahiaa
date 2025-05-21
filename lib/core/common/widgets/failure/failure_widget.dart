import 'package:flutter/material.dart';

class FailureWidget extends StatelessWidget {
  const FailureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No Data Found!',
        style: Theme.of(context).textTheme.bodyMedium!.apply(
          color: Colors.white,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
