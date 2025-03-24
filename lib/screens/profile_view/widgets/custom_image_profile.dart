import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/profile_view/cubit/image_picker_cubit.dart';

class CustomImageProfile extends StatelessWidget {
  const CustomImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImagePickerCubit, ImagePickerState>(
      builder: (context, state) {
        final cubit = context.read<ImagePickerCubit>();
        return Center(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: cubit.selectedImage != null
                    ? MemoryImage(
                        cubit.selectedImage!) // Display selected image
                    : null, // No image, default background
                child: cubit.selectedImage == null
                    ? const Icon(Icons.person, size: 50, color: Colors.white)
                    : null,
              ),
              Positioned(
                bottom: 6,
                child: GestureDetector(
                  onTap: () {
                    cubit.pickkImage();
                  },
                  child: const CircleAvatar(
                    backgroundColor: font1,
                    radius: 12,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
