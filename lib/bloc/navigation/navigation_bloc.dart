import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc({required int tabIndex}) : super(NavigationInitial(tabIndex)) {
    // on<NavigationEvent>((event, emit) {
    //   if (event is TabChange) {
    //     emit(NavigationState(event.tabIndex));
    //   }
    // });
    on<TabChange>((event, emit) {
      emit(NavigationInitial(event.tabIndex));
    });
  }
}
