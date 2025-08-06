import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/screens/home_page/cubit/sakan_cubit.dart';
import 'package:saken_mobile/screens/home_page/widgets/sakan_details_in_home.dart';

class SakanListView extends StatelessWidget {
  const SakanListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: BlocBuilder<SakanCubit, SakanState>(
        builder: (context, state) {
          if (state is SakanLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SakanErorr) {
            return const Center(child: Text("Failed to load data"));
          } else if (state is SakanSuccess) {
            final items = state.sakan.where((item) => item != null).toList();

            if (items.isEmpty) {
              return const Center(child: Text("No properties available"));
            }

            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  SakanDetailsInHome(item: items[index]),
              separatorBuilder: (context, index) => const SizedBox(width: 10),
              itemCount: items.length,
            );
          }
          return const Center(child: Text("Loading..."));
        },
      ),
    );
  }
}
