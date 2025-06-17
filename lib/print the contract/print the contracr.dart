import 'package:flutter/material.dart';

class ContractScreen extends StatelessWidget {
  const ContractScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy contract data
    const String tenantName = 'أحمد محمد';
    const String location = 'القاهرة';
    const String startDate = '1 مايو 2025';
    const String endDate = '1 مايو 2026';
    const String rentAmount = '5000 جنيه شهرياً';

    return Scaffold(
      appBar: AppBar(
        title: const Text('عقد السكن'),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('جاري الطباعة...')),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  'عقد إيجار سكن',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(height: 24),
              _buildContractItem('اسم المستأجر:', tenantName),
              _buildContractItem('موقع السكن:', location),
              _buildContractItem('تاريخ بداية العقد:', startDate),
              _buildContractItem('تاريخ نهاية العقد:', endDate),
              _buildContractItem('قيمة الإيجار:', rentAmount),
              const SizedBox(height: 32),
              const Text(
                'الشروط والأحكام:\n'
                '1. يلتزم المستأجر بالحفاظ على العقار.\n'
                '2. يتم دفع الإيجار في بداية كل شهر.\n'
                '3. لا يحق للمستأجر تأجير العقار للغير بدون إذن المالك.',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContractItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        '$title $value',
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
