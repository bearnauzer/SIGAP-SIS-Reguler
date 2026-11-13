import 'package:flutter/material.dart';
import 'detail_posko_screen.dart'; // Sesuaikan lokasi import

class DetailBencanaScreen extends StatelessWidget {
  const DetailBencanaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF194CB3),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Color(0xFFF6F8FB),
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Longsor Desa Cibeunying',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF102851)),
            ),
            const SizedBox(height: 4),
            const Text(
              '210 warga terdampak · 2 posko aktif',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 16),
            const Text(
              'Tiap posko punya kondisi & kebutuhan berbeda. Pilih posko yang ingin kamu bantu untuk lihat kebutuhan spesifiknya.',
              style: TextStyle(color: Colors.black54, fontSize: 13, height: 1.4),
            ),
            const SizedBox(height: 24),
            
            // Card Posko B
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailPoskoScreen()),
                );
              },
              child: _buildPoskoCard(
                title: 'Posko B – Balai Desa Cibeunying',
                subtitle: 'Fokus perlengkapan & kesehatan',
                badgeText: 'Darurat',
                badgeColor: Colors.orange.shade100,
                badgeTextColor: Colors.deepOrange,
                items: [
                  _buildProgress('Selimut', 'Kurang 100 pcs', 0.2, Colors.orange),
                  _buildProgress('Obat-obatan', 'Kurang 50 paket', 0.2, Colors.orange),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            // Card Posko A
            _buildPoskoCard(
              title: 'Posko A – Lapangan Cibeunying',
              subtitle: 'Fokus logistik pangan & air',
              badgeText: '',
              items: [
                _buildProgress('Makanan', 'Kurang 230 paket', 0.4, const Color(0xFF194CB3)),
                _buildProgress('Air Mineral', 'Kurang 150 dus', 0.4, const Color(0xFF194CB3)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPoskoCard({
    required String title,
    required String subtitle,
    required String badgeText,
    Color? badgeColor,
    Color? badgeTextColor,
    required List<Widget> items,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 4)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF194CB3)),
                ),
              ),
              if (badgeText.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: badgeColor, borderRadius: BorderRadius.circular(12)),
                  child: Text(badgeText, style: TextStyle(color: badgeTextColor, fontSize: 11, fontWeight: FontWeight.bold)),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 16),
          ...items,
        ],
      ),
    );
  }

  Widget _buildProgress(String label, String value, double progress, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
              Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 6),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Colors.grey.shade200,
            valueColor: AlwaysStoppedAnimation<Color>(color),
            minHeight: 6,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
    );
  }
}