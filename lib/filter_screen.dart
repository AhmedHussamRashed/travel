import 'package:flutter/material.dart';
import '../utils/app_styles.dart';
import '../widgets/wave_background.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String _selectedSize = 'Medium';
  String _selectedTransmission = 'Automatic';
  String _selectedCategory = 'Economic';
  Color _selectedColor = AppColors.red;
  double _engineCapacity = 2500;

  final List<String> _sizes = ['large', 'medium', 'small'];
  final List<String> _transmissions = ['manual', 'automatic'];
  final List<String> _categories = ['Sporty', 'Mixture', 'Economical', 'Convertible'];
  final List<Color> _colors = [
    AppColors.red,
    AppColors.yellow,
    AppColors.primaryBlue,
    AppColors.purple,
    AppColors.lightBlue,
    AppColors.green,
    AppColors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // الجزء العلوي مع الخلفية المموجة
          Container(
            height: 200,
            child: Stack(
              children: [
                const WaveBackground(),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: AppColors.white,
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            'Filtering',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // محتوى الفلاتر
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // حجم السيارة
                  const Text(
                    'Car size',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: _sizes.map((size) {
                      final isSelected = _selectedSize == size;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedSize = size;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primaryBlue
                                    : AppColors.lightGray,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                size,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.bodyText.copyWith(
                                  color: isSelected
                                      ? AppColors.white
                                      : AppColors.textDark,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  // ناقل الحركة
                  const Text(
                    'Transmission',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: _transmissions.map((transmission) {
                      final isSelected = _selectedTransmission == transmission;
                      return Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTransmission = transmission;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primaryBlue
                                    : AppColors.lightGray,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                transmission,
                                textAlign: TextAlign.center,
                                style: AppTextStyles.bodyText.copyWith(
                                  color: isSelected
                                      ? AppColors.white
                                      : AppColors.textDark,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  // الفئة
                  const Text(
                    'Category',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _categories.map((category) {
                      final isSelected = _selectedCategory == category;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedCategory = category;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primaryBlue
                                : AppColors.lightGray,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            category,
                            style: AppTextStyles.bodyText.copyWith(
                              color: isSelected
                                  ? AppColors.white
                                  : AppColors.textDark,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  // اللون
                  const Text(
                    'Color',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: _colors.map((color) {
                      final isSelected = _selectedColor == color;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedColor = color;
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: color,
                            shape: BoxShape.circle,
                            border: isSelected
                                ? Border.all(
                              color: AppColors.textDark,
                              width: 3,
                            )
                                : null,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  // سعة المحرك
                  const Text(
                    'Engine capacity',
                    style: AppTextStyles.heading2,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Text('2000 CC'),
                      Expanded(
                        child: Slider(
                          value: _engineCapacity,
                          min: 2000,
                          max: 4000,
                          divisions: 4,
                          activeColor: AppColors.primaryBlue,
                          onChanged: (value) {
                            setState(() {
                              _engineCapacity = value;
                            });
                          },
                        ),
                      ),
                      const Text('4000 CC'),
                    ],
                  ),
                  Text(
                    '${_engineCapacity.round()} CC',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.bodyText.copyWith(
                      color: AppColors.primaryBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // زر التطبيق
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        elevation: 5,
                      ),
                      child: const Text(
                        'Apply filters',
                        style: AppTextStyles.buttonText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

