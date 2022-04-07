import 'package:caracter_api_app/businees-logic/cubit/characters_cubit.dart';
import 'package:caracter_api_app/data/models/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/my-colors.dart';
import '../widgets/character-item.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  //قنا بعمل لسيت من نوع كاركتر لوضع الدتا داخلها
  // ignore: non_constant_identifier_names
  late List<Character> allCharacters;
  @override
  void initState() {
    super.initState();
    //قمنا فى الإنيشيال ستات بوضع قيمة البلوك بروفيدر داخل المتغير
    //وأيضا قمنا بوضع نوع الاوف بلوك كيوبت ومن ثم طلب الدتا من الكيوبت
    allCharacters = BlocProvider.of<CharactersCubit>(context).getAllCharacter();
  }

  //قمنا بعمل الفنكشن التى ستجلب الدتا لليوأى
  Widget buildBlocWidget() {
    //ومن ثم أنشأنا بلوك بيلدر وحددنا النوع كاركتر كيوبت و كاركتر ستات
    return BlocBuilder<CharactersCubit, CharactersState>(
      //تقبل بيلدر وبيلدر تقبل فنكشن من نوع كونست و ستات
      builder: ((context, state) {
        //قامنا بعمل قاعدة شرطية للتحكم فى حالا الدتات
        if (state is CharactersLoaded) {
          //قمنا بوضع قيمة اللود داخل المتفر الذى أنشأنه والإستات تعبر عن الحالة التى فى كاركتر ستات
          allCharacters = (state).characters;
          //نقوم بإرجاع ليست فيو أو جريد فيو لوضع الدتا داخلها
          return buildLoadedListWidgets();
        } else {
          return const Center(child: CircularProgressIndicator(
            color: MyColors.myYellow,
          ));
        }
      }),
    );
  }

  Widget buildLoadedListWidgets() {
    return SingleChildScrollView(
      child: Container(
        color: MyColors.myGray,
        child: Column(children: [
          GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 1,
                mainAxisSpacing: 1,
              ),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: allCharacters.length,
              itemBuilder: (context, index) {
                return  CharacterItem(character: allCharacters[index]);
              })
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.myYellow,
        title: const Center(child: Text('Characters')),
      ),
      //قمنا بعمل فنكشن لتنظيم الكود
      body: buildBlocWidget(),
    );
  }
}
