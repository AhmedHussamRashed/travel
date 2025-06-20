import 'package:flutter/material.dart';
import '../utils/app_styles.dart';

class CarCard extends StatelessWidget {
  final Map<String, dynamic> car;
  final VoidCallback onTap;

  const CarCard({
    super.key,
    required this.car,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة السيارة
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.lightGray.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  car['image'],
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.directions_car,
                      size: 60,
                      color: AppColors.primaryBlue,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 12),
            // اسم السيارة
            Text(
              car['name'],
              style: AppTextStyles.heading2,
            ),
            const SizedBox(height: 4),
            // السعر
            Text(
              car['price'],
              style: AppTextStyles.bodyText.copyWith(
                color: AppColors.primaryBlue,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            // التقييم والميزات
            Row(
              children: [
                const Icon(Icons.star, color: AppColors.orange, size: 16),
                const SizedBox(width: 4),
                Text(
                  car['rating'].toString(),
                  style: AppTextStyles.caption,
                ),
                const Spacer(),
                // أيقونات الميزات
                Row(
                  children: [
                    _buildFeatureIcon(Icons.ac_unit, 'Conditioning'),
                    const SizedBox(width: 8),
                    _buildFeatureIcon(Icons.security, 'Preventer'),
                    const SizedBox(width: 8),
                    _buildFeatureIcon(Icons.door_front_door, '4 Door'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String tooltip) {
    return Tooltip(
      message: tooltip,
      child: Icon(
        icon,
        size: 16,
        color: AppColors.primaryBlue,
      ),
    );
  }
}

