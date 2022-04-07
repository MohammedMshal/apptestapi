import '../models/characters.dart';
import '../web-service/characters_web_service.dart';

//الخطوة الثالثة نقوم باخذ الدتا من الويب سيرفس  الى الريبوسترى ومن ثم إعطائها للكيوبت
class CharactersRepository {
  //قمنا بعمل اوبجيكيت من الكاركتر ويب سيرفيس للحصول على الدتا منه
  // وقمنا بوضع فاينال وعمل كونستراكتور بسبب النل سفتى
  final CharactersWebservice charactersWebservice;
  CharactersRepository(this.charactersWebservice);

  Future<List<Character>> getAllCharacters() async {
    //قمنا بوضع الدتا التى تم الحصول عليها من الويب سيرفيس داخل الكاركتر الفارغ (الميديول)
    final characters = await charactersWebservice.getAllCharacters();
    //ومن ثم تم إرجاع الكاركتر التى تم وضع داخلها القيمة وتنسيقها داخل  الليست بهذا الكود
    //ومن ثم تحويلها الى ليست نهايتاً
    return characters
        .map((character) => Character.fromJason(character))
        .toList();
  }
}
