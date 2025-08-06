import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/screens/home_page/cubit/active_offer_cubit.dart';
import 'package:saken_mobile/screens/home_page/widgets/active_offer.dart';

class ActiveOfferListView extends StatelessWidget {
  const ActiveOfferListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: BlocBuilder<ActiveOfferCubit, ActiveOfferState>(
        builder: (context, state) {
          if (state is ActiveOfferLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ActiveOfferErorr) {
            return const Center(child: Text("Failed to load data"));
          } else if (state is ActiveOfferSuccess) {
            // Filter out completely invalid items if needed
            final items =
                state.activeOffer.where((item) => item != null).toList();

            if (items.isEmpty) {
              return const Center(child: Text("No properties available"));
            }

            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ActiveOffer(item: items[index]),
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