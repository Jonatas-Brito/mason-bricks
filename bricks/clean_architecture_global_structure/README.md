# Clean Architecture Global Structure

Generate a clean architecture structure with its respective files (Data sources, Repositories, Models, Entities, Use cases) at the root of your project.

[![License: MIT][license_badge]][license_link]

---

## Getting Started 🚀

1. Install [mason][mason_link]

   ```sh
   dart pub global activate mason_cli
   ```

2. Add the brick

   ```sh
   mason add -g clean_architecture_global_structure
   ```

3. Make a new Dart package

   ```sh
   mason make clean_architecture_global_structure
   ```

## Variables ✨

|    Variable    |       Description       |  Default |   Type   | Conditional | When |
| -------------- | ----------------------- | -------- | -------- | ----------- | ---- |
| `feature_name` | The name of the feature |   Auth   | `string` |    false    | N/A  |

## Outputs 📦

### Data directory outputs 🧱

```
├── data
│   ├── datasources
│   │   └── auth.dart
│   ├── models
│   │   └── auth_model.dart
│   ├── repositories
│   │   └── auth_repository_impl.dart
│   └── ...
└── ...   
```

### Domain directory outputs 🧱

```
├── domain
│   ├── repositories
│   │   └── auth_repository.dart
│   ├── entities
│   │   └── auth_entity.dart
│   ├── usecases
│   │   └── auth_use_case.dart
│   └── ...
└── ...   
```

### Aplication layer directory outputs 🧱

```
├── application_layer
│   ├── auth
│   │   ├── bloc
│   │   │   ├── auth
│   │   │   │   ├── auth_bloc.dart
│   │   │   │   ├── auth_event.dart
│   │   │   │   ├── auth_state.dart
│   │   │   │   └── bloc.dart
│   │   │   └── ...  
│   │   ├── pages
│   │   │   └── auth_page.dart
│   │   ├── widgets
│   │   │   └── .gitkeep
│   │   └── ...
│   └── ...
└── ...    
```

### General outputs 🧱

```
├── lib
│   ├── application_layer
│   │   ├── auth
│   │   │   ├── pages
│   │   │   │   └── auth_page.dart
│   │   │   ├── widgets
│   │   │   │   └── .gitkeep
│   │   │   └── ...
│   │   └── ...
│   ├── core
│   │   ├── errors
│   │   │   └── failures.dart
│   │   ├── usecases
│   │   │   └── usecase.dart
│   ├── data
│   │   ├── datasources
│   │   │   └── auth.dart
│   │   ├── models
│   │   │   └── auth_model.dart
│   │   ├── repositories
│   │   │   └── auth_repository_impl.dart
│   │   └── ...
│   ├── domain
│   │   ├── repositories
│   │   │   └── auth_repository.dart
│   │   ├── entities
│   │   │   └── auth_entity.dart
│   │   ├── usecases
│   │   │   └── auth_use_case.dart
│   │   └── ...
│   └── ...   
└── ...
```

## Outputs Example

### Data

#### Datasource class

```dart
abstract class AuthDataSource {
// TODO: implement your AuthDataSource
}

class AuthDataSourceImpl implements AuthDataSource {
// TODO: implement your AuthDataSourceImpl
}
```

#### Model class

```dart
import 'package:any/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  // TODO: implement your AuthModel
}
```

#### Repository implementation class

```dart
import "package:any/domain/repositories/auth_repository.dart";

class AuthRepositoryImpl implements AuthRepository {
  // TODO: implement your AuthRepositoryImpl
}
```

### Domain

#### Entity

```dart
import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  // TODO: implement your AuthEntity

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
```

#### Repository

```dart
class AuthRepository {
  // TODO: implement your AuthRepository
}
```

#### Use case

```dart
import 'package:dartz/dartz.dart';

import 'package:any/core/usecases/usecase.dart';
import 'package:any/core/error/failure.dart';

class AuthUseCase implements UseCase<void, AuthParams> {
  // TODO: implement the output of your AuthUseCase


  @override
  Future<Either<Failure, void>> call(AuthParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class AuthParams {
  // TODO: implement your AuthParams
  const AuthParams();
}
```

### Core

#### Use case

```dart
import 'package:dartz/dartz.dart';
import 'package:any/core/errors/failures.dart';

abstract class UseCase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}
```

#### Failures

```dart
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final int? statusCode;
  final String? responseMessage;
  final Exception? exception;

  const Failure([this.statusCode, this.responseMessage, this.exception]);

  @override
  List<Object?> get props => [statusCode, responseMessage, exception];
}
```

### Aplication layer

#### Page

```dart
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
  }
}
```








[mason_link]: https://github.com/felangel/mason
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
