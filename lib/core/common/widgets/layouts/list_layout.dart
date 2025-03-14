import 'package:flutter/material.dart';

class ListLayout extends StatelessWidget {
  const ListLayout(
      {super.key,
      required this.itemBuilder,
      required this.seperatorBuilder,
      required this.scrollDirection,
      required this.itemCount,
      this.physics});
  final Widget? Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int) seperatorBuilder;
  final Axis scrollDirection;
  final int itemCount;
  final ScrollPhysics? physics;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: physics,
        shrinkWrap: true,
        scrollDirection: scrollDirection,
        itemBuilder: itemBuilder,
        separatorBuilder: seperatorBuilder,
        itemCount: itemCount);
  }
}
