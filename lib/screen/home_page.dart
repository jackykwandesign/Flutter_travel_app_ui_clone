import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:travel_2/widgets/destination_carosell.widget.dart';
import 'package:travel_2/widgets/hotel_carosell.widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTabIndex = 0;
  int selectedIndex = 0;
  final List<IconData> _icons = [
    Icons.airplane_ticket,
    Icons.car_crash,
    Icons.bed,
    Icons.point_of_sale,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? Theme.of(context).colorScheme.secondary
              : const Color(0xFFE7EBEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Icon(
          _icons[index],
          size: 25,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'What would you like to find ?',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: _icons
                  .asMap()
                  .entries
                  .map((MapEntry e) => _buildIcon(e.key))
                  .toList(),
            ),
            // SizedBox(
            //   height: 60,
            //   child: ListView.separated(
            //     scrollDirection: Axis.horizontal,
            //     itemCount: _icons.length,
            //     separatorBuilder: (BuildContext context, int index) =>
            //         const Divider(),
            //     itemBuilder: (BuildContext context, int index) {
            //       return _buildIcon(index);
            //     },
            //   ),
            // ),
            const SizedBox(
              height: 20,
            ),
            const DestinationCarosell(),
            const SizedBox(
              height: 20,
            ),
            const HotelCarosell(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedTabIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15,
                // for backup if can not resolve child
                backgroundImage: NetworkImage(
                    'https://www.santosfood.com/wp-content/uploads/2020/01/img-7.jpg'),

                foregroundImage: AssetImage('assets/images/user_icon.jpg'),
              ),
              label: ''),
        ],
        onTap: (int newTabIndex) {
          setState(() {
            selectedTabIndex = newTabIndex;
          });
        },
      ),
    );
  }
}
