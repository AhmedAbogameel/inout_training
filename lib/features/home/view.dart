import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inout_training/features/home/cubit.dart';
import 'package:inout_training/widgets/loading_indicator.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCurrentWeather(),
      child: Scaffold(
        appBar: AppBar(),
        body: SizedBox(
          width: double.infinity,
          child: BlocBuilder<HomeCubit, HomeStates>(
            builder: (context, state) {
              final cubit = HomeCubit.of(context);
              final weather = cubit.weather;
              return state is HomeLoading ? LoadingIndicator() : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(weather!.main!.temp!.toString(), style: Theme.of(context).textTheme.headline5),
                  Text(weather.weather!.first.main!, style: Theme.of(context).textTheme.headline5),
                  Text(weather.name!, style: Theme.of(context).textTheme.headline5),
                  Text(weather.sys!.country!, style: Theme.of(context).textTheme.headline5),
                  Text(DateTime.fromMillisecondsSinceEpoch(weather.sys!.sunrise!).toString(), style: Theme.of(context).textTheme.headline5),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
