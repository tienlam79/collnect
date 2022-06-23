import 'package:flutter/material.dart';
import 'package:omny_business/modules/auth/auth.dart';
import 'package:omny_business/shared/shared.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  final AuthController controller = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: CommonWidget.appBar(
            context,
            'Sign Up',
            Icons.arrow_back,
            Colors.white,
          ),
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 35.0),
            child: _buildForms(context),
          ),
        ),
      ],
    );
  }

  Widget _buildForms(BuildContext context) {
    return Form(
      key: controller.registerFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [],
        ),
      ),
    );
  }
}
