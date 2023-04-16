import '../models/user_data_model.dart';
import '../remote_data_source/auth_remote_data_source.dart';

class AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource = AuthRemoteDataSource();

  Future<UserDataModel?> login({
    required String email,
    required String password,
  }) async {
    try {
      return await _authRemoteDataSource.login(email: email, password: password);
    } catch (error) {
      rethrow;
    }
  }

  Future<UserDataModel?> register(UserData data) async {
    try {
      return await _authRemoteDataSource.register(data);
    } catch (error) {
      rethrow;
    }
  }
}
