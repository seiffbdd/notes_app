import 'dart:developer';
import 'package:bloc/bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('change ==========> $change');
  }

  @override
  void onClose(BlocBase bloc) {
    log('close');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('open');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {}

  @override
  void onEvent(Bloc bloc, Object? event) {}

  @override
  void onTransition(Bloc bloc, Transition transition) {}
}
