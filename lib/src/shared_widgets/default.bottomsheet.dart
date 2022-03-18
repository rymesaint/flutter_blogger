import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DefaultBottomSheet extends StatelessWidget {
  final List<Widget> children;
  const DefaultBottomSheet({Key? key, required this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      child: VStack(children),
    )
        .p20()
        .box
        .white
        .withConstraints(const BoxConstraints(
          maxHeight: 740,
        ))
        .topRounded(value: 16)
        .make();
  }
}
