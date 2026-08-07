import 'package:flutter/material.dart';

// --- PAGE WRAPPER WITH DUMMY DATA ---
class ServiceDetailTrackingPage extends StatelessWidget {
  const ServiceDetailTrackingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        children: [
          // 1. Status Card (Atas)
          const ServiceStatusCard(
            status: 'Proses Service',
            technician: 'Zaki Nabilio',
            admin: 'Danar Riski P',
          ),
          const SizedBox(height: 16),

          // 2. Transaction Detail Card (Tengah)
          const TransactionDetailCard(
            title: 'Detail Transaksi',
            date: '10 Juli 2025',
            branch: 'Jakarta Pusat 2 Cempaka Putih',
            customerName: 'Maulana Iman Pratama',
            device: 'Macbook Pro A1398',
            damage: 'Logicboard konslet jalur power',
            note: 'Unit mati total tanpa pengecekan fungsional',
            action: 'Service Mesin MacBook',
          ),
          const SizedBox(height: 16),

          // 3. Service History Card / Timeline (Bawah)
          const ServiceHistoryCard(
            title: 'Riwayat Service',
            historyItems: [
              ServiceHistoryItemData(
                dateDay: 'Kamis',
                dateFull: '10 Jul 2025',
                title: 'Device diterima',
                description: '[Admin - Danar Riski P]',
                icon: Icons.inventory_2_outlined,
              ),
              ServiceHistoryItemData(
                dateDay: '',
                dateFull: '',
                title: 'Dalam proses antrian',
                description: '[Device dalam proses antrian service]',
                icon: Icons.check_circle_outline,
              ),
              ServiceHistoryItemData(
                dateDay: 'Jumat',
                dateFull: '11 Jul 2025',
                title: 'Device dalam proses service',
                description: '[Teknisi - Zaki Nabilio]',
                icon: Icons.published_with_changes_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ==========================================
// --- REUSABLE COMPONENT 1: STATUS CARD ---
// ==========================================
class ServiceStatusCard extends StatelessWidget {
  final String status;
  final String technician;
  final String admin;
  final double horizontalPadding;
  final double borderRadius;

  const ServiceStatusCard({
    super.key,
    required this.status,
    required this.technician,
    required this.admin,
    this.horizontalPadding = 20,
    this.borderRadius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Chip/Badge
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF2E8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                status,
                style: const TextStyle(
                  color: Colors.orange,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Dotted Line
            Row(
              children: List.generate(
                30,
                (index) => Expanded(
                  child: Container(
                    height: 1,
                    color: index % 2 == 0 ? Colors.grey[300] : Colors.transparent,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Teknisi & Admin Row
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Teknisi',
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        technician,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Admin',
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        admin,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ==========================================
// --- REUSABLE COMPONENT 2: DETAIL CARD ---
// ==========================================
class TransactionDetailCard extends StatelessWidget {
  final String title;
  final String date;
  final String branch;
  final String customerName;
  final String device;
  final String damage;
  final String note;
  final String action;
  final double horizontalPadding;
  final double borderRadius;

  const TransactionDetailCard({
    super.key,
    required this.title,
    required this.date,
    required this.branch,
    required this.customerName,
    required this.device,
    required this.damage,
    required this.note,
    required this.action,
    this.horizontalPadding = 20,
    this.borderRadius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 20),
            _buildDetailRow('Tanggal', date),
            _buildDetailRow('Cabang', branch),
            _buildDetailRow('Nama Cust', customerName),
            _buildDetailRow('Device', device),
            _buildDetailRow('Kerusakan', damage),
            _buildDetailRow('Keterangan', note),
            _buildDetailRow('Tindakan', action, isLast: true),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isLast = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[500],
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ==========================================
// --- REUSABLE COMPONENT 3: HISTORY TIMELINE CARD ---
// ==========================================
class ServiceHistoryItemData {
  final String dateDay;
  final String dateFull;
  final String title;
  final String description;
  final IconData icon;

  const ServiceHistoryItemData({
    required this.dateDay,
    required this.dateFull,
    required this.title,
    required this.description,
    required this.icon,
  });
}

class ServiceHistoryCard extends StatelessWidget {
  final String title;
  final List<ServiceHistoryItemData> historyItems;
  final double horizontalPadding;
  final double borderRadius;

  const ServiceHistoryCard({
    super.key,
    required this.title,
    required this.historyItems,
    this.horizontalPadding = 20,
    this.borderRadius = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: historyItems.length,
              itemBuilder: (context, index) {
                final item = historyItems[index];
                final isLast = index == historyItems.length - 1;

                return IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Date Column
                      SizedBox(
                        width: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (item.dateDay.isNotEmpty)
                              Text(
                                item.dateDay,
                                style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            if (item.dateFull.isNotEmpty)
                              Text(
                                item.dateFull,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[500],
                                ),
                              ),
                          ],
                        ),
                      ),

                      // Timeline Line & Icon Column
                      Column(
                        children: [
                          Icon(
                            item.icon,
                            size: 20,
                            color: Colors.black,
                          ),
                          if (!isLast)
                            Expanded(
                              child: Container(
                                width: 1,
                                margin: const EdgeInsets.symmetric(vertical: 4),
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    return Column(
                                      children: List.generate(
                                        (constraints.maxHeight / 6).floor(),
                                        (i) => Expanded(
                                          child: Container(
                                            color: i % 2 == 0
                                                ? Colors.grey[400]
                                                : Colors.transparent,
                                            width: 1,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(width: 12),

                      // Title & Description Column
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey[700],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                item.description,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}