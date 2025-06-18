import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'login_screen.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  int _currentIndex = 0;

  final List<Map<String, String>> carouselItems = [
    {
      'image': 'assets/images/financial.jpg',
      'text': 'Secure Your Financial Future',
      'subText': 'Plan wisely with expert guidance',
    },
    {
      'image': 'assets/images/financial.jpg',
      'text': 'Grow Your Wealth',
      'subText': 'Personalized investment strategies',
    },
    {
      'image': 'assets/images/financial.jpg',
      'text': 'Achieve Your Goals',
      'subText': 'Tailored advice for success',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              height: MediaQuery.of(context).size.height,
              autoPlay: false,
              viewportFraction: 1.0,
              enableInfiniteScroll: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
            items:
                carouselItems.map((item) {
                  return Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        item['image']!,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => Container(
                              color: Colors.grey,
                              child: const Center(
                                child: Text('Image not found'),
                              ),
                            ),
                      ),
                      Container(color: Colors.black.withOpacity(0.5)),
                      Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Container(
                          margin: const EdgeInsets.only(top: 100.0),
                          // Adjust the top margin here
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                item['text']!,
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16),
                              Text(
                                item['subText']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white70,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
          ),
          Positioned(
            top: 48,
            right: 24,
            child:
                _currentIndex != 2
                    ? TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                    : const SizedBox(),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                      carouselItems.asMap().entries.map((entry) {
                        return Container(
                          width: 8.0,
                          height: 8.0,
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color:
                                _currentIndex == entry.key
                                    ? const Color(0xFF1A237E)
                                    : Colors.white.withOpacity(0.5),
                          ),
                        );
                      }).toList(),
                ),
                if (_currentIndex == 2) ...[
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A237E),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 16,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Get Started'),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
