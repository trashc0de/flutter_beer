import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ItemBeerWidget.dart';
import 'main_view_model.dart';

class MainScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is main screen"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => MainViewModel(),
        child: MainScreenBody(),
      ),
      //MainScreenBody(),
    );
  }
}

class MainScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MainViewModel>(context);

    return Container(
      child: getBody(viewModel),
    );
  }

  Widget getBody(MainViewModel viewModel) {
    final MainViewState viewState = viewModel.getState();

    switch (viewState.state) {
      case ViewState.empty:
        {
          viewModel.getData();

          return getEmpty();
        }
        break;

      case ViewState.running:
        {
          return getLoading();
        }
        break;

      case ViewState.completed:
        {
          return getDataContainer(viewState);
        }
        break;

      case ViewState.error:
        {}
        break;
    }

    return getLoading();
  }

  Widget getEmpty() {
    return Center();
  }

  Widget getLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Container getDataContainer(MainViewState viewState) {
    return Container(
      width: double.infinity,
      height: 300,
      child: ListView.builder(
          itemCount: viewState.listBeers.length,
          itemBuilder: (context, index) {
            return ItemBeerWidget(
              data: viewState.listBeers[index],
            );
          }),
    );
  }
}
