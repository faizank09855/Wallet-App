import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../wallet/wallet_list.dart';
import '../common/common_button.dart';
import '../common/glassmorphic.dart';
import '../common/textinput.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlassContainer(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                spacing: 16,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(StringConst.login,
                      style: TextStyle(fontSize: 36, color: Color(0xffefefef))),
                  Text(StringConst.email,
                      style: TextStyle(color: Color(0xffefefef))),
                  TextInput(hint: StringConst.emailHint, controller: TextEditingController(),),
                  Text(StringConst.password,
                      style: TextStyle(color: Color(0xffefefef))),
                  TextInput(hint: StringConst.passwordHint, controller: TextEditingController(),),
                  CommonButton(
                    title: StringConst.login,
                    onPress: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => WalletList(),
                          ));
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
