import 'package:flutter/material.dart';
import 'package:flutter_application_1/cinema.dart';
import 'package:flutter_application_1/dashboard.dart';
import 'package:flutter_application_1/movie.dart';


class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyBookingPage(),
    );
  }
}

class MyBookingPage extends StatelessWidget {
  const MyBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Booking',style: TextStyle(color: Color.fromARGB(255, 0, 18, 177)),),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.timer_outlined),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              "There's no active booking!",
              style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 0, 0, 0)),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: const [
                BookingCard(
                  imagePath: 'assets/istrimuda.jpg',
                  title: 'GunaGuna Istri Muda',
                  category: 'Romance',
                  rating: 9.5,
                  ageRating: '17+',
                ),
                BookingCard(
                  imagePath: 'assets/Moana.jpg',
                  title: 'Moana',
                  category: 'Action, Adventure,Animation',
                  rating: 9.3,
                  ageRating: 'SU',
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
         backgroundColor: Color.fromARGB(255, 2, 0, 122),
        selectedItemColor: Color.fromARGB(255, 2, 0, 122),
        unselectedItemColor: const Color.fromARGB(179, 36, 36, 36),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_online_outlined),
            label: 'My Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.theaters),
            label: 'Cinema',
          ),
        ],
         onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DashboardPage()),
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

class BookingCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String category;
  final double rating;
  final String ageRating;

  const BookingCard({
    required this.imagePath,
    required this.title,
    required this.category,
    required this.rating,
    required this.ageRating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  category,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        ageRating,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,
                    ),
                    const Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 16,),
                      


                    Text(
                      '$rating',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
