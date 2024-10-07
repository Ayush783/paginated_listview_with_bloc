part of 'paginated_listview_bloc.dart';

sealed class PaginatedListviewBlocEvent {}

final class FetchDataEvent extends PaginatedListviewBlocEvent {
  final int offset;

  FetchDataEvent({required this.offset});
}
