import 'package:flutter/material.dart';
import '../../beranda/beranda_screen.dart';
import '../../beranda/detail_posko_screen.dart';
import '../../donasi/screens/dana_screen.dart';
import '../../donasi/screens/barang_screen.dart';
import '../../donasi/screens/paket_screen.dart';
import '../../profile/profile_screen.dart';

class BantuScreen extends StatelessWidget {
  const BantuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),
              const SizedBox(height: 20),
              _buildRekomendasiCard(context),
              const SizedBox(height: 20),
              _buildBantuLagiSection(context),
              const SizedBox(height: 10),
              _buildLihatSemuaButton(context),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF1D4ED8),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'BANTU SEKARANG',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Jalan pintas untuk berdonasi',
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: const Text(
                'R',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRekomendasiCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'REKOMENDASI UNTUKMU',
            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.white24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Posko B - Balai Desa Cibeunying', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                const Text('Longsor Desa Cibeunying', style: TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 20),
                const Text('Selimut - Kurang 100 pcs', style: TextStyle(color: Colors.white, fontSize: 12)),
                const SizedBox(height: 10),
                const Text('BANTU DENGAN', style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCategoryButton(context, 'Dana', Icons.money, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DanaScreen()));
                    }),
                    _buildCategoryButton(context, 'Barang', Icons.inventory_2, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BarangScreen()));
                    }),
                    _buildCategoryButton(context, 'Paket', Icons.card_giftcard, () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PaketScreen()));
                    }),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF1D4ED8),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(height: 4),
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBantuLagiSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'BANTU LAGI',
            style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildBantuLagiCard(context, 'Posko A - Lapangan Sukamaju', 'Banjir Desa Sukamaju', 'Terakhir: Donasi Dana Rp250.000'),
          _buildBantuLagiCard(context, 'Posko B - Balai Desa Sukamaju', 'Banjir Desa Sukamaju', 'Terakhir: Donasi Dana Rp50.000'),
          _buildBantuLagiCard(context, 'Posko A - Lapangan Cibeunying', 'Longsor Desa Cibeunying', 'Terakhir: Paket Kebersihan x1'),
        ],
      ),
    );
  }

  Widget _buildBantuLagiCard(BuildContext context, String title, String subtitle, String lastDonation) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white24),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                Text(subtitle, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                const SizedBox(height: 4),
                Text(lastDonation, style: const TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailPoskoScreen()),
              );
            },
            child: const Text('Bantu lagi', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildLihatSemuaButton(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BerandaScreen()),
          );
        },
        child: const Text(
          'Lihat semua lokasi bencana >',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}