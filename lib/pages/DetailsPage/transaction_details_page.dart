import 'package:flutter/material.dart';
import 'package:ifixied_membership_app/ui/components/app_bar_component.dart';

class TransactionDetailPage extends StatelessWidget {
  const TransactionDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarComponent(
        title: "Detail Transaksi",
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 24),
          child: TransactionDetailCard(
            orderId: '#SRV28-202507-0175',
            date: '10 Juli 2025',
            branch: 'Jakarta Pusat 2 Cempaka Putih',
            customerName: 'Maulana Iman Pratama',
            device: 'Macbook Pro A1398',
            damage: 'Logicboard konslet jalur power',
            note: 'Unit mati total tanpa pengecekan fungsional',
            action: 'Service Mesin MacBook',
            status: 'Proses Service',
            totalPayment: 'Rp1.750.000',
            paidPaymentNote: 'Keterangan: Terbayar Rp500.000',
            watermarkText: 'TERDP',
          ),
        ),
      ),
    );
  }
}

class TransactionDetailCard extends StatefulWidget {
  final String orderId;
  final String date;
  final String branch;
  final String customerName;
  final String device;
  final String damage;
  final String note;
  final String action;
  final String status;
  final String totalPayment;
  final String paidPaymentNote;
  final String watermarkText;
  final double horizontalPadding;
  final double borderRadius;
  final VoidCallback? onTap;

  const TransactionDetailCard({
    super.key,
    required this.orderId,
    required this.date,
    required this.branch,
    required this.customerName,
    required this.device,
    required this.damage,
    required this.note,
    required this.action,
    required this.status,
    required this.totalPayment,
    required this.paidPaymentNote,
    this.watermarkText = 'TERDP',
    this.horizontalPadding = 20,
    this.borderRadius = 24,
    this.onTap,
  });

  @override
  State<TransactionDetailCard> createState() =>
      _TransactionDetailCardState();
}

class _TransactionDetailCardState
    extends State<TransactionDetailCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius:
                BorderRadius.circular(widget.borderRadius),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 24,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Center(
                  child: Transform.rotate(
                    angle: -0.3,
                    child: Text(
                      widget.watermarkText,
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.w900,
                        color: Colors.orange.withOpacity(0.12),
                        letterSpacing: 4,
                      ),
                    ),
                  ),
                ),
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2C2C2C),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),

                  const SizedBox(height: 16),

                  Text(
                    widget.orderId,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                  ),

                  const SizedBox(height: 24),

                  _buildDetailRow("Tanggal", widget.date),
                  _buildDetailRow("Cabang", widget.branch),
                  _buildDetailRow("Nama Cust", widget.customerName),
                  _buildDetailRow("Device", widget.device),
                  _buildDetailRow("Kerusakan", widget.damage),
                  _buildDetailRow("Keterangan", widget.note),
                  _buildDetailRow("Tindakan", widget.action),
                  _buildDetailRow(
                    "Status",
                    widget.status,
                    valueColor: Colors.orange,
                    isBold: true,
                  ),

                  const SizedBox(height: 16),

                  Row(
                    children: List.generate(
                      30,
                      (index) => Expanded(
                        child: Container(
                          height: 1,
                          color: index.isEven
                              ? Colors.grey.shade300
                              : Colors.transparent,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    "Total Pembayaran",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    widget.totalPayment,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w900,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    widget.paidPaymentNote,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(
    String label,
    String value, {
    Color valueColor = Colors.black,
    bool isBold = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontSize: 13,
                color: valueColor,
                fontWeight:
                    isBold ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}