import 'package:e_wallet_app/login/register.dart';
import 'package:e_wallet_app/login/service/login_service.dart';
import 'package:e_wallet_app/wallet/bloc/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/constants.dart';
import '../wallet/wallet_list.dart';
import '../common/common_button.dart';
import '../common/glassmorphic.dart';
import '../common/textinput.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();

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
                  TextInput(hint: StringConst.emailHint,
                    controller: emailController,),
                  Text(StringConst.password,
                      style: TextStyle(color: Color(0xffefefef))),
                  TextInput(hint: StringConst.passwordHint,
                    controller: password,),
                  CommonButton(
                    title: StringConst.login,
                    onPress: () async{
                      final login = await LoginService.login(emailController.text, password.text);
                      print(login.toString());
                      if(login["status"]){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BlocProvider(
                                    create: (context) => WalletBloc(),
                                    child: WalletList(),
                                  ),
                            ));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(login["message"])));
                      }

                    },
                  ) ,
                  Row(children: [
                    Expanded(child: Divider(color: Colors.white,)),
                    Text(" Or " , style: TextStyle(color: Colors.white),) ,
                    Expanded(child: Divider(color: Colors.white,)),
                  ],),
                  CommonButton(
                    title: StringConst.register,
                    onPress: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                RegisterScreen(),
                          ));
                    },
                  ) ,
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
