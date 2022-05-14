import 'package:advanced_flutter_course/data/network/failure.dart';
import 'package:advanced_flutter_course/data/request/request.dart';
import 'package:advanced_flutter_course/data/responses/responses.dart';
import 'package:advanced_flutter_course/domain/model/model.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
