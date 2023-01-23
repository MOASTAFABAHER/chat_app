import 'package:chat_app/components/my__text.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:chat_app/utils/app_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatItem extends StatelessWidget {
  String email;
  String? reciverUId;
  String? registerUId;
  String? senderUId;
  ChatItem(
      {required this.email,
      required this.reciverUId,
      required this.registerUId,
      required this.senderUId});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        AppNavigator.appNavigator(
            context,
            ChatScreen(
              registerUId: registerUId,
              senderUId: senderUId,
              name: email,
              reciverId: reciverUId,
            ));
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
                'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=1060&t=st=1671055612~exp=1671056212~hmac=d3c01128fbb8f2a834d4d588172c7efac29e513eef3974136b2c45c439548cff'),
          ),
          SizedBox(
            width: 20.w,
          ),
          MyText(
            text: email,
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
          )
        ],
      ),
    );
  }
}
