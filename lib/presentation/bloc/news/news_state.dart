part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();

  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}

class LoadingNews extends NewsState {}

class NewsLoaded extends NewsState {
  final List<News> newsList;
  const NewsLoaded(this.newsList);

  @override
  List<Object> get props => [newsList];
}

class NewsLoadingError extends NewsState {
  final String msg;
  const NewsLoadingError(this.msg);

  @override
  List<Object> get props => [msg];
}
