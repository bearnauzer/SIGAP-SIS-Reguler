import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'status_pembayaran_screen.dart';

const Color _biru = Color(0xFF194CB3);
const Color _oranye = Color(0xFFFF9800);
const Color _latar = Color(0xFFF6F8FB);

class PembayaranScreen extends StatefulWidget {
  final int nominal;

  const PembayaranScreen({super.key, required this.nominal});

  @override
  State<PembayaranScreen> createState() => _PembayaranScreenState();
}

class _PembayaranScreenState extends State<PembayaranScreen> {
  bool _isQris = true;

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
                  'PEMBAYARAN',
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
                    _buildRingkasan(),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _buildTab('QRIS', _isQris, () {
                          setState(() => _isQris = true);
                        }),
                        const SizedBox(width: 10),
                        _buildTab('Transfer Bank', !_isQris, () {
                          setState(() => _isQris = false);
                        }),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _isQris ? _buildQris() : _buildTransfer(),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const StatusPembayaranScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _oranye,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'SIMULASIKAN PEMBAYARAN BERHASIL',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        'Khusus prototype: tombol di atas menggantikan konfirmasi pembayaran dari sistem.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 12,
                          height: 1.4,
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

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  Widget _buildRingkasan() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Donasi Dana · Posko A – Lapangan Cibeunying',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total bayar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                _formatRupiah(widget.nominal),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, bool aktif, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: aktif ? _biru : Colors.white,
          borderRadius: BorderRadius.circular(30),
          border: Border.all(
            color: aktif ? _biru : Colors.grey.shade300,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: aktif ? Colors.white : _biru,
          ),
        ),
      ),
    );
  }

  Widget _buildQris() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Scan kode QR dengan aplikasi pembayaran',
              style: TextStyle(color: Colors.black54, fontSize: 13),
            ),
          ),
          const SizedBox(height: 16),
          Center(
            child: SizedBox(
              width: 150,
              height: 150,
              child: CustomPaint(painter: _QrPainter()),
            ),
          ),
          const SizedBox(height: 16),
          _buildStatusMenunggu(),
        ],
      ),
    );
  }

  Widget _buildTransfer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Transfer ke virtual account berikut',
            style: TextStyle(color: Colors.black54, fontSize: 13),
          ),
          const SizedBox(height: 14),
          const Text(
            'Bank SIGAP (Virtual Account)',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Expanded(
                child: Text(
                  '8277 0812 3456 0401',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: _biru,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.copy, color: _biru),
                onPressed: () {
                  Clipboard.setData(const ClipboardData(text: '8277081234560401'));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Nomor VA disalin')),
                  );
                },
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildStatusMenunggu(),
        ],
      ),
    );
  }

  Widget _buildStatusMenunggu() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'Menunggu pembayaran',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.orange.shade800,
        ),
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

/// Menggambar kode QR tiruan (hanya untuk prototype).
class _QrPainter extends CustomPainter {
  static const int _n = 25;

  bool _isFinder(int r, int c) {
    bool inBox(int r0, int c0) =>
        r >= r0 && r < r0 + 7 && c >= c0 && c < c0 + 7;
    return inBox(0, 0) || inBox(0, _n - 7) || inBox(_n - 7, 0);
  }

  bool _finderDark(int r, int c) {
    int lr = r, lc = c;
    if (r >= _n - 7) lr = r - (_n - 7);
    if (c >= _n - 7) lc = c - (_n - 7);
    final bool outer = lr == 0 || lr == 6 || lc == 0 || lc == 6;
    final bool inner = lr >= 2 && lr <= 4 && lc >= 2 && lc <= 4;
    return outer || inner;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final double cell = size.width / _n;
    final Paint paint = Paint()..color = const Color(0xFF0D2260);

    for (int r = 0; r < _n; r++) {
      for (int c = 0; c < _n; c++) {
        bool dark;
        if (_isFinder(r, c)) {
          dark = _finderDark(r, c);
        } else if ((r == 7 || c == 7 || r == _n - 8 || c == _n - 8) &&
            (r < 8 || c < 8)) {
          dark = false;
        } else {
          dark = ((r * 31 + c * 17 + r * c * 7) % 5) < 2;
        }
        if (dark) {
          canvas.drawRect(
            Rect.fromLTWH(c * cell, r * cell, cell + 0.5, cell + 0.5),
            paint,
          );
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}