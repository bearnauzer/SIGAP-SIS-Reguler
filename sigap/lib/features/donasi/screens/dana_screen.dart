import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pembayaran_screen.dart';

const Color _biru = Color(0xFF194CB3);
const Color _oranye = Color(0xFFFF9800);
const Color _latar = Color(0xFFF6F8FB);

const int _nominalMinimal = 10000;
const int _nominalMaksimal = 100000000;

class DanaScreen extends StatefulWidget {
  const DanaScreen({super.key});

  @override
  State<DanaScreen> createState() => _DanaScreenState();
}

class _DanaScreenState extends State<DanaScreen> {
  final TextEditingController _controller = TextEditingController();
  int _nominal = 0;

  final List<Map<String, dynamic>> _pilihan = [
    {'label': '50 Ribu', 'value': 50000},
    {'label': '100 Ribu', 'value': 100000},
    {'label': '250 Ribu', 'value': 250000},
    {'label': '500 Ribu', 'value': 500000},
    {'label': '1 Juta', 'value': 1000000},
  ];

  // Nominal valid jika ada di antara batas minimal dan maksimal.
  bool get _valid => _nominal >= _nominalMinimal && _nominal <= _nominalMaksimal;

  // Pesan error hanya muncul setelah user mengetik sesuatu.
  String? get _pesanError {
    if (_controller.text.isEmpty) return null;
    if (_nominal < _nominalMinimal) {
      return 'Minimal donasi ${_formatRupiah(_nominalMinimal)}';
    }
    if (_nominal > _nominalMaksimal) {
      return 'Maksimal donasi ${_formatRupiah(_nominalMaksimal)}';
    }
    return null;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _biru,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DONASI DANA',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Posko A – Lapangan Cibeunying',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: _latar,
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'PILIH NOMINAL',
                      style: TextStyle(
                        color: _biru,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: _pilihan
                          .map((item) => _buildChip(
                                item['label'] as String,
                                item['value'] as int,
                              ))
                          .toList(),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'NOMINAL LAINNYA',
                      style: TextStyle(
                        color: _biru,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    _buildInput(),
                    const SizedBox(height: 16),
                    _buildInfo(),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          _formatRupiah(_nominal),
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: _valid
                            ? () {
                                FocusScope.of(context).unfocus();
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PembayaranScreen(
                                      nominal: _nominal,
                                    ),
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _oranye,
                          disabledBackgroundColor: _oranye.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'LANJUT BAYAR',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, int value) {
    final bool dipilih = _nominal == value;
    return GestureDetector(
      onTap: () {
        setState(() {
          _nominal = value;
          _controller.text = value.toString();
          _controller.selection = TextSelection.fromPosition(
            TextPosition(offset: _controller.text.length),
          );
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: dipilih ? _biru : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: dipilih ? _biru : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: dipilih ? Colors.white : _biru,
          ),
        ),
      ),
    );
  }

  Widget _buildInput() {
    OutlineInputBorder border(Color warna, [double lebar = 1]) {
      return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: warna, width: lebar),
      );
    }

    return TextField(
      controller: _controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(9),
      ],
      onChanged: (text) {
        setState(() {
          _nominal = int.tryParse(text) ?? 0;
        });
      },
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      decoration: InputDecoration(
        hintText: 'Masukkan nominal',
        hintStyle: const TextStyle(color: Colors.black38),
        errorText: _pesanError,
        filled: true,
        fillColor: Colors.white,
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        enabledBorder: border(Colors.grey.shade300),
        focusedBorder: border(_biru, 1.5),
        errorBorder: border(Colors.red.shade400),
        focusedErrorBorder: border(Colors.red.shade400, 1.5),
      ),
    );
  }

  Widget _buildInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: _biru.withOpacity(0.08),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text(
        'Dana akan dikelola langsung oleh Komunitas SIGAP di posko sesuai kebutuhan mendesak.',
        style: TextStyle(color: Colors.black54, fontSize: 13, height: 1.4),
      ),
    );
  }
}

String _formatRupiah(int value) {
  final s = value.toString();
  final buf = StringBuffer();
  for (int i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
    buf.write(s[i]);
  }
  return 'Rp$buf';
}