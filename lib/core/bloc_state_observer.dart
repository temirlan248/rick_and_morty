import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';

class BlocStateObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Logger()
        .d('State ${change.currentState}\n Changed to: ${change.nextState}');
  }
}
