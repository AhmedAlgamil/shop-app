import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopping_layout/shared/local/cash_helper.dart';
import 'package:shopping_layout/shared/network/dio_helper.dart';

import 'modules/auth/presentation/screens/login_screen.dart';
import 'modules/on_boarding/presentation/screens/onboarding_layout_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CashHelper.init();
  DioHelper.init();
  final bool? onBoardingSeen=CashHelper.get("onBoardingSeen");
  runApp(MyApp(onBoardingSeen: onBoardingSeen??false,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key,this.onBoardingSeen=false});
  final bool onBoardingSeen;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white
          )
        )
      ),
      home: onBoardingSeen ? LoginScreen(): OnBoardingLayout(),
    );
  }
}
