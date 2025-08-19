import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';
import 'package:saken_mobile/screens/home_page/models/sakan_model/sakan_model.dart';

class SakanDetailsInHome extends StatelessWidget {
  const SakanDetailsInHome({
    super.key,
    required this.item,
  });
  final SakanModel item;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color(0xffF8F8F8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 135,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: item.photoUrl != null && item.photoUrl!.isNotEmpty
                          ? NetworkImage(item.photoUrl!)
                          : const AssetImage('assets/images/roomm.jpg')
                              as ImageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // أيقونة القلب من فوق على الشمال
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white70,
                      shape: BoxShape.circle,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Icon(
                        CupertinoIcons.heart,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                // النص من تحت على الشمال
                Positioned(
                  bottom: 8,
                  right: 8,
                  child: Container(
                    color: Colors.black54,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    child: const Row(
                      children: [
                        Text(
                          '4.5',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        Icon(
                          CupertinoIcons.star_fill,
                          color: Colors.amber,
                          size: 12,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(item.housingType ?? ''),
                const Spacer(),
                Text(
                  '${item.pricePerMeter} ج.م/شهر',
                  style: const TextStyle(color: kPrimaryColor),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.location_on_outlined,
                  size: 20,
                ),
                Text(
                  item.address ?? '',
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                const Icon(Icons.bed_outlined),
                const SizedBox(
                  width: 5,
                ),
                Text('${item.floor} غرفة'),
                const Spacer(),
                const Icon(
                  Icons.bookmark,
                  color: Colors.amber,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
