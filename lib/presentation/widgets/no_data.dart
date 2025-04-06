import 'package:flutter/material.dart';

class NoDataWidget extends StatefulWidget {
  const NoDataWidget({super.key});

  @override
  State<NoDataWidget> createState() => _NoDataWidgetState();
}

class _NoDataWidgetState extends State<NoDataWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
