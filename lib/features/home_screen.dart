import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFFCF9F8)),
        child: Stack(
          children: [
            // App Bar
            const Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: _AppBar(),
            ),

            // Main Content (Bisa di-scroll)
            Positioned(
              left: 0,
              top: 56,
              right: 0,
              bottom: 64,
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                  top: 16,
                  left: 16,
                  right: 16,
                  bottom: 32,
                ),
                child: Center(
                  child: ConstrainedBox(
                    // Maksimal lebar konten agar tidak terlalu melebar di web
                    constraints: const BoxConstraints(maxWidth: 600),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const _SearchBar(),
                        const SizedBox(height: 24),
                        const _FilterChips(),
                        const SizedBox(height: 24),
                        const _FoodItemCard(
                          title: 'Nasi Bungkus Ayam Bakar',
                          status: 'LAYAK KONSUMSI',
                          statusColor: Color(0xFF0D631B),
                          statusBgColor: Color(0x192E7D32),
                          location: 'Kebon Jeruk, Jakarta Barat',
                          quantity: '25 Bungkus (12.5 kg)',
                          price: 'GRATIS',
                          buttonText: 'Distribusi',
                          isFree: true,
                        ),
                        const SizedBox(height: 16),
                        const _FoodItemCard(
                          title: 'Sayuran Segar Sisa Display',
                          status: 'PAKAN TERNAK',
                          statusColor: Color(0xFF795900),
                          statusBgColor: Color(0x19FEC330),
                          location: 'Pasar Minggu, Jakarta Selatan',
                          quantity: '50 kg',
                          price: 'Rp 5.000/kg',
                          buttonText: 'Ambil',
                          isFree: false,
                        ),
                        const SizedBox(height: 16),
                        const _FoodItemCard(
                          title: 'Roti Tawar Gandum',
                          status: 'LAYAK KONSUMSI',
                          statusColor: Color(0xFF0D631B),
                          statusBgColor: Color(0x192E7D32),
                          location: 'Serpong, Tangerang',
                          quantity: 'Exp: 24 Jam lagi',
                          price: 'GRATIS',
                          buttonText: 'Distribusi',
                          isFree: true,
                        ),
                        const SizedBox(height: 16),
                        const _FoodItemCard(
                          title: 'Ampas Tahu Curah',
                          status: 'PAKAN TERNAK',
                          statusColor: Color(0xFF795900),
                          statusBgColor: Color(0x19FEC330),
                          location: 'Ciledug, Tangerang',
                          quantity: '120 kg',
                          price: 'Rp 2.000/kg',
                          buttonText: 'Ambil',
                          isFree: false,
                        ),
                        const SizedBox(height: 24),
                        const _StatisticsCard(),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // FAB Button
            Positioned(
              right: 16,
              bottom: 80,
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tambah makanan')),
                  );
                },
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF0D631B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ),
            ),

            // Bottom Navigation Bar
            const Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              child: _BottomNavBar(),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== APP BAR ====================

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFFE4E4E7),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Menu')),
              );
            },
            child: const Icon(Icons.menu, color: Color(0xFF166534)),
          ),
          const Flexible(
            child: Text(
              'RESQFOOD Distribution',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Color(0xFF166534),
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                letterSpacing: -0.45,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Notifikasi')),
              );
            },
            child: const Icon(Icons.notifications_none, color: Color(0xFF166534)),
          ),
        ],
      ),
    );
  }
}

// ==================== SEARCH BAR ====================

class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Buka pencarian')),
        );
      },
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFBFCABA)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Row(
          children: [
            Icon(Icons.search, color: Color(0xFF6B7280)),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                'Cari makanan untuk didistribusikan...',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Color(0xFF6B7280),
                  fontSize: 14,
                  fontFamily: 'Inter',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== FILTER CHIPS ====================

class _FilterChips extends StatefulWidget {
  const _FilterChips();

  @override
  State<_FilterChips> createState() => _FilterChipsState();
}

class _FilterChipsState extends State<_FilterChips> {
  String _selectedFilter = 'LAYAK KONSUMSI';
  final List<String> _filters = ['SEMUA', 'LAYAK KONSUMSI', 'PAKAN TERNAK', 'KOMPOS'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _filters.map((filter) {
          final isActive = _selectedFilter == filter;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedFilter = filter;
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Filter: $filter')),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: ShapeDecoration(
                  color: isActive ? const Color(0xFF0D631B) : const Color(0xFFF6F3F2),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: isActive ? const Color(0xFF0D631B) : const Color(0xFFBFCABA),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  filter,
                  style: TextStyle(
                    color: isActive ? Colors.white : const Color(0xFF1B1C1C),
                    fontSize: 14,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

// ==================== FOOD ITEM CARD ====================

class _FoodItemCard extends StatelessWidget {
  final String title;
  final String status;
  final Color statusColor;
  final Color statusBgColor;
  final String location;
  final String quantity;
  final String price;
  final String buttonText;
  final bool isFree;

  const _FoodItemCard({
    required this.title,
    required this.status,
    required this.statusColor,
    required this.statusBgColor,
    required this.location,
    required this.quantity,
    required this.price,
    required this.buttonText,
    required this.isFree,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Detail: $title')),
        );
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color(0xFFBFCABA)),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title and Status
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF1B1C1C),
                      fontSize: 16,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: ShapeDecoration(
                    color: statusBgColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: statusColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: ShapeDecoration(
                          color: statusColor,
                          shape: const CircleBorder(),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 10,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            // Location
            Row(
              children: [
                const Icon(Icons.location_on, size: 16, color: Color(0xFF40493D)),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    location,
                    style: const TextStyle(
                      color: Color(0xFF40493D),
                      fontSize: 14,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Quantity
            Row(
              children: [
                const Icon(Icons.inventory_2_outlined, size: 16, color: Color(0xFF40493D)),
                const SizedBox(width: 4),
                Text(
                  quantity,
                  style: const TextStyle(
                    color: Color(0xFF40493D),
                    fontSize: 14,
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Divider
            const Divider(color: Color(0xFFBFCABA)),

            const SizedBox(height: 16),

            // Price and Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: TextStyle(
                    color: isFree ? const Color(0xFF0D631B) : const Color(0xFF1B1C1C),
                    fontSize: 16,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$buttonText: $title')),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D631B),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      buttonText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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

// ==================== BOTTOM NAVIGATION BAR ====================

class _BottomNavBar extends StatefulWidget {
  const _BottomNavBar();

  @override
  State<_BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<_BottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Color(0xFFE4E4E7),
          ),
        ),
      ),
      child: Row(
        children: [
          _buildNavItem(Icons.home, 'HOME', 0),
          _buildNavItem(Icons.dashboard_outlined, 'DASHBOARD', 1),
          _buildNavItem(Icons.notifications_outlined, 'ALERTS', 2),
          _buildNavItem(Icons.person_outline, 'PROFILE', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isActive = _selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Menu: $label')),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? const Color(0xFF166534) : const Color(0xFF71717A),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isActive ? const Color(0xFF166534) : const Color(0xFF71717A),
                fontSize: 11,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                letterSpacing: 0.55,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== STATISTICS CARD ====================

class _StatisticsCard extends StatelessWidget {
  const _StatisticsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF2E7D32),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Statistik Hari Ini',
            style: TextStyle(
              color: Color(0xFFCBFFC2),
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 4),
          Text(
            '2,450kg makanan telah berhasil\ntteredistribusi hari ini.',
            style: TextStyle(
              color: Color(0xFFCBFFC2),
              fontSize: 14,
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }
}