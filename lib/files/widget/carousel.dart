// ignore_for_file: file_names, non_constant_identifier_names
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});
  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  // image url address
  final List<String> Imageurl = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnw0wPQPJncdx5VAAQVhi2TXGdJBq9oSjDMg&usqp=CAU", //patrick
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCVdu8w9R-GJMTztbDfCwnIaTyQu608W6_Vw&usqp=CAU", //spongebob
    "https://images.unsplash.com/photo-1543721241-adfe6a33fd2e?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fGRvbGx8ZW58MHx8MHx8fDA%3D" //2 doll
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                ),
                items: Imageurl.map((Url) {
                  return Builder(builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 6.0),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 33, 133, 161),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.network(Url, fit: BoxFit.cover),
                      ),
                    );
                  });
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
