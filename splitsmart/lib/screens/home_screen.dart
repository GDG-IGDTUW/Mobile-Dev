import 'package:flutter/material.dart';
import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _peopleController = TextEditingController();

  double _totalAmount = 0.0;
  int _numberOfPeople = 1;
  double _tipPercentage = 0.0;
  double _perPersonAmount = 0.0;
  bool _showResult = false;

  late AnimationController _pulseController;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _peopleController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  // TODO: BEGINNER ISSUE #1 - Add tip calculation (5%, 10%, 15%)
  // Currently hardcoded to 0%, need to add tip buttons
  void _calculateSplit() {
    final amountText = _amountController.text.trim();
    final peopleText = _peopleController.text.trim();
    
    // Check for empty fields
    if (amountText.isEmpty || peopleText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please fill in all fields'),
        ),
      );
      return;
    }
    
    final double? amount = double.tryParse(amountText);
    final int? people = int.tryParse(peopleText);
    
    // Check for invalid numbers
    if (amount == null || people == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter only valid numeric values'),
        ),
      );
      return;
    }
    
    // Check for zero or negative values
    if (amount <= 0 || people <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Amount and number of people must be greater than zero'),
        ),
      );
      return;
    }
    
    // Safe to calculate
    setState(() {
      _totalAmount = amount;
      _numberOfPeople = people;
      
      double totalWithTip =
        _totalAmount + (_totalAmount * _tipPercentage / 100);
      
      _perPersonAmount = totalWithTip / _numberOfPeople;
      _showResult = true;
    });
  }


  // TODO: ADVANCED ISSUE #11 - Integrate ML Kit for text recognition
  // This function should open camera and extract bill amount
  void _scanBill() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('📸 Camera & ML Kit integration needed!'),
        backgroundColor: AppColors.primaryPurple,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
    // TODO: INTERMEDIATE ISSUE #6 - Add camera functionality
    // Use image_picker to open camera

    // TODO: ADVANCED ISSUE #12 - Parse receipt intelligently
    // Extract total, tax, items from scanned image
  }

  // TODO: INTERMEDIATE ISSUE #7 - Implement WhatsApp sharing
  // Use share_plus package to share results
  void _shareResults() {
    String message = '💰 SplitSmart Bill Split\n\n'
        'Total: ₹${_totalAmount.toStringAsFixed(2)}\n'
        'People: $_numberOfPeople\n'
        'Per Person: ₹${_perPersonAmount.toStringAsFixed(2)}';

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('💬 WhatsApp share feature coming soon!'),
        backgroundColor: AppColors.accentGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
    // Implement share_plus here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(gradient: AppColors.backgroundGradient),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                const SizedBox(height: AppSpacing.xl),
                _buildScanCard(),
                const SizedBox(height: AppSpacing.lg),
                _buildInputCard(),
                const SizedBox(height: AppSpacing.lg),
                _buildTipSection(),
                const SizedBox(height: AppSpacing.lg),
                _buildCalculateButton(),
                if (_showResult) ...[
                  const SizedBox(height: AppSpacing.xl),
                  _buildResultCard(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShaderMask(
          shaderCallback: (bounds) =>
              AppColors.primaryGradient.createShader(bounds),
          child: const Text(
            '💰 SplitSmart',
            style: AppTextStyles.headline1,
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Split bills the smart way',
          style: AppTextStyles.body2.copyWith(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildScanCard() {
    return ScaleTransition(
      scale: _pulseAnimation,
      child: Container(
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryPurple.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: _scanBill,
            borderRadius: BorderRadius.circular(AppRadius.lg),
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                      size: 32,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Scan Your Bill',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'AI will read the amount for you',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputCard() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Bill Details',
            style: AppTextStyles.headline2,
          ),
          const SizedBox(height: AppSpacing.md),
          _buildTextField(
            controller: _amountController,
            label: 'Total Amount',
            hint: '₹ 0.00',
            icon: Icons.receipt_long_rounded,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: AppSpacing.md),
          _buildTextField(
            controller: _peopleController,
            label: 'Number of People',
            hint: '1',
            icon: Icons.people_rounded,
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    required TextInputType keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.body1.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppSpacing.sm),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: AppTextStyles.body1,
          decoration: InputDecoration(
            hintText: hint,
            prefixIcon: Icon(icon, color: AppColors.primaryPurple),
            filled: true,
            fillColor: AppColors.backgroundGradient.colors[0],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              borderSide:
                  const BorderSide(color: AppColors.primaryPurple, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTipSection() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppRadius.lg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add Tip',
            style: AppTextStyles.headline2,
          ),
          const SizedBox(height: AppSpacing.md),
          // TODO: BEGINNER ISSUE #1 - Create functional tip buttons
          // These are placeholder buttons, need to update _tipPercentage
          Row(
            children: [
              Expanded(child: _buildTipButton('5%', 5)),
              const SizedBox(width: AppSpacing.sm),
              Expanded(child: _buildTipButton('10%', 10)),
              const SizedBox(width: AppSpacing.sm),
              Expanded(child: _buildTipButton('15%', 15)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTipButton(String label, double percentage) {
    bool isSelected = _tipPercentage == percentage;
    return Material(
      color: isSelected ? AppColors.primaryPurple : Colors.grey[200],
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: InkWell(
        onTap: () {
          setState(() {
            _tipPercentage = isSelected ? 0 : percentage;
          });
        },
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.md),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.textSecondary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCalculateButton() {
    return Container(
      width: double.infinity,
      height: 56,
      decoration: BoxDecoration(
        gradient: AppColors.accentGradient,
        borderRadius: BorderRadius.circular(AppRadius.md),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: _calculateSplit,
          borderRadius: BorderRadius.circular(AppRadius.md),
          child: const Center(
            child: Text(
              'Calculate Split',
              style: AppTextStyles.button,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultCard() {
    return TweenAnimationBuilder(
      duration: const Duration(milliseconds: 500),
      tween: Tween<double>(begin: 0, end: 1),
      builder: (context, double value, child) {
        return Transform.scale(
          scale: value,
          child: Opacity(
            opacity: value,
            child: Container(
              padding: const EdgeInsets.all(AppSpacing.xl),
              decoration: BoxDecoration(
                gradient: AppColors.primaryGradient,
                borderRadius: BorderRadius.circular(AppRadius.lg),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryPurple.withOpacity(0.3),
                    blurRadius: 30,
                    offset: const Offset(0, 15),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Each Person Pays',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    '₹${_perPersonAmount.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.md),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(AppRadius.md),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildResultDetail(
                            'Total', '₹${_totalAmount.toStringAsFixed(2)}'),
                        Container(width: 1, height: 30, color: Colors.white30),
                        _buildResultDetail('People', '$_numberOfPeople'),
                        Container(width: 1, height: 30, color: Colors.white30),
                        _buildResultDetail('Tip', '${_tipPercentage.toInt()}%'),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  ElevatedButton.icon(
                    onPressed: _shareResults,
                    icon: const Icon(Icons.share_rounded),
                    label: const Text('Share on WhatsApp'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: AppColors.primaryPurple,
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                        vertical: AppSpacing.md,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppRadius.md),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildResultDetail(String label, String value) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
