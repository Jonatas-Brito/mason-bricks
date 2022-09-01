import 'package:dartz/dartz.dart';
import 'package:{{{package_name}}}/core/errors/failures.dart';

abstract class UseCase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}
