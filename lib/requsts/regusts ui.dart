import 'package:flutter/material.dart';

class HousingRequestsScreen extends StatelessWidget {
  const HousingRequestsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dummyRequests = [
      {'name': 'أحمد محمد', 'location': 'القاهرة', 'status': 'قيد الانتظار'},
      {'name': 'سارة علي', 'location': 'الجيزة', 'status': 'تم القبول'},
      {'name': 'محمود حسن', 'location': 'الإسكندرية', 'status': 'مرفوض'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('طلبات السكن'),
      ),
      body: ListView.builder(
        itemCount: dummyRequests.length,
        itemBuilder: (context, index) {
          final request = dummyRequests[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.home),
              title: Text(request['name']!),
              subtitle: Text('الموقع: ${request['location']}'),
              trailing: Text(request['status']!),
              onTap: () {
                // You can navigate to details screen later
              },
            ),
          );
        },
      ),
    );
  }
}
