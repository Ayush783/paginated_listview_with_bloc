import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:pagination_with_bloc/paginated_list/domain/entity/product_entity.dart';
import 'package:pagination_with_bloc/paginated_list/domain/usecase/paginated_listview_usecase.dart';

part 'paginated_listview_bloc_event.dart';
part 'paginated_listview_bloc_state.dart';

class PaginatedListviewBloc
    extends Bloc<PaginatedListviewBlocEvent, PaginatedListviewBlocState> {
  static const _logName = 'PaginatedListviewBlocBloc';

  final PaginatedListviewUsecase _usecase;

  PaginatedListviewBloc(this._usecase) : super(PaginatedListviewBlocState()) {
    on<PaginatedListviewBlocEvent>((event, emit) {});

    on<FetchDataEvent>(_onFetchData);
  }

  void _onFetchData(
      FetchDataEvent event, Emitter<PaginatedListviewBlocState> emit) async {
    try {
      log('Fetching data ${event.offset}', name: _logName);
      emit(state.copyWith(isLoading: true, errorMessage: ''));

      final products = await _usecase.fetchData(event.offset);
      emit(state.copyWith(
          products: [...state.products, ...products], isLoading: false));
    } catch (e) {
      log('Error fetching data $e', name: _logName);
      emit(state.copyWith(errorMessage: e.toString(), isLoading: false));
    }
  }
}
