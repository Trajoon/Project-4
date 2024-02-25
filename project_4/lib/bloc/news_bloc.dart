import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_4/data/blog-dataset.dart';
import 'package:project_4/model/news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  // List to store news items
  List<News> newsList = [];

  // Constructor initializing the bloc with the initial state
  NewsBloc() : super(NewsInitial()) {
    
    // Handle generic NewsEvent
    on<NewsEvent>((event, emit) {
      emit(NewsInitial());
    });

    // Handle LoadNewsEvent to load news based on selected tab index
    on<LoadNewsEvent>((event, emit) async {
      try {
        // Emit loading state
        emit(LoadNewsState());
        
        // Simulate delay (you can replace this with actual data fetching)
        await Future.delayed(Duration(seconds: 1));

        // Iterate through dataset and filter news based on selected tab index
        List<News> loadNews = [];
        for (var element in blogDataset) {
          News news = News.fromJson(element);

          if (event.selectedTabIndex == 0 && news.field == 'technology') {
            loadNews.add(news);
          } else if (event.selectedTabIndex == 1 && news.field == 'AI') {
            loadNews.add(news);
          } else if (event.selectedTabIndex == 2 && news.field == 'Cloud') {
            loadNews.add(news);
          } else if (event.selectedTabIndex == 3 && news.field == 'Cybersecurity') {
            loadNews.add(news);
          }
        }

        // Emit success state with filtered news
        emit(SuccessNewsState(news: loadNews));
      } catch (e) {
        // Emit error state if an exception occurs
        emit(ErrorState());
      }
    });

    // Handle SearchNewsEvent to search news based on search term
    on<SearchNewsEvent>((event, emit) async {
      try {
        // Emit loading state
        emit(LoadNewsState());
        
        // Simulate delay (you can replace this with actual data fetching)
        await Future.delayed(Duration(seconds: 1));

        // Iterate through dataset and filter news based on search term
        List<News> loadNews = [];
        for (var element in blogDataset) {
          News news = News.fromJson(element);

          if (news.title.toLowerCase().contains(event.searchTerm.toLowerCase())) {
            loadNews.add(news);
          }
        }

        // Emit success state with filtered news
        emit(SuccessNewsState(news: loadNews));
      } catch (e) {
        // Emit error state if an exception occurs
        emit(ErrorState());
      }
    });

    // Handle EditEvent to edit and update news
    on<EditEvent>((event, emit) {
      try {
        // Update the newsList with the edited news
        newsList = newsList.map((news) {
          return (news.userID == event.news.userID) ? event.news : news;
        }).toList();

        // Emit success state with updated newsList
        emit(SuccessNewsState(news: newsList));
      } catch (e) {
        // Emit error state if an exception occurs
        emit(ErrorState());
      }
    });
  }
}
