import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/characters.dart';
import '../../data/repositry/characters-repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  //قمنا بإنشاء متغير لوضع داخلة الق
  List<Character> characters = [];
  //هنا نقوم بإنشاء أوبجيكيت من الكاركتر ريبوسترى للحصول على الدتا من خلاله
  final CharactersRepository charactersRepository;
//ثانياً قمنا بإنشاء كونستراكتور للكاركتر ريبوسترى عشان الايرور عشان النل سفتى
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  //قمنا بإنشاء ليست من نوع كيوبت ال هو الفارغ لإستقبال الدتا فيه
  List<Character> getAllCharacter() {
    //إستخدمنا الاوبجيكت للحصول على الدتا من الريبوسترى ثم وضعنا القيمة فى الكاركترز
    charactersRepository.getAllCharacters().then((Characters) {
      //هنا نعطى اليوأى الدتا من خلال الايميت من خلال وضع الكاركتر ستات داخلها ومن ثم وضع الكونستركتور المطلول داخلها
      emit(CharactersLoaded(Characters));
      characters = characters;
    });
    return characters;
  }
}
