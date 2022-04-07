//تستخدم للحصول على الدتا من الانترنت او الإباى  من خلال مكتبة الديو او الاتش تى تى بى
import 'package:caracter_api_app/constants/strings.dart';
import 'package:dio/dio.dart';

class CharactersWebservice {
  late Dio dio;
  //قمنا بعمل كونستراكتور للكلاس للتحكم فى الديو
  CharactersWebservice() {
    //هنا التحكم فى إعداد الديو من خلال البيز أبوشن
    BaseOptions options = BaseOptions(
      //هو العنوان الرئيسى لاباى الخاص بنا تم تعريفه فى فايل كونستانس  ووضع اللينك دخله
      baseUrl: baseUrl,
      //تستخدم لاظهار بيانات إضافية للأخطاء
      receiveDataWhenStatusError: true,
      connectTimeout: 15 * 1000,
      receiveTimeout: 15 * 1000,
    );
    dio = Dio(options);
  }
  //قمنا بعمل فيوتشر للحصول على الدتا من خلال الديو التى داخلها الاوبشن الخاص بها والبيز يوار ال
  Future<dynamic> getAllCharacters() async {
    try {
      //ومن ثم وضعنها داخل متغير من نوع ريسبونس ووضعنا داخله الديو ومن ثم الباث الخاص بالحصول على البيانات فى الايباى
      Response response = await dio.get('characters');
      //ثم ارجعنا الدتا الى الجيت اول كاركتر
      return response.data;
    } catch (e) {
      pragma(e.toString());
    }
  }
}
