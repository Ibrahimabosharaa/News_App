abstract class NewsStates{}
class NewsInitialStates extends NewsStates{}
class NewsBottomNavStates extends NewsStates{}
class NewsGetBusinessLoadingState extends NewsStates{}

class NewsGetBusinessSuccessState extends NewsStates{}
class NewsGetBusinessErrorState extends NewsStates{
  final String error;

  NewsGetBusinessErrorState(this.error);
}

class NewsGetsportsLoadingState extends NewsStates{}

class NewsGetsportsSuccessState extends NewsStates{}
class NewsGetsportsErrorState extends NewsStates{
  final String error;

  NewsGetsportsErrorState(this.error);
}
class NewsGetscienceLoadingState extends NewsStates{}

class NewsGetscienceSuccessState extends NewsStates{}
class NewsChangeAppModeState extends NewsStates{}

class NewsGetscienceErrorState extends NewsStates{
  final String error;

  NewsGetscienceErrorState(this.error);
}