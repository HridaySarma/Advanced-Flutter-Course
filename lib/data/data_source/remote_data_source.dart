import 'package:advanced_flutter_course/data/request/request.dart';
import 'package:advanced_flutter_course/data/responses/responses.dart';
import 'package:advanced_flutter_course/data/network/app_api.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _apiServiceClient;

  RemoteDataSourceImplementer(this._apiServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _apiServiceClient.login(loginRequest.email,
        loginRequest.password, loginRequest.imei, loginRequest.deviceType);
  }
}
