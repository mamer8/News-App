abstract class NewsAppStates {}

class NewsInitialState extends NewsAppStates {}

class NewsBottomNavState extends NewsAppStates {}

class NewsThemeModeState extends NewsAppStates {}

class GetBusinessNewsSuccess extends NewsAppStates {}

class GetBusinessNewsError extends NewsAppStates {
  final String error;

  GetBusinessNewsError(this.error);
}

class NewsGetBusinessLoading extends NewsAppStates {}

class GetSportsNewsSuccess extends NewsAppStates {}

class GetSportsNewsError extends NewsAppStates {
  final String error;

  GetSportsNewsError(this.error);
}

class NewsGetSportsLoading extends NewsAppStates {}

class GetScienceNewsSuccess extends NewsAppStates {}

class GetScienceNewsError extends NewsAppStates {
  final String error;

  GetScienceNewsError(this.error);
}

class NewsGetScienceLoading extends NewsAppStates {}

class GetSearchNewsError extends NewsAppStates {
  final String error;

  GetSearchNewsError(this.error);
}

class NewsGetSearchLoading extends NewsAppStates {}
class GetSearchNewsSuccess extends NewsAppStates {}
