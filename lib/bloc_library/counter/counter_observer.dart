// ignore_for_file: unnecessary_overrides

import 'package:bloc/bloc.dart';

class CounterObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
  }
}
