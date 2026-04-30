import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // State
  bool _isPasswordVisible = false;
  String _selectedRole = 'Penjual'; // default selected
  bool _isLoading = false;

  final List<String> _roles = ['Pembeli', 'Peternak', 'Penjual'];

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() async {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Email dan kata sandi tidak boleh kosong')),
      );
      return;
    }

    setState(() => _isLoading = true);

    // TODO: ganti dengan API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() => _isLoading = false);

// Navigasi setelah login berhasil
    Navigator.pushReplacementNamed(context, '/home');
  }

  void _onForgotPassword() {
    // TODO: navigasi ke halaman lupa sandi
    // Navigator.pushNamed(context, '/forgot-password');
  }

  void _onRegister() {
    // TODO: navigasi ke halaman daftar
    // Navigator.pushNamed(context, '/register');
  }

  void _onGoogleLogin() {
    // TODO: implementasi Google Sign-In
  }

  void _onFacebookLogin() {
    // TODO: implementasi Facebook Login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              // Dekorasi lingkaran hijau di pojok kanan atas
              Positioned(
                left: 200,
                top: -80,
                child: Container(
                  width: 256,
                  height: 256,
                  decoration: BoxDecoration(
                    color: const Color(0x333CE36A),
                    shape: BoxShape.circle,
                  ),
                ),
              ),

              // Konten utama
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo / Judul
                    const Text(
                      'ResQFood',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF006E2A),
                        fontSize: 40,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.80,
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Subtitle
                    const Text(
                      'Selamatkan makanan, kurangi limbah,\nberdayakan komunitas.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF3C4A3C),
                        fontSize: 14,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1.43,
                      ),
                    ),

                    const SizedBox(height: 18),

                    // Pilih Peran
                    _buildRoleSelector(),

                    const SizedBox(height: 18),

                    // Form Card
                    _buildFormCard(),

                    const SizedBox(height: 18),

                    // Daftar di sini
                    GestureDetector(
                      onTap: _onRegister,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Belum punya akun? ',
                              style: TextStyle(
                                color: Color(0xFF3C4A3C),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 1.43,
                              ),
                            ),
                            const TextSpan(
                              text: 'Daftar di sini',
                              style: TextStyle(
                                color: Color(0xFF006E2A),
                                fontSize: 14,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─── Widget: Role Selector ───────────────────────────────────────────────────

  Widget _buildRoleSelector() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Pilih Peran Anda',
          style: TextStyle(
            color: Color(0xFF6C7B6A),
            fontSize: 12,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: _roles.map((role) {
            final isSelected = _selectedRole == role;
            return Expanded(
              child: GestureDetector(
                onTap: () => setState(() => _selectedRole = role),
                child: Container(
                  margin: EdgeInsets.only(
                    right: role != _roles.last ? 8 : 0,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: isSelected ? 2 : 1,
                        color: isSelected
                            ? const Color(0xFF006E2A)
                            : const Color(0xFFBBCBB8),
                      ),
                    ),
                  ),
                  child: Text(
                    role,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: isSelected
                          ? const Color(0xFF004C1B)
                          : const Color(0xFF191C1D),
                      fontSize: 12,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  // ─── Widget: Form Card ───────────────────────────────────────────────────────

  Widget _buildFormCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: const Color(0xFFEDEEEF)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0C000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Email Field
          _buildEmailField(),

          const SizedBox(height: 16),

          // Password Field
          _buildPasswordField(),

          const SizedBox(height: 16),

          // Tombol Masuk
          _buildLoginButton(),

          const SizedBox(height: 16),

          // Divider "atau masuk dengan"
          _buildDivider(),

          const SizedBox(height: 16),

          // Tombol Social Login
          _buildSocialButtons(),
        ],
      ),
    );
  }

  // ─── Widget: Email Field ─────────────────────────────────────────────────────

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Alamat Email',
          style: TextStyle(
            color: Color(0xFF191C1D),
            fontSize: 14,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.14,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          style: const TextStyle(
            color: Color(0xFF191C1D),
            fontSize: 14,
            fontFamily: 'Inter',
          ),
          decoration: InputDecoration(
            hintText: 'nama@email.com',
            hintStyle: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 14,
              fontFamily: 'Inter',
            ),
            prefixIcon: const Icon(Icons.email_outlined, color: Color(0xFF6B7280), size: 20),
            filled: true,
            fillColor: const Color(0xFFF3F4F5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          ),
        ),
      ],
    );
  }

  // ─── Widget: Password Field ──────────────────────────────────────────────────

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Kata Sandi',
              style: TextStyle(
                color: Color(0xFF191C1D),
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                letterSpacing: 0.14,
              ),
            ),
            GestureDetector(
              onTap: _onForgotPassword,
              child: const Text(
                'Lupa Sandi?',
                style: TextStyle(
                  color: Color(0xFF006E2A),
                  fontSize: 12,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          style: const TextStyle(
            color: Color(0xFF191C1D),
            fontSize: 14,
            fontFamily: 'Inter',
          ),
          decoration: InputDecoration(
            hintText: '••••••••',
            hintStyle: const TextStyle(
              color: Color(0xFF6B7280),
              fontSize: 14,
              fontFamily: 'Inter',
            ),
            prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFF6B7280), size: 20),
            suffixIcon: GestureDetector(
              onTap: () => setState(() => _isPasswordVisible = !_isPasswordVisible),
              child: Icon(
                _isPasswordVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                color: const Color(0xFF6B7280),
                size: 20,
              ),
            ),
            filled: true,
            fillColor: const Color(0xFFF3F4F5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          ),
        ),
      ],
    );
  }

  // ─── Widget: Login Button ────────────────────────────────────────────────────

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _onLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF006E2A),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: const StadiumBorder(),
          elevation: 4,
          shadowColor: const Color(0x19006E2A),
        ),
        child: _isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : const Text(
                'Masuk Sekarang',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.14,
                ),
              ),
      ),
    );
  }

  // ─── Widget: Divider ─────────────────────────────────────────────────────────

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFFBBCBB8),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'atau masuk dengan',
            style: TextStyle(
              color: Color(0xFF6C7B6A),
              fontSize: 12,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 1,
            color: const Color(0xFFBBCBB8),
          ),
        ),
      ],
    );
  }

  // ─── Widget: Social Login Buttons ────────────────────────────────────────────

  Widget _buildSocialButtons() {
    return Row(
      children: [
        // Google
        Expanded(
          child: _buildSocialButton(
            label: 'Google',
            icon: Icons.g_mobiledata,
            onTap: _onGoogleLogin,
          ),
        ),
        const SizedBox(width: 12),
        // Facebook
        Expanded(
          child: _buildSocialButton(
            label: 'Facebook',
            icon: Icons.facebook,
            onTap: _onFacebookLogin,
          ),
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required String label,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFBBCBB8)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: const Color(0xFF191C1D)),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: Color(0xFF191C1D),
                fontSize: 12,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}