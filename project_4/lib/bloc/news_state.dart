part of 'news_bloc.dart';

@immutable
sealed class NewsState {}

class NewsInitial extends NewsState {}

class SuccessNewsState extends NewsState {
  final List<News> news;

  SuccessNewsState({required this.news});
}

class LoadNewsState extends NewsState {}

class SaveState extends NewsState {}

class ErrorState extends NewsState {}