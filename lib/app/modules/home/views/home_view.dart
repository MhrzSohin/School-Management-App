import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final List<String> items = [
    "Students",
    "Teachers",
    "Attendance",
    "Syllabus",
    "Time Table",
    "Assignments",
    "Exams",
    "Results",
    "Fees",
    "Events",
    "Inbox",
    "Ask Doubt"
  ];
  final List<String> imagePaths = [
    'assets/student.png',
    'assets/teacher.png',
    'assets/attend.png',
    'assets/syallabus.png',
    'assets/timetable.png',
    'assets/Assignment.png',
    'assets/exam.png',
    'assets/results.png',
    'assets/fee.png',
    'assets/event.png',
    'assets/inbox.png',
    'assets/ask.png'
  ];
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height,
      width: Get.width,
      color: const Color.fromARGB(255, 239, 238, 238),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
        child: Column(
          children: [
            Container(
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Hello",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  Row(
                    children: [
                      Text(
                        "Michael Smith",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      Icon(Icons.notifications_none),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Academics",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        child: LayoutBuilder(builder: (context, constraints) {
                      int crossAxisCount = 3;
                      if (constraints.maxWidth > 600) {
                        crossAxisCount = 4;
                        if (constraints.maxWidth > 900) {
                          crossAxisCount = 5;
                        }
                      }
                      return GridView.builder(
                          shrinkWrap: true, //prevent overflow issues
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            childAspectRatio: 1,
                          ),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content:
                                        Text('You clicked on ${items[index]}'),
                                    duration: Duration(milliseconds: 500),
                                  ),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      blurRadius: 6,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.asset(
                                        imagePaths[index],
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      items[index],
                                      style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 85, 85, 85),
                                        fontSize: 15,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    })),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
