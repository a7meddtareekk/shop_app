// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/Combonants/Combonant.dart';

import '../Registration/Registration.dart';

class LoginScreen extends StatelessWidget {
  static final ROUTE_NAME = 'LoginScreen';
  var emailController= TextEditingController();
  var passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('LOGIN',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                Text('login now to browse our hot offers ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                SizedBox(height: 30,),
                DefultFormField(
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    lable: 'Email Address',
                    validate: (String value){
                      if(value.isEmpty){
                        return 'please enter email address';
                      }
                    },
                    Prefix: Icons.email_outlined,
                ),
                SizedBox(height: 20,),
                DefultFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    Suffix: Icons.visibility_outlined,
                    lable: 'Password',
                    validate: (String value){
                      if(value.isEmpty){
                        return 'please enter password';
                      }
                    },
                    Prefix: Icons.lock_outline,
                ),
                SizedBox(height: 40,),
                Container(
                  color: Colors.deepOrange,
                    width: double.infinity,
                    child: MaterialButton(onPressed: (){},child: Text('LOGIN',style: TextStyle(color: Colors.white),),)),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('do you have account ?'),
                    DefultTextButton(
                        function: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()));
                        },
                        text:'Registration'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
