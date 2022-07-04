import 'package:flutter/material.dart';
import 'package:travel_2/model/destination.model.dart';
import 'package:travel_2/screen/destination_page.dart';

class DestinationCarosell extends StatelessWidget {
  const DestinationCarosell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top Destinations',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
              GestureDetector(
                onTap: () {
                  debugPrint('See All clicked');
                },
                child: Text(
                  'Set All',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ],
          ),
        ),
        // const SizedBox(
        //   height: 20,
        // ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: destinations.length,
            itemBuilder: (_, int index) {
              Destination dest = destinations[index];
              return GestureDetector(
                onTap: (() {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return DestinationPage(dest: dest);
                  }));
                }),
                child: Container(
                  width: 200,
                  margin: const EdgeInsets.all(10),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      // description text
                      Positioned(
                        bottom: 15,
                        child: Container(
                          height: 120,
                          width: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${dest.activities.length} activities',
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                Text(
                                  dest.description,
                                  style: const TextStyle(color: Colors.grey),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Image box
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 26,
                            )
                          ],
                        ),
                        child: Stack(
                          children: [
                            // Image
                            Hero(
                              tag: dest.imageURL,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  dest.imageURL,
                                  width: 180,
                                  height: 180,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // City & Country text
                            Positioned(
                              bottom: 10,
                              left: 10,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dest.city,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.2,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.place_outlined,
                                        size: 10,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        dest.country,
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
