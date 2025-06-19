// 3. My Requests Screen
import 'package:flutter/material.dart';

import '../EditRequestScreen/EditRequestScreen.dart';

class MyRequestsScreen extends StatelessWidget {
  final List<Map<String, String>> requests = [
    {
      'property': 'عقار 1',
      'date': '2025-05-01',
      'status': 'معلق',
    },
    {
      'property': 'عقار 2',
      'date': '2025-04-15',
      'status': 'مقبول',
    },
  ];

  MyRequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('طلباتي')),
      body: ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final request = requests[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(request['property'] ?? ''),
              subtitle: Text(
                  'التاريخ: ${request['date']}\nالحالة: ${request['status']}'),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => EditRequestScreen(
                        selectedProperty: request['property'] ?? '',
                        startDate: request['date'] ?? '',
                        notes: '',
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
