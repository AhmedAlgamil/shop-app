import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../shared/local/cash_helper.dart';
import '../../../auth/presentation/screens/login_screen.dart';
import '../store/onboarding_cubit/onboarding_cubit.dart';
import '../store/onboarding_cubit/onboarding_states.dart';

class OnBoardingLayout extends StatelessWidget {
  OnBoardingLayout({Key? key}) : super(key: key);
  PageController pageController = PageController();
  int currentIndex = 0;

  void onSubmit(BuildContext context){
    CashHelper.setBool("onBoardingSeen", true).then((value) {
      if(value!){
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            ),
                (route) => false);
      }
    }).catchError((e){
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnBoardingCubit>(
      create: (context) => OnBoardingCubit(),
      child: BlocConsumer<OnBoardingCubit, OnBoardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          final cubit = OnBoardingCubit.get(context);
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              actions: [
                TextButton(
                  child: const Text("Skip"),
                  onPressed: (){
                    onSubmit(context);
                  },
                ),
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        itemBuilder: (context, index) => cubit.pages[index],
                        itemCount: cubit.pages.length,
                        onPageChanged: (int index) {
                          currentIndex = index;
                        },
                        controller: pageController,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SmoothPageIndicator(
                            controller: pageController,
                            count:  cubit.pages.length,
                            axisDirection: Axis.horizontal,
                            effect:  const SlideEffect(
                                spacing:  8.0,
                                radius:  10.0,
                                dotWidth:  15.0,
                                dotHeight:  15.0,
                                paintStyle:  PaintingStyle.fill,
                                strokeWidth:  1.5,
                                dotColor:  Colors.grey,
                                activeDotColor:  Colors.blue,
                            ),
                          ) ,
                          Spacer(),
                          FloatingActionButton(
                            onPressed: () {
                              if (currentIndex < cubit.pages.length - 1) {
                                pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.fastLinearToSlowEaseIn,
                                );
                              } else {
                                onSubmit(context);

                              }
                            },
                            child: const Icon(
                              Icons.arrow_forward_ios_sharp,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
