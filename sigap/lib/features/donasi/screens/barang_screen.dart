import 'package:flutter/material.dart';
import 'barang_metode_penyaluran_screen.dart';

class BarangScreen extends StatefulWidget {
  const BarangScreen({Key? key}) : super(key: key);

  @override
  State<BarangScreen> createState() => _BarangScreenState();
}

class _BarangScreenState extends State<BarangScreen> {
  int selimutCount = 1;
  int obatCount = 1;

  void _incrementSelimut() {
    if (selimutCount < 100) setState(() => selimutCount++);
  }

  void _decrementSelimut() {
    if (selimutCount > 0) setState(() => selimutCount--);
  }

  void _incrementObat() {
    if (obatCount < 50) setState(() => obatCount++);
  }

  void _decrementObat() {
    if (obatCount > 0) setState(() => obatCount--);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1D4ED8),
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'SALURKAN BARANG',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Posko B - Balai Desa Cibeunying',
                    style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hanya barang yang dibutuhkan posko ini. Jumlah dibatasi maksimal sebesar kekurangan.',
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 12, height: 1.5),
                    ),
                    const SizedBox(height: 24),
                    _buildItemCard(
                      title: 'Selimut (pcs)',
                      subtitle: 'Kurang 100 pcs',
                      count: selimutCount,
                      onDecrement: _decrementSelimut,
                      onIncrement: _incrementSelimut,
                    ),
                    const SizedBox(height: 16),
                    _buildItemCard(
                      title: 'Obat-obatan (paket)',
                      subtitle: 'Kurang 50 paket',
                      count: obatCount,
                      onDecrement: _decrementObat,
                      onIncrement: _incrementObat,
                    ),
                    const Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFF97316),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BarangMetodePenyaluranScreen()),
                          );
                        },
                        child: const Text(
                          'LANJUT',
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemCard({
    required String title,
    required String subtitle,
    required int count,
    required VoidCallback onDecrement,
    required VoidCallback onIncrement,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Color(0xFF1D4ED8), fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(subtitle, style: TextStyle(color: Colors.grey.shade600, fontSize: 12)),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: onDecrement,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(color: Color(0xFF1D4ED8), shape: BoxShape.circle),
                  child: const Icon(Icons.remove, color: Colors.white, size: 18),
                ),
              ),
              SizedBox(
                width: 40,
                child: Center(
                  child: Text(
                    count.toString(),
                    style: const TextStyle(color: Color(0xFF0F172A), fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              GestureDetector(
                onTap: onIncrement,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(color: Color(0xFF1D4ED8), shape: BoxShape.circle),
                  child: const Icon(Icons.add, color: Colors.white, size: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}