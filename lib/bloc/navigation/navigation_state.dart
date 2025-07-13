part of 'navigation_bloc.dart';

@immutable
sealed class NavigationState {
  // final int tabIndex;

  // const NavigationState({this.tabIndex = 0});
}

final class NavigationInitial extends NavigationState {
  final int tabIndex;
  NavigationInitial(this.tabIndex);
}
