import 'package:flutter/material.dart';

import 'curved_edge2.dart';

class PCurvedProductWidget extends StatelessWidget {
  const PCurvedProductWidget({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: CustomShapeClipper(), child: child);
  }
}
