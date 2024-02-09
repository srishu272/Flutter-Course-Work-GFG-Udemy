import 'package:flutter/material.dart';
import 'package:multi_store_app/widgets/appBar_widgets.dart';

class SupplierStaticsScreen extends StatelessWidget {
  const SupplierStaticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: AppBarTitle(
          title: "Statics",
        ),
        leading: AppBarBackButton(),
      ),
    );
  }
}
