import 'package:flutter/material.dart';
import '../utils/app_styles.dart';       // والألوان
import '../widgets/car_card.dart';       // هذا ويدجيت لعرض بطاقة السيارة
import '../widgets/wave_background.dart'; // خلفية مموجة
import 'car_details_screen.dart';   // شاشة تفاصيل السيارة
import 'filter_screen.dart';      // شاشة الفلتر

class CarSearchScreen extends StatefulWidget {
  const CarSearchScreen({super.key});

  @override
  State<CarSearchScreen> createState() => _CarSearchScreenState();
}

class _CarSearchScreenState extends State<CarSearchScreen> {
  final TextEditingController _searchController = TextEditingController();


  final List<Map<String, dynamic>> _cars = [ // قائمة اليارة تحتوي على
    {
      'name': 'Toyota Land Cruiser 2024',
      'price': '350 Riyals/Day',
      'image': 'assets/images/toyota_2024.webp',
      'rating': 4.8,
      'features': ['Air conditioning', 'GPS', '7 seats', 'Large trunk'],
      'transmission': 'Automatic',
      'fuel': 'Gasoline',
      'year': '2024',
    },
    {
      'name': 'Hyundai Tucson 2025',
      'price': '280 Riyals/Day',
      'image': 'assets/images/hyundai_2025.webp',
      'rating': 4.6,
      'features': ['Air conditioning', 'Bluetooth', '5 seats', 'Medium trunk'],
      'transmission': 'Automatic',
      'fuel': 'Gasoline',
      'year': '2025',
    },
    {
      'name': 'Mercedes-Benz EQS 2025',
      'price': '600 Riyals/Day',
      'image': 'assets/images/mercedes_eqs_2025.jpg',
      'rating': 4.9,
      'features': [
        'Premium interior',
        'Electric',
        'Advanced safety',
        'Panoramic roof'
      ],
      'transmission': 'Automatic',
      'fuel': 'Electric',
      'year': '2025',
    },
    {
      'name': 'BMW XM',
      'price': '550 Riyals/Day',
      'image': 'assets/images/bmw_xm.jpg',
      'rating': 4.7,
      'features': [
        'Sport package',
        'Luxury interior',
        'Hybrid',
        'High performance'
      ],
      'transmission': 'Automatic',
      'fuel': 'Hybrid',
      'year': '2024',
    },
    {
      'name': 'Ford Taurus 2025',
      'price': '300 Riyals/Day',
      'image': 'assets/images/ford_taurus.jpg',
      'rating': 4.4,
      'features': [
        'Spacious interior',
        'Comfortable ride',
        'Modern tech',
        'Large trunk'
      ],
      'transmission': 'Automatic',
      'fuel': 'Gasoline',
      'year': '2025',
    },
    {
      'name': 'Kia Sportage',
      'price': '250 Riyals/Day',
      'image': 'assets/images/kia_car.webp',
      'rating': 4.3,
      'features': ['Air conditioning', 'Sunroof', '5 seats', 'Medium trunk'],
      'transmission': 'Automatic',
      'fuel': 'Gasoline',
      'year': '2023',
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
                              prefixIcon: Icon(
                                  Icons.search, color: AppColors.primaryBlue),
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

}

