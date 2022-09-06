part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class GetNews extends NewsEvent {
  final String page;
  const GetNews(this.page);

  @override
  List<Object> get props => [page];
}
