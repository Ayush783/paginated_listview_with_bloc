import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pagination_with_bloc/paginated_list/domain/usecase/paginated_listview_usecase.dart';
import 'package:pagination_with_bloc/paginated_list/view/bloc/paginated_listview_bloc.dart';
import 'package:pagination_with_bloc/paginated_list/view/screen/paginated_listview.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaginatedListviewBloc(PaginatedListviewUsecase())
        ..add(FetchDataEvent(offset: 0)),
      child: const MaterialApp(
        home: PaginatedListView(),
      ),
    );
  }
}
