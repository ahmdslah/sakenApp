import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/screens/home_page/cubit/higest_price_cubit.dart';
import 'package:saken_mobile/screens/home_page/cubit/lowest_price_cubit.dart';
import 'package:saken_mobile/screens/home_page/widgets/higest_price.dart';

class HigestPriceListView extends StatelessWidget {
  const HigestPriceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: BlocBuilder<HigestPriceCubit, HigestPriceState>(
        builder: (context, state) {
          if (state is HigestPriceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HigestPriceError) {
            return const Center(child: Text("Failed to load data"));
          } else if (state is HigestPriceSuccess) {
            // Filter out completely invalid items if needed
            final items =
                state.higestPrice.where((item) => item != null).toList();

            if (items.isEmpty) {
              return const Center(child: Text("No properties available"));
            }

            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => HigestPrice(item: items[index]),
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
