import 'package:flutter/material.dart';

class RecommendationsScreen extends StatelessWidget {
  final List<Tenant> tenants = [
    Tenant(name: "أحمد محمد", age: 28, job: "مهندس برمجيات", matchPercentage: 85),
    Tenant(name: "سارة علي", age: 32, job: "محامية", matchPercentage: 78),
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: Text("الترشيحات")),
        body: ListView.builder(
          itemCount: tenants.length,
          itemBuilder: (context, index) {
            final tenant = tenants[index];
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                leading: CircleAvatar(child: Text(tenant.name[0])),
                title: Text(tenant.name),
                subtitle: Text("${tenant.job} - ${tenant.age} سنة"),
                trailing: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${tenant.matchPercentage}%", style: TextStyle(fontWeight: FontWeight.bold)),
                    ElevatedButton(
                      onPressed: () {
                        // Show tenant profile
                      },
                      child:  Text("عرض الملف"),
                    ),
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

class Tenant {
  final String name;
  final int age;
  final String job;
  final int matchPercentage;

  Tenant({
    required this.name,
    required this.age,
    required this.job,
    required this.matchPercentage,
  });
}
