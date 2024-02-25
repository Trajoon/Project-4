import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/news_bloc.dart';
import 'package:project_4/model/news.dart';
import 'package:project_4/widgets/mid_part.dart';
import 'package:project_4/widgets/news_widget.dart';
import 'package:project_4/widgets/top_part.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(LoadNewsEvent(0)); 
    return DefaultTabController(
      initialIndex: 0, 
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xff121212),
        appBar: AppBar(
          backgroundColor: const Color(0xff1E1E1E),
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset("image/side_bar.png"),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('image/Icons_app (1).png'),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('image/notifiaction.png'),
            ),
          ],
          bottom:  TabBar(
            automaticIndicatorColorAdjustment: true,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Color(0xffDD403C),
            unselectedLabelColor: Color(0xff888888),
            indicatorWeight: 2.5,
            labelPadding: EdgeInsets.symmetric(horizontal: 2),
            labelColor: Color(0xffFFFFFF),
            labelStyle: TextStyle(fontFamily: 'Inter', fontSize: 17),
            dividerColor: Color(0xff888888),
            dividerHeight: 1,
            onTap: (index) => context.read<NewsBloc>().add(LoadNewsEvent(index)),
            tabs: [
              Tab(text: 'Tech'),
              Tab(text: 'AI'),
              Tab(text: 'Cloud'),
              Tab(text: 'Cybersecurity'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                const TopPart(),
                const MidPart(),
                BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    if (state is NewsInitial || state is LoadNewsState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is SuccessNewsState) {
                      return Column(
                        children: [
                          ...state.news.map(
                            (e) => NewsContainer(
                              news: e,
                            ),
                          ).toList()
                        ],
                      );
                    } else {
                      return const Text("Error");
                    }
                  },
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_4/bloc/news_bloc.dart';
import 'package:project_4/model/news.dart';
import 'package:project_4/widgets/mid_part.dart';
import 'package:project_4/widgets/news_widget.dart';
import 'package:project_4/widgets/top_part.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    context.read<NewsBloc>().add(LoadNewsEvent());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xff121212),
        appBar: AppBar(
          backgroundColor: const Color(0xff1E1E1E),
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset("image/side_bar.png"),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Image.asset('image/Icons_app (1).png'),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset('image/notifiaction.png'),
            ),
          ],
          bottom: const TabBar(
            automaticIndicatorColorAdjustment: true,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Color(0xffDD403C),
            unselectedLabelColor: Color(0xff888888),
            indicatorWeight: 2.5,
            labelPadding: EdgeInsets.symmetric(horizontal: 2),
            labelColor: Color(0xffFFFFFF),
            labelStyle: TextStyle(fontFamily: 'Inter', fontSize: 17),
            dividerColor: Color(0xff888888),
            dividerHeight: 1,
            tabs: [
              Tab(text: 'Tech'),
              Tab(text: 'AI'),
              Tab(text: 'Cloud'),
              Tab(text: 'Cybersecurity'),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Center(
              child: Column(children: [
                const TopPart(),
                const MidPart(),
                BlocBuilder<NewsBloc, NewsState>(
                  builder: (context, state) {
                    if (state is NewsInitial || state is LoadNewsState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is SuccessNewsState) {
                      return Column(
                        children: [
                          ...state.news.map(
                            (e) => NewsContainer(
                              news: e,
                            )
                          ).toList()
                        ],
                      );
                    } else {
                      return const Text("Error");
                    }
                  },
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

 */


/*
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_4/data/blog-dataset.dart';
import 'package:project_4/model/news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(NewsInitial()) {
    on<LoadNewsEvent>((event, emit) async {
      // TODO: implement event handler
      try {
         emit(LoadNewsState());
      await Future.delayed(Duration(seconds: 2));

      List<News> loadNews = [];
      for (var element in blogDataset) {
        loadNews.add(News.fromJson(element));
      }

      emit(SuccessNewsState(news: loadNews));
      } catch (e) {
        emit(ErrorState());
      }
     
    });
  }
}


 */