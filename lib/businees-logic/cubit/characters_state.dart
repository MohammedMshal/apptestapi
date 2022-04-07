//هنا نضيف الدتا التى حصلنا عليها من الريبوسترى وهنا نضيف حالات الدتا
part of 'characters_cubit.dart';

@immutable
abstract class CharactersState {}

class CharactersInitial extends CharactersState {}
//ملحوظه يمكن إضافة اكثر من ستات او حالة مثلا فى حالة أن الدتا مجاتشى

//هنا أنشأنا كلاس فى حالة الدتا ان الدتا تحملت ولابد من أن تورث من الكاركتر ستات
class CharactersLoaded extends CharactersState {
  //أولاً قمنا بانشاء أوبجيكت من نوع كاركتر 
  final List<Character> characters;
  //ثانياً قمنا بعمل كونستراكتور عشان النل سفتى عشان بيظهر ايرور
  CharactersLoaded(this.characters);
}
 
 //ومن ثم نرسل نذهب الى الكاركتر كيوبت لإعطائها الدتا من الكاركتر ريبوستروى 