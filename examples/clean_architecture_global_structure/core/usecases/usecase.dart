import 'package:dartz/dartz.dart';
import 'package:clean_architecture_global_structure/core/errors/failures.dart';

abstract class UseCase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}
