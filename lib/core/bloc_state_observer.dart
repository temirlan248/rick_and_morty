import 'package:flutter_bloc/flutter_bloc.dart';

class BlocStateObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('State ${change.currentState}\n Changed to: ${change.nextState}');
  }
}
