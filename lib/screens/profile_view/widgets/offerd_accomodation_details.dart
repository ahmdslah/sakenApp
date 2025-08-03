import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saken_mobile/const/const.dart';

class OfferdAccomodationDetails extends StatelessWidget {
  const OfferdAccomodationDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
                  height: 146,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/roomm.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {
                        // TODO: Add share functionality here
                      },
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              children: [
                Text(
                  'شقة للايجار',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.more_horiz,
                  size: 19,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 20,
                ),
                Text(
                  'حي شرق, اسكندرية',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              children: [
                Icon(
                  Icons.bed_outlined,
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '2 غرفة',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.bathroom_outlined,
                  size: 20,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  '1 حمام',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Row(
              children: [
                Text(
                  '4.5',
                  style: TextStyle(fontSize: 12),
                ),
                Icon(
                  CupertinoIcons.star_fill,
                  color: Colors.amber,
                  size: 12,
                ),
                Spacer(),
                Text(
                  '\$4000.0',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}