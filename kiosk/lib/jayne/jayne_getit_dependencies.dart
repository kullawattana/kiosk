import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class JayneSystemContext {
  final JayneSystem system;
  final JayneGetItDependencies dependencies;

  JayneSystemContext({
    required this.system,
    required this.dependencies,
  });

  Future<void> start() async {
    system.setContext(this);
    await system.createDependencies(dependencies);
  }
}

abstract class JayneSystem {
  late JayneSystemContext _context;
  JayneGetItDependencies get dependencies => _context.dependencies;

  void setContext(JayneSystemContext context) {
    _context = context;
  }

  Future<void> createDependencies(JayneGetItDependencies dependencies);
}

class JayneGetItDependencies {
  void add<T extends Object>(
    T instance, {
    bool lazy = false,
  }) {
    if (lazy) {
      GetIt.I.registerLazySingleton<T>(() => instance);
    } else {
      GetIt.I.registerSingleton<T>(instance);
    }
  }

  static T of<T extends Object>() {
    return GetIt.I<T>();
  }
}

typedef InjectBloc = void Function<T extends BlocBase>(
  T bloc, {
  bool lazy,
});