import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/onboarding_page_model.dart';
import '../../assets/images.dart';
import '../../components/onboarding_page.dart';
import 'onboarding_states.dart';


class OnBoardingCubit extends Cubit<OnBoardingStates> {
  OnBoardingCubit() : super(OnBoardingInitialState());

  static OnBoardingCubit get(BuildContext context) => BlocProvider.of(context);

  final List<OnBoardingPage> pages=[
    const OnBoardingPage(
        page: OnBoardingPageModel(
          image: Images.onBoarding1,
          title: "Fist Step",
          body: "you can register by your email address and your phone number to get our new offers and enjoy with your journey in our amazing app.....",
        )),
    const OnBoardingPage(
        page: OnBoardingPageModel(
          image: Images.onBoarding2,
          title: "Second Step",
          body: "you can register by your email address and your phone number to get our new offers and enjoy with your journey in our amazing app.....",
        )),
    const OnBoardingPage(
        page: OnBoardingPageModel(
          image: Images.onBoarding3,
          title: "Third Step",
          body: "you can register by your email address and your phone number to get our new offers and enjoy with your journey in our amazing app.....",
        )),
  ];
}
