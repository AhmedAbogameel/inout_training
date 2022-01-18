import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inout_training/features/search/cubit.dart';
import 'package:inout_training/widgets/loading_indicator.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(),
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Builder(
              builder: (context) {
                final cubit = SearchCubit.of(context);
                return TextField(
                  onSubmitted: cubit.search,
                );
              }
            ),
            BlocBuilder<SearchCubit, SearchStates>(
              builder: (context, state) {
                final cubit = SearchCubit.of(context);
                if(state is SearchLoading){
                  return LoadingIndicator();
                } else if(cubit.weather == null){
                  return Center(
                    child: Text('Can\'t find city!'),
                  );
                }else {
                  final weather = cubit.weather!;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(weather.main!.temp!.toString(), style: Theme.of(context).textTheme.headline5),
                      Text(weather.weather!.first.main!, style: Theme.of(context).textTheme.headline5),
                      Text(weather.name!, style: Theme.of(context).textTheme.headline5),
                      Text(weather.sys!.country!, style: Theme.of(context).textTheme.headline5),
                      Text(DateTime.fromMillisecondsSinceEpoch(weather.sys!.sunrise!).toString(), style: Theme.of(context).textTheme.headline5),
                    ],
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
