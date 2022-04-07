import 'businees-logic/cubit/characters_cubit.dart';
import 'package:caracter_api_app/constants/strings.dart';
import 'package:caracter_api_app/data/repositry/characters-repository.dart';
import 'package:caracter_api_app/data/web-service/characters_web_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Presentation/screens/characters-screen.dart';
//import 'Presentation/screens/characters-details';

//قمنا بعمل كلاس لوضع داخلة الروت
class AppRouter {
  //قمنا بإنشاء اوبجيكت للكرنت ريبوسترى وللكرنت كيوبت لوضعهم داخل البلوك بروفيدر
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebservice());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  //انشأنا متغير من نوع راويت لوضع داخلة الرواتيتس
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
      //ومن ثم قمنا بوضع الصفحة الأساسية داخل البلوك لإستعمالة
        return MaterialPageRoute(builder: (_) => BlocProvider(
          //البلك تطلب الكريات من نوع بيلد كونتكست ومن ثم وضعنا داخلة الكرند كيوبت اوبجيت 
          //ووضعنا داخلة كونيستراكتور للكارنت ريبوسترى 
          create: (BuildContext context) => charactersCubit,
          //ومن ثم وضعنا داخلة الصفحة المراد إستعمالة فيه
          child:  const CharacterScreen(),
          )
          );
     /* case characterDetailsScreen:
        return MaterialPageRoute(
            builder: (_) =>  CharacterDetailsScreen());*/
    }
    return null;
  }
}
