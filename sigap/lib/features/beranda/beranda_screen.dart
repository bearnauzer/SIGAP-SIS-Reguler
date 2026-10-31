import 'package:flutter/material.dart';
import 'detail_bencana_screen.dart';
import 'pencarian_screen.dart';
import '../profile/profile_screen.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1345C5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'HALO, SAHABAT SIGAP',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen()));
                        },
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 1.5),
                          ),
                          child: const Center(
                            child: Text(
                              'R',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    '4 lokasi bencana butuh bantuanmu hari ini',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const PencarianScreen()));
                    },
                    child: Container(
                      height: 48,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, color: Colors.grey.shade600, size: 20),
                          const SizedBox(width: 12),
                          Text(
                            'Cari bencana, daerah, atau barang',
                            style: TextStyle(
                              color: Colors.grey.shade500, 
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFF0B1320),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'DAFTAR LOKASI BENCANA',
                      style: TextStyle(
                        color: Color(0xFF93C5FD),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Terdekat',
                        style: TextStyle(
                          color: Color(0xFF1345C5),
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Diurutkan berdasarkan urgensi kebutuhan.',
                      style: TextStyle(
                        color: Colors.grey.shade400,
                        fontSize: 13,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildDisasterCard(
                      context: context,
                      imageUrl: 'https://picsum.photos/seed/landslide/600/300',
                      tagLabel: 'Darurat',
                      tagColor: const Color(0xFF9A3412),
                      tagBgColor: const Color(0xFFFFEDD5),
                      title: 'Longsor Desa Cibeunying',
                      subtitle: 'Kab. Bandung Barat, Jawa Barat - 2 Posko Aktif',
                      item1Label: 'Makanan',
                      item1Value: 'Kurang 420 paket',
                      item1Progress: 0.15,
                      item2Label: 'Air Mineral',
                      item2Value: 'Kurang 310 dus',
                      item2Progress: 0.15,
                      overallPercentage: '15%',
                      overallProgress: 0.15,
                      progressColor: const Color(0xFFF97316),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailBencanaScreen()));
                      },
                    ),
                    const SizedBox(height: 20),
                    _buildDisasterCard(
                      context: context,
                      imageUrl: 'https://picsum.photos/seed/flood/600/300',
                      tagLabel: '',
                      tagColor: Colors.transparent,
                      tagBgColor: Colors.transparent,
                      title: 'Banjir Desa Sukamaju',
                      subtitle: 'Jawa Barat - 2 Posko Aktif',
                      item1Label: 'Air Mineral',
                      item1Value: 'Kurang 150 dus',
                      item1Progress: 0.62,
                      item2Label: 'Makanan',
                      item2Value: 'Kurang 230 paket',
                      item2Progress: 0.62,
                      overallPercentage: '62%',
                      overallProgress: 0.62,
                      progressColor: const Color(0xFF2563EB),
                      onTap: () {},
                    ),
                    const SizedBox(height: 20),
                    _buildPartialThirdCard(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisasterCard({
    required BuildContext context,
    required String imageUrl,
    required String tagLabel,
    required Color tagColor,
    required Color tagBgColor,
    required String title,
    required String subtitle,
    required String item1Label,
    required String item1Value,
    required double item1Progress,
    required String item2Label,
    required String item2Value,
    required double item2Progress,
    required String overallPercentage,
    required double overallProgress,
    required Color progressColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF151F32),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                if (tagLabel.isNotEmpty)
                  Positioned(
                    top: 16,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: tagBgColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        tagLabel,
                        style: TextStyle(
                          color: tagColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFFD3E4FF),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E2B45),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'KEBUTUHAN PALING MENDESAK',
                          style: TextStyle(
                            color: Color(0xFF93C5FD),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 12),
                        _buildProgressRow(item1Label, item1Value, item1Progress, progressColor),
                        const SizedBox(height: 12),
                        _buildProgressRow(item2Label, item2Value, item2Progress, progressColor),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  _buildOverallProgress(overallPercentage, overallProgress, progressColor),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressRow(String label, String value, double progress, Color progressColor) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                color: Color(0xFFF97316),
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Stack(
          children: [
            Container(
              height: 6,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(3),
              ),
            ),
            LayoutBuilder(builder: (context, constraints) {
              return Container(
                height: 6,
                width: constraints.maxWidth * progress,
                decoration: BoxDecoration(
                  color: progressColor,
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildOverallProgress(String percentage, double progress, Color progressColor) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 8,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            LayoutBuilder(builder: (context, constraints) {
              return Container(
                height: 8,
                width: constraints.maxWidth * progress,
                decoration: BoxDecoration(
                  color: progressColor,
                  borderRadius: BorderRadius.circular(4),
                ),
              );
            }),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Kebutuhan terpenuhi',
              style: TextStyle(
                color: Colors.grey.shade300,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              percentage,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPartialThirdCard() {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF1345C5),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'Hampir Terpenuhi',
              style: TextStyle(
                color: Color(0xFF1345C5),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}