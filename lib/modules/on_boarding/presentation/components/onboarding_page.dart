import 'package:flutter/material.dart';

import '../../data/models/onboarding_page_model.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key,required this.page}) : super(key: key);
  final OnBoardingPageModel page;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(page.image,fit: BoxFit.cover,height: MediaQuery.of(context).size.height*1/3,),
          const SizedBox(height: 40),
          Text(page.title,style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
          ),),
          const SizedBox(height: 15),
          Expanded(
            child: Text(page.body,style: const TextStyle(
                fontSize: 20,
            ),),
          ),
        ],
      ),
    );
  }
}
