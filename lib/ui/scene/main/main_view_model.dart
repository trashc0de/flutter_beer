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

  void getData() {
    viewState = ViewState.running;
    data = List();

    notifyListeners();

    Repository.getBeers().then((value) {
      viewState = ViewState.completed;
      this.data = value;
      notifyListeners();
    });
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
