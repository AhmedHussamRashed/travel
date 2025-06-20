import 'package:flutter/material.dart';
import '../utils/app_styles.dart';
import '../widgets/car_card.dart';
import '../widgets/wave_background.dart';
import 'car_details_screen.dart';
import 'filter_screen.dart';

class CarSearchScreen extends StatefulWidget {
  const CarSearchScreen({super.key});

  @override
  State<CarSearchScreen> createState() => _CarSearchScreenState();
}

class _CarSearchScreenState extends State<CarSearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _cars = [
    {
      'name': 'Kia Picanto',
      'price': '180 Riyals/Day',
      'image': 'assets/images/kia_picanto.jpg',
      'rating': 4.5,
      'features': ['Air conditioning', 'anti-theft', '4 doors', 'small bag'],
      'transmission': 'Automatic',
      'fuel': 'Gasoline',
      'year': '2023',
    },
    {
      'name': 'Renault Logan',
      'price': '200 Riyals/Day',
      'image': 'assets/images/renault_logan.jpg',
      'rating': 4.2,
      'features': ['Air conditioning', 'anti-theft', '4 doors', 'small bag'],
      'transmission': 'Manual',
      'fuel': 'Gasoline',
      'year': '2022',
    },
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
                    child: Column(
                      children: [
                        // شريط التنقل العلوي
                        Row(
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
                                'Saudi Arabia / Riyadh',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const FilterScreen(),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.tune,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // شريط البحث
                        Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(25),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: TextField(
                            controller: _searchController,
                            textAlign: TextAlign.right,
                            decoration: const InputDecoration(
                              hintText: 'Find a car...',
                              prefixIcon: Icon(Icons.search, color: AppColors.primaryBlue),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // قائمة السيارات
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _cars.length,
              itemBuilder: (context, index) {
                final car = _cars[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: CarCard(
                    car: car,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarDetailsScreen(car: car),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

