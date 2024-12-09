import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SliderPage(),
    );
  }
}

class SliderPage extends StatefulWidget {
  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  final PageController _pageController = PageController();
  final List<String> _images = [
    "image/t1.png",
    "image/t2.jpeg",
    "image/tamnel.png",
  ];
  int _currentIndex = 0;
  Timer? _sliderTimer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _sliderTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if (_currentIndex < _images.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
      _pageController.animateToPage(
        _currentIndex,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _sliderTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: SizedBox(
          height: 40,
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.blue[300]),
              hintText: 'Search...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
              isDense: true,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.message, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          // Slider Gambar
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              itemCount: _images.length,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Image.asset(
                  _images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          // Tombol Ikon
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                buildButton(Icons.access_alarm_sharp),
                buildButton(Icons.ads_click),
                buildButton(Icons.card_giftcard),
                buildButton(Icons.account_balance_wallet_rounded),
                buildButton(Icons.add_card_outlined),
                buildButton(Icons.airplanemode_active),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildCard("image/sepatu.jpeg", "Sepatu Kets",
                        "Nyaman untuk dipakai sehari-hari", "Rp 400K"),
                    buildCard("image/tas.jpeg", "Tas Fashion",
                        "Modis dan elegan", "Rp 250K"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildCard("image/jam.jpeg", "Jam Tangan",
                        "Tampil gaya setiap waktu", "Rp 700K"),
                    buildCard("image/baju.jpeg", "Baju Kasual",
                        "Cocok untuk santai", "Rp 300K"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    buildCard("image/jam.jpeg", "Jam Tangan",
                        "Tampil gaya setiap waktu", "Rp 700K"),
                    buildCard("image/baju.jpeg", "Baju Kasual",
                        "Cocok untuk santai", "Rp 300K"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        backgroundColor: Colors.blue[600],
        currentIndex: 0,
        onTap: (index) {
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Card buildButton(IconData iconData) {
    return Card(
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          iconData,
          color: Colors.blue[300],
        ),
      ),
    );
  }

  Container buildCard(String img, String text, String des, String harga) {
    return Container(
      width: 190,
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Center(
              child: Container(
                width: 150,
                height: 150,
                child: Image.asset(
                  img,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 20,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  harga,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: 50,
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20, left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: Text(
                      des,
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
