
import 'package:flutter/material.dart';

import '../constants.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight=MediaQuery.of(context).size.height;
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      backgroundColor: const Color.fromARGB(255, 40, 40, 43),
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Constants.kBlackColor,
        leading: const Icon(Icons.menu, size: 30, color: Constants.kWhiteColor,),
        actions:const [
          Icon(Icons.search),
          SizedBox(width: 25,),
          Icon(Icons.supervised_user_circle),
          SizedBox(width: 10,),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: ListView(
            reverse: true,
            children: [
              Container(
                padding:const EdgeInsets.symmetric(vertical: 17,horizontal: 4),
                child: Row(
                  textDirection: TextDirection.ltr,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                    ),
                    const SizedBox(width: 17,),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text.rich(TextSpan(
                          text: "Averisera  ",style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Constants.kWhiteColor),
                          children: [TextSpan(text:'08/06/2023 3:38 PM',style: TextStyle(color: Color.fromRGBO(143, 142, 142, 1), fontSize: 12))]
                        )),
                        const SizedBox(height: 7),
                        Text('Hello this is my app. Why are you here?',
                          textAlign:TextAlign.start,
                          style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Constants.kWhiteColor),
                          maxLines: 4,
                          overflow: TextOverflow.fade
                      )
                      ],
                    )),
                    
                  ],
                ),
              )
            ],
          )
          ),
          Container(
            height: 70,
            child: Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(width: 0.5,color: Constants.kBlackColor,)),
                color: Color.fromARGB(255, 40, 40, 43),
              ),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    height: 37,
                    width: 37,
                    decoration: const BoxDecoration(
                    color: Constants.kBlackColor,
                    shape: BoxShape.circle
                    ),
                    child: const Icon(Icons.add,color: Constants.kWhiteColor),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    height: 37,
                    width: 37,

                    decoration: const BoxDecoration(
                      color: Constants.kBlackColor,
                      shape: BoxShape.circle
                    ),
                    child: const Icon(Icons.wallet_giftcard_sharp,color: Constants.kWhiteColor,),
                  ),
                  Expanded(
                    child: Container(
                      padding:const EdgeInsets.symmetric(horizontal: 12),
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      height: 37,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Constants.kBlackColor,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.white),
                            decoration:  InputDecoration(
                              border:InputBorder.none,
                              hintText: 'Write message',
                              hintStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: Constants.kWhiteColor)
                            ),
                          ),
                          ),
                          const Icon(Icons.emoji_emotions_sharp,color: Constants.kWhiteColor,)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}