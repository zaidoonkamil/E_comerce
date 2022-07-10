import 'package:e_comerce_app/view/welcome_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:share/share.dart';

import '../core/local_storage_user.dart';
import '../styles/colors.dart';
import '../widgets/custom_button.dart';
import 'auth/login_screen.dart';
import 'auth/resgister_screen.dart';
import 'splash_screen.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0,right: 12,bottom: 12,top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                    child: const Icon( Icons.account_circle, size:100 ,),
                  ),
                  const SizedBox(height: 10,),
                   Text(finalEmail!.toString(),style: const TextStyle(fontWeight: FontWeight.bold)),

                ],
              ),
              const Spacer(),
              Column(
                children: [
                const Padding(
                  padding: EdgeInsets.only(top: 12.0,bottom: 12),
                  child: Divider(height: 1,color: Colors.black54,),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: GestureDetector(
                    onTap: (){
                      Share.share('Check My Flutter App://example.com', subject: 'Look what I made!');
                    },
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      children:  const [
                      Text('Share The App'),
                        Spacer(),
                        Icon(Icons.share),
                    ],),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 12.0,bottom: 12),
                  child: Divider(height: 1,color: Colors.black54,),
                ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text('Favorites'),
                      ],),
                  ),
                  const Padding(
                  padding: EdgeInsets.only(top: 12.0,bottom: 12),
                  child: Divider(height: 1,color: Colors.black54,),
                ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15),
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text('Rate The App'),
                        Spacer(),
                        Icon(Icons.star,color:Colors.yellow,),
                      ],),
                  ),
                  const Padding(
                  padding: EdgeInsets.only(top: 12.0,bottom: 12),
                  child: Divider(height: 1,color: Colors.black54,),
                ),
                  CustomButon(text: 'Log Out',
                  onTap: ()async{
                    try {
                      await FirebaseAuth.instance.signOut();
                      LocalStorageUser.clearUserData();
                      Get.offAll(const WelcomeScreen());
                    } catch (error) {
                      print(error);
                    }
                  },
                  ),
              ],),
            ],
          ),
        ),
      ),
    );
  }
}
