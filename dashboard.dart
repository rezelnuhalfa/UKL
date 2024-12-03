import 'dart:async';
import 'package:flutter/material.dart';
import 'movie.dart';
import 'cinema.dart';
import 'booking.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<String> bannerImages = [
    'assets/istrimuda.jpg',
    'assets/ketua.jpg',
    'assets/moana.jpg',
  ];

  final List<String> nowShowingImages = [
    'assets/evenjer.jpg',
    'assets/moai.jpeg',
    'assets/mrs.jpg',
    'assets/upin apin.jpg',
    'assets/mencref.jpg',
  ];

  final List<String> upcomingImages = [
    'assets/sonik.jpg',
    'assets/kreven.jpg',
    'assets/sepidermen.jpg',
    'assets/doom.jpg',
    'assets/timnas.jpg',
  ];

  final List<String> promotionImages = [
    'assets/malam.jpg',
    'assets/pop.jpg',
    'assets/lego.jpg',
  ];

  late final PageController _bannerController;
  late final PageController _nowShowingController;
  late final PageController _upcomingController;

  int _currentPage = 0;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _bannerController = PageController(initialPage: 2);
    _nowShowingController = PageController(viewportFraction: 0.3);
    _upcomingController = PageController(viewportFraction: 0.3);

    Timer.periodic(Duration(seconds: 5), (timer) {
      if (_currentPage < bannerImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _bannerController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _bannerController.dispose();
    _nowShowingController.dispose();
    _upcomingController.dispose();
    super.dispose();
  }

  Widget buildZoomablePageView({
    required List<String> images,
    required PageController controller,
    double height = 250,
  }) {
    return SizedBox(
      height: height, 
      child: PageView.builder(
        controller: controller,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              double value = 1.0;
              if (controller.position.haveDimensions) {
                value = controller.page! - index;
                value = (1 - value.abs() * 0.2).clamp(0.8, 1.0);
              }
              return Center(
                child: Transform.scale(
                  scale: value,
                  child: child,
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.location_on_outlined,
                    color: const Color.fromARGB(255, 0, 0, 0)),
                SizedBox(width: 5),
                Text(
                  "Malang",
                  style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
                Icon(Icons.arrow_drop_down, color: Colors.black),
              ],
            ),
            SizedBox(height: 4),
          ],
        ),
        actions: [
          Icon(Icons.favorite_border, color: Color.fromARGB(255, 31, 0, 145)),
          Icon(Icons.notifications, color: Color.fromARGB(255, 31, 0, 145)),
          Icon(Icons.account_circle, color: Color.fromARGB(255, 31, 0, 145))
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hai Guest',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Mau nonton apa hari ini?',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            buildZoomablePageView(
              images: bannerImages,
              controller: _bannerController,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Now Showing',
                style: TextStyle(
                  color: Color.fromARGB(255, 2, 0, 122),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buildZoomablePageView(
              images: nowShowingImages,
              controller: _nowShowingController,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Upcoming',
                style: TextStyle(
                  color: Color.fromARGB(255, 2, 0, 122),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            buildZoomablePageView(
              images: upcomingImages,
              controller: _upcomingController,
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Promotion',
                style: TextStyle(
                  color: Color.fromARGB(255, 2, 0, 122),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 180, 
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: promotionImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: AspectRatio(
                      aspectRatio: 16 /
                          9, 
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          promotionImages[index],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromARGB(255, 2, 0, 122),
        selectedItemColor: Color.fromARGB(255, 2, 0, 122),
        unselectedItemColor: const Color.fromARGB(179, 36, 36, 36),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online),
            label: 'My Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.theaters),
            label: 'Cinema',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookingPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MoviesPage()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CinemaPage()),
            );
          }
        },
      ),
    );
  }
}
