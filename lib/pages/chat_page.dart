import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/blocs/selection_cubit.dart';
import 'package:portfolio/blocs/toggle_cubit.dart';
import 'package:portfolio/constants/app_color.dart';
import 'package:portfolio/constants/app_font.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/models/message_model.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  final TextEditingController chatController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Chat Here',
          style: AppFont.bold(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[200],
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 75),
              child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance.collection('Chats').orderBy('date', descending: true).snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.docs.isNotEmpty) {
                      List<MessageModel> messages = <MessageModel>[];
                      for (var doc in snapshot.data!.docs) {
                        final newMessage = MessageModel.fromJson(doc.data());
                        messages.add(newMessage);
                        log(newMessage.text!);
                      }
                      return ListView(
                        reverse: true,
                        //mainAxisAlignment: MainAxisAlignment.end,
                        children: List.generate(messages.length, (index) {
                          var f = DateFormat('MMM d, year hh:mm aaa');
                          return Align(
                            alignment: Alignment.centerRight,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () => BlocProvider.of<SelectionCubit>(context).radioSelect(index.toString()),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * 0.3, 10, 10, 10),
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(20)),
                                    child: Text(
                                      messages[index].text!,
                                      style: AppFont.medium(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                                BlocBuilder<SelectionCubit, String>(
                                  builder: (context, state) {
                                    return AnimatedContainer(
                                      padding: const EdgeInsets.only(right: 10),
                                      duration: const Duration(milliseconds: 300),
                                      height: state == index.toString() ? 20 : 0,
                                      child: Text(
                                        f.format(messages[index].date!),
                                        style: AppFont.regular(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          );
                        }),
                      );
                    } else {
                      return Center(
                        child: Text(
                          'No Available Message',
                          style: AppFont.bold(
                            color: Colors.grey,
                            fontSize: 20,
                          ),
                        ),
                      );
                    }
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.transparent,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColor.primary),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        controller: chatController,
                        //controller: ,
                        autocorrect: false,
                        textAlign: TextAlign.left,
                        //style: AtlasFont.darkFont.normal.h5,
                        decoration: const InputDecoration(
                          hintText: "Type a message",
                          isDense: true,
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                        ),
                      ),
                    ),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColor.primary,
                      child: IconButton(
                        onPressed: () async {
                          MessageModel newMessage = MessageModel(
                            date: DateTime.now(),
                            text: chatController.text,
                          );
                          await FirebaseFirestore.instance.collection('Chats').doc().set(newMessage.toJson()).whenComplete(() {
                            chatController.text = '';
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_forward_ios_sharp,
                          size: 15,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
