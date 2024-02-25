part of 'news_bloc.dart';

@immutable
sealed class NewsEvent {}

class LoadNewsEvent extends NewsEvent {
  final int selectedTabIndex;

  LoadNewsEvent(this.selectedTabIndex);
}

class SearchNewsEvent extends NewsEvent {
  final String searchTerm;

  SearchNewsEvent(this.searchTerm);
}

class SaveEvent extends NewsEvent {
  final News news;

  SaveEvent(this.news);
}

class EditEvent extends NewsEvent {
  final News news;

  EditEvent(this.news);
}