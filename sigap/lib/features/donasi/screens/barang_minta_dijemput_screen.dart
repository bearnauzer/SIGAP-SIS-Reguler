import 'package:flutter/material.dart';
import 'barang_sukses_jadwal_screen.dart';

class BarangMintaDijemputScreen extends StatefulWidget {
  const BarangMintaDijemputScreen({Key? key}) : super(key: key);

  @override
  State<BarangMintaDijemputScreen> createState() => _BarangMintaDijemputScreenState();
}

class _BarangMintaDijemputScreenState extends State<BarangMintaDijemputScreen> {
  String selectedJadwal = 'Hari ini, siang';

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
                    'MINTA DIJEMPUT',
                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Isi data penjemputan',
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
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('NAMA PENERIMA BARANG'),
                      _buildTextField('Nama kamu', 1),
                      const SizedBox(height: 16),
                      _buildLabel('ALAMAT LENGKAP'),
                      _buildTextField('Jalan, nomor rumah, RT/RW, kelurahan, kecamatan', 3),
                      const SizedBox(height: 16),
                      _buildLabel('NO. HP AKTIF'),
                      _buildTextField('08xx-xxxx-xxxx', 1),
                      const SizedBox(height: 16),
                      _buildLabel('JADWAL PENJEMPUTAN'),
                      Wrap(
                        spacing: 8,
                        children: [
                          _buildJadwalChip('Hari ini, siang'),
                          _buildJadwalChip('Hari ini, sore'),
                          _buildJadwalChip('Besok pagi'),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildLabel('CATATAN (OPSIONAL)'),
                      _buildTextField('Contoh: titip di pos satpam jika tidak ada orang', 2),
                      const SizedBox(height: 24),
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
                              MaterialPageRoute(builder: (context) => const BarangSuksesJadwalScreen()),
                            );
                          },
                          child: const Text(
                            'KONFIRMASI PENJEMPUTAN',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: const TextStyle(color: Color(0xFF1D4ED8), fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1.0),
      ),
    );
  }

  Widget _buildTextField(String hint, int lines) {
    return TextField(
      maxLines: lines,
      style: const TextStyle(color: Colors.black87, fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF1D4ED8), width: 2),
        ),
      ),
    );
  }

  Widget _buildJadwalChip(String label) {
    bool isSelected = selectedJadwal == label;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedJadwal = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF1D4ED8) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: isSelected ? const Color(0xFF1D4ED8) : Colors.grey.shade300),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade600,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}