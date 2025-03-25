import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';
import 'package:beamer/beamer.dart';

class OnboardingState {
  final int currentPageIndex;

  OnboardingState({required this.currentPageIndex});

  OnboardingState copyWith({int? currentPageIndex}) {
    return OnboardingState(
      currentPageIndex: currentPageIndex ?? this.currentPageIndex,
    );
  }
}

class OnboardingCubit extends Cubit<OnboardingState> {
  final PageController pageController = PageController();

  OnboardingCubit() : super(OnboardingState(currentPageIndex: 0));

  void updatePageIndicator(int index) {
    emit(state.copyWith(currentPageIndex: index));
  }

  void dotNavigationClick(int index) {
    emit(state.copyWith(currentPageIndex: index));
    pageController.jumpToPage(index);
  }

  Future<void> nextPage(BuildContext context) async {
    if (state.currentPageIndex == 2) {
      // final prefs = await SharedPreferences.getInstance();
      // await prefs.setBool('isFirstTime', false);
      // if (kDebugMode) {
      //   print(
      //     '---------------------------- SHARED PREFERENCES NEXT BUTTON ----------------------------',
      //   );
      //   print(prefs.getBool('isFirstTime'));
      // }
      if (context.mounted) {
        Beamer.of(context).beamToReplacementNamed('/login', stacked: false);
      }
    } else {
      int nextPage = state.currentPageIndex + 1;
      pageController.jumpToPage(nextPage);
      emit(state.copyWith(currentPageIndex: nextPage));
    }
  }

  void skipPage() {
    emit(state.copyWith(currentPageIndex: 2));
    pageController.jumpToPage(2);
  }
}
