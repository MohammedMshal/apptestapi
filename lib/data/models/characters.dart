// اولاً نقوم بإحضار المودل من أب أ ومن ثم نقوم بعمل متغيرات لوضع قيم الاباى داخلها
class Character {
  late int charId;
  late String name;
  late String birthday;
  late List<dynamic> occupation;
  late String img;
  late String status;
  late String nickname;
  late List<dynamic> appearance;
  late String portrayed;
  late String category;
  late List<dynamic> betterCallSaulAppearance;
  //قمنا بعمل كونستراكتور لليست وقمنا بتعريف المتغيرات التى أنشأنها بمتغيرات الجيثون
  Character.fromJason(Map<String, dynamic> jason) {
    charId = jason['char_id'];
    name = jason['name'];
    birthday = jason['birthday'];
    occupation = jason['occupation'];
    img = jason['img'];
    status = jason['status'];
    nickname = jason['nickname'];
    appearance = jason['appearance'];
    portrayed = jason['portrayed'];
    category = jason['category'];
    betterCallSaulAppearance = jason['better_call_saul_appearance'];
  }
}
