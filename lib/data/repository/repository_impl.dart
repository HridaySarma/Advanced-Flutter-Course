import 'package:advanced_flutter_course/data/data_source/remote_data_source.dart';
import 'package:advanced_flutter_course/data/mapper/mapper.dart';
import 'package:advanced_flutter_course/data/network/error_handler.dart';
import 'package:advanced_flutter_course/data/network/failure.dart';
import 'package:advanced_flutter_course/data/network/network_info.dart';
import 'package:advanced_flutter_course/data/request/request.dart';
import 'package:advanced_flutter_course/domain/model.dart';
import 'package:advanced_flutter_course/domain/repository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // Its safe to call the API
      try {
        final response = await _remoteDataSource.login(loginRequest);

        if (response.status == ApiInternalStatus.SUCCESS) {
          // success
          // return data

          return Right(response.toDomain());
        } else {
          // return biz logic error
          return Left((Failure(response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.UNKNOWN)));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      // return connection error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
