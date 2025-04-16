import 'package:flutter/material.dart';
import 'package:intuji_infogrid/src/src.dart';
import 'package:provider/provider.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomMaterialButton(
        onPressed: () {
          context.read<LoginProvider>().logout(context);
        },
        text: 'Logout',
      ),
    );
  }
}
