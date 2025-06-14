import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApartmentsScreen extends StatelessWidget {
  final List<Apartment> apartments = [
    Apartment(name: "شقة فاخرة", city: "القاهرة", price: 5000, imageUrl: "assets/apartment1.jpg"),
    Apartment(name: "شقة متوسطة", city: "الإسكندرية", price: 3000, imageUrl: "assets/apartment2.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("المساكن"),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Navigate to add apartment screen
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: apartments.length,
          itemBuilder: (context, index) {
            final apartment = apartments[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                leading: Image.asset(apartment.imageUrl, width: 60, fit: BoxFit.cover),
                title: Text(apartment.name),
                subtitle: Text("${apartment.city} - ${apartment.price} ج.م / شهر"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(icon: Icon(Icons.edit), onPressed: () {
                      // Navigate to edit screen
                    }),
                    IconButton(icon: Icon(Icons.delete), onPressed: () {
                      // Delete confirmation
                    }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Apartment {
  final String name;
  final String city;
  final int price;
  final String imageUrl;

  Apartment({
    required this.name,
    required this.city,
    required this.price,
    required this.imageUrl,
  });
}
