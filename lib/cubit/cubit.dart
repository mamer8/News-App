import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mansour/cubit/states.dart';

import '../network/remote/dio_helper.dart';
import '../screens/business_screen.dart';
import '../screens/science_screen.dart';
import '../screens/sport_screen.dart';

class NewsCubit extends Cubit<NewsAppStates> {
  NewsCubit() : super(NewsInitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentindex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.business_center_outlined), label: 'Business'),
    BottomNavigationBarItem(
        icon: Icon(Icons.sports_gymnastics_sharp), label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(Icons.science_outlined), label: 'Science'),
  ];

  List<Widget> screens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
  void changebottomnavbar(int index) {
    currentindex = index;
    if (index == 1) getSportsNews();
    if (index == 2) getScienceNews();
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  void getBusinessNews() {
    //CacheHelper.getData(key: key)
    emit(NewsGetBusinessLoading());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': 'fceaab30ef6f414c85be56ae38a127f4',
      },
    ).then((value) {
      // print(value.data.toString());
      business = value.data['articles'];
      emit(GetBusinessNewsSuccess());
      print(business[0]);
    }).catchError((error) {
      emit(GetBusinessNewsError(error.toString()));
      print(error.toString());
    });
  }

  List<dynamic> sports = [];
  void getSportsNews() {
    emit(NewsGetSportsLoading());
    if (sports.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': 'fceaab30ef6f414c85be56ae38a127f4',
        },
      ).then((value) {
        // print(value.data.toString());
        sports = value.data['articles'];
        emit(GetSportsNewsSuccess());
        // print(business[0]);
      }).catchError((error) {
        emit(GetSportsNewsError(error.toString()));
        print(error.toString());
      });
    } else {
      emit(GetSportsNewsSuccess());
    }
  }

  List<dynamic> science = [];
  void getScienceNews() {
    emit(NewsGetScienceLoading());
    if (science.isEmpty) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'fceaab30ef6f414c85be56ae38a127f4',
        },
      ).then((value) {
        // print(value.data.toString());
        science = value.data['articles'];
        emit(GetScienceNewsSuccess());
        // print(business[0]);
      }).catchError((error) {
        emit(GetScienceNewsError(error.toString()));
        print(error.toString());
      });
    } else {
      emit(GetScienceNewsSuccess());
    }
  }

  List<dynamic> search = [];
  void getSearchNews({required String searcher}) {
    emit(NewsGetSearchLoading());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': searcher,
        'sortBy': 'publishedAt',
        'apiKey': 'fceaab30ef6f414c85be56ae38a127f4',
      },
    ).then((value) {
      // print(value.data.toString());
      search = value.data['articles'];
      emit(GetSearchNewsSuccess());
      // print(business[0]);
    }).catchError((error) {
      emit(GetSearchNewsError(error.toString()));
      print(error.toString());
    });
  }

  bool isDark = false;
  void changeThemeMode() {
    // if (fromShared != null) {
    //   isDark = fromShared;
    // emit(NewsThemeModeState());
    // } else {
    isDark = !isDark;

    // CacheHelper.setData(key: 'isDark', value: isDark).then((value) {
    emit(NewsThemeModeState());
    // });
    // }
  }
}
