import 'package:e_wallet_app/login/service/login_service.dart';
import 'package:e_wallet_app/wallet/bloc/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/constants.dart';
import '../wallet/wallet_list.dart';
import '../common/common_button.dart';
import '../common/glassmorphic.dart';
import '../common/textinput.dart';
import 'model/users_model.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Register"), backgroundColor: Colors.indigo, foregroundColor: Colors.white,),
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
                  Text(StringConst.register,
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
                    title: StringConst.register,
                    onPress: ()async {

                     Map response  =await  LoginService.insertExpense(Users(email: emailController.text , password: password.text));
                     print(response);
                     if(response["status"]){
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
                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response["message"])));

                     }

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
