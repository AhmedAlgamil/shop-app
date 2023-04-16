import '../../../../shared/network/dio_helper.dart';
import '../models/user_data_model.dart';

class AuthRemoteDataSource {
  Future<UserDataModel?> login({required String email,required String password}) async {
    try {
      final res = await DioHelper.postData(
        url: "login",
        data: {
          "email": email,
          "password": password
        }
      );
      return UserDataModel.fromJson(res.data);
    } catch (error) {
      rethrow;
    }
  }

  Future<UserDataModel?> register(UserData data) async {
    try {
      final res = await DioHelper.postData(
        url: "register",
        data: UserData.toJson(data),
      );
      return UserDataModel.fromJson(res.data);
    } catch (error) {
      rethrow;
    }
  }
}
