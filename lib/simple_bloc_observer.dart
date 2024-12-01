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
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
  }
}
