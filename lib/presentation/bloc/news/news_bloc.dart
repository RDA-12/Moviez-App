import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/news.dart';
import '../../../domain/usecases/news/get_news_usecase.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase getNewsUseCase;

  NewsBloc(this.getNewsUseCase) : super(NewsInitial()) {
    on<GetNews>((event, emit) async {
      emit(LoadingNews());
      try {
        final String page = event.page;
        final List<News> newsList = await getNewsUseCase(Params(page));
        emit(NewsLoaded(newsList));
      } catch (e) {
        emit(NewsLoadingError(e.toString()));
      }
    });
  }
}
