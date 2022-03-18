// import 'package:blogspot/src/constants/app.api.dart';
import 'package:blogspot/src/services/http.service.dart';

class UserRequest extends HttpService {
  Future<void> getProfile({String? userId}) async {
    // final apiResult = await get('${AppApi.getProfile}/$userId');
    // print(apiResult);
    // return PostList.fromJson(apiResult.data);
  }
}
