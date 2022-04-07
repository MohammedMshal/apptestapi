import 'app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {
  //قمنا بعمل اوبجيكت من الكلاس الذى وضعنا داخلة الراويت
  final AppRouter appRouter;
  //قمنا بعمل كونستركتور للايرورر الذى يظهر 
  const MyApp({Key? key, required this.appRouter}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //خاصية داخل  المين تسمح بعمل راويت مباشر من المين 
      onGenerateRoute: appRouter.generateRoute ,
    );
  }
}
