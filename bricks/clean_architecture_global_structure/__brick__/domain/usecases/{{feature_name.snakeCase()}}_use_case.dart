import 'package:dartz/dartz.dart';

import 'package:{{{package_name}}}/core/usecases/usecase.dart';
import 'package:{{{package_name}}}/core/error/failure.dart';

class {{feature_name.pascalCase()}}UseCase implements UseCase<void, {{feature_name.pascalCase()}}Params> {
  // TODO: implement the output of your {{feature_name.pascalCase()}}UseCase


  @override
  Future<Either<Failure, void>> call({{feature_name.pascalCase()}}Params params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class {{feature_name.pascalCase()}}Params {
  // TODO: implement your {{feature_name.pascalCase()}}Params
  const {{feature_name.pascalCase()}}Params();
}