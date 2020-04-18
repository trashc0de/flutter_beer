import 'package:flutter/material.dart';
import 'package:flutterapp/data/repository.dart';
import 'package:flutterapp/domain/beer.dart';
import 'package:provider/provider.dart';

class MainViewModel extends ChangeNotifier {
  ViewState viewState = ViewState.empty;
  List<Beer> data = List();

  MainViewState getState() {
    return MainViewState(
      state: viewState,
      listBeers: data,
    );
  }

  void getData() async {
    viewState = ViewState.running;
    data = List();


    final beers = await Repository.getBeers();

    viewState = ViewState.completed;
    this.data = beers;
    notifyListeners();
  }
}

class MainViewState {
  final ViewState state;
  final List<Beer> listBeers;

  MainViewState({
    this.state,
    this.listBeers,
  });
}

enum ViewState {
  empty,
  completed,
  running,
  error,
}
