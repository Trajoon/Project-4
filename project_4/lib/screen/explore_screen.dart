import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_4/bloc/news_bloc.dart';
import 'package:project_4/widgets/news_widget.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: ListView(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: TextFormField(
                      onChanged: (searchTerm) {
                        // Trigger a SearchNewsEvent on text change
                        context.read<NewsBloc>().add(SearchNewsEvent(searchTerm));
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.transparent),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintText: "Search for News",
                        hintStyle: const TextStyle(
                          color: Color(0xffB8B8B8),
                          fontFamily: 'Inter',
                          fontSize: 14,
                        ),
                        filled: true,
                        fillColor: const Color(0xff2e2e2e),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'icon/Frame.svg',
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Use BlocBuilder to conditionally display news or messages based on state
                  BlocBuilder<NewsBloc, NewsState>(
                    builder: (context, state) {
                      String searchTerm = ''; // Define searchTerm here

                      if (state is SuccessNewsState) {
                        if (state.news.isEmpty) {
                          // Display a message when there are no search results
                          if (searchTerm.isEmpty) {
                            return const Center(
                              child: Text(
                                'Enter a search term to find news.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                              child: Text(
                                'No search results found.',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }
                        } else {
                          // Display the list of news items
                          return Column(
                            children: [
                              ...state.news.map(
                                (e) => NewsContainer(
                                  news: e,
                                ),
                              ).toList(),
                            ],
                          );
                        }
                      } else {
                        // Display an error message if an error occurs
                        return const Text("Error");
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
