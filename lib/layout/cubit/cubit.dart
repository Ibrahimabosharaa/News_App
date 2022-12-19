import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit/modules/business.dart';
import 'package:news_app/layout/cubit/modules/science.dart';

import 'package:news_app/layout/cubit/modules/sports.dart';
import 'package:news_app/layout/cubit/states.dart';

import '../../dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;
  List<BottomNavigationBarItem> bottomNav = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: "Business",
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: "Science",
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: "Sports",
    ),
  ];
  void changebottomNavBar(int index) {
    currentindex = index;
    emit(NewsBottomNavStates());
  }

  List<Widget> screens = [
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
  ];
  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'business',
        'apiKey': '6206a29e4bc7468d9021eb72dad29562',
      },
    ).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];
  void getsports() {
    emit(NewsGetsportsLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'sports',
        'apiKey': '6206a29e4bc7468d9021eb72dad29562',
      },
    ).then((value) {
      sports = value.data['articles'];
      print(sports[0]['title']);
      emit(NewsGetsportsSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetsportsErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];
  void getscience() {
    emit(NewsGetscienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'eg',
        'category': 'science',
        'apiKey': '6206a29e4bc7468d9021eb72dad29562',
      },
    ).then((value) {
      science = value.data['articles'];
      print(science[0]['title']);
      emit(NewsGetscienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetscienceErrorState(error.toString()));
    });
    
  }
  bool isDark=false;
  void changeAppMode(){
    isDark=!isDark;
    emit(NewsChangeAppModeState());
  }
}
