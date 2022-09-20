import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/strings.dart';
import '../../../../domain/entity/news.dart';
import '../../../bloc/news/news_bloc.dart';
import '../widgets/news_list.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  void initState() {
    super.initState();
    context.read<NewsBloc>().add(const GetNews("1"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Moviez")),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (_, state) {
          if (state is NewsInitial || state is LoadingNews) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is NewsLoadingError) {
            return Center(
              child: IconButton(
                icon: const Icon(Icons.restart_alt_rounded),
                onPressed: () {
                  context.read<NewsBloc>().add(const GetNews("1"));
                },
              ),
            );
          }
          if (state is NewsLoaded) {
            final List<News> newsList = state.newsList;
            return NewsList(
              news: newsList,
            );
          }
          return const Center(
            child: Text(kUnexpectedError),
          );
        },
      ),
    );
  }
}
