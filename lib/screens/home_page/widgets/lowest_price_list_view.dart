import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/screens/home_page/cubit/lowest_price_cubit.dart';
import 'package:saken_mobile/screens/home_page/widgets/lowest_price.dart';

class LowestPriceListView extends StatelessWidget {
  const LowestPriceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: BlocBuilder<LowestPriceCubit, LowestPriceState>(
        builder: (context, state) {
          if (state is LowestPriceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is LowestPriceErorr) {
            return const Center(child: Text("Failed to load data"));
          } else if (state is LowestPriceSuccess) {
            // Filter out completely invalid items if needed
            final items =
                state.lowestPrice.where((item) => item != null).toList();

            if (items.isEmpty) {
              return const Center(child: Text("No properties available"));
            }

            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => LowestPrice(item: items[index]),
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
